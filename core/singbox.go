package main

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	M "github.com/sagernet/sing/common/metadata"
	"net"
	"os"
	"runtime"
	"strings"
	"sync"
	"time"

	"github.com/gofrs/uuid/v5"
	box "github.com/sagernet/sing-box"
	SA "github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/common/trafficcontrol"
	"github.com/sagernet/sing-box/common/urltest"
	"github.com/sagernet/sing-box/experimental"
	"github.com/sagernet/sing-box/experimental/clashapi"
	"github.com/sagernet/sing-box/experimental/clashmode"
	"github.com/sagernet/sing-box/include"
	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing-box/protocol/group"
	SJ "github.com/sagernet/sing/common/json"
	"github.com/sagernet/sing/service"
)

func init() { experimental.RegisterClashServerConstructor(clashapi.NewServer) }

type singboxEnvelope struct {
	Core          string          `json:"fastai-core"`
	Configuration json.RawMessage `json:"configuration"`
}

type singboxRuntime struct {
	sync.RWMutex
	instance              *box.Box
	cancel                context.CancelFunc
	ctx                   context.Context
	configuration         json.RawMessage
	selected              map[string]string
	previousTraffic       Traffic
	trafficBaseline       Traffic
	sampledAt             time.Time
	notificationTraffic   Traffic
	notificationSampledAt time.Time
	running               bool
}

var singbox singboxRuntime

func decodeSingbox(data []byte) (*singboxEnvelope, bool, error) {
	var envelope singboxEnvelope
	if json.Unmarshal(data, &envelope) != nil || envelope.Core != "sing-box" {
		return nil, false, nil
	}
	if runtime.GOOS != "windows" && runtime.GOOS != "android" && runtime.GOOS != "darwin" && runtime.GOOS != "linux" {
		return nil, true, errors.New("sing-box is currently supported on Windows, Android, macOS and Linux only")
	}
	if len(envelope.Configuration) == 0 {
		return nil, true, errors.New("missing sing-box configuration")
	}
	return &envelope, true, nil
}

func newSingbox(data []byte, running bool) (*box.Box, context.Context, context.CancelFunc, error) {
	return newSingboxWithMode(data, running, "")
}

func newSingboxWithMode(data []byte, running bool, restoredMode string) (*box.Box, context.Context, context.CancelFunc, error) {
	ctx, cancel := context.WithCancel(singboxPlatformContext(service.ContextWithDefaultRegistry(include.Context(context.Background()))))
	var options option.Options
	if err := SJ.UnmarshalContext(ctx, data, &options); err != nil {
		cancel()
		return nil, nil, nil, err
	}
	for _, outbound := range options.Outbounds {
		if outbound.Type == "naive" {
			if err := prepareNaive(); err != nil {
				cancel()
				return nil, nil, nil, err
			}
		}
	}
	if !running {
		options.Inbounds = nil
	}
	if err := configureSingboxPlatform(&options, running); err != nil {
		cancel()
		return nil, nil, nil, err
	}
	mode := "Rule"
	if options.Experimental != nil && options.Experimental.ClashAPI != nil {
		mode = options.Experimental.ClashAPI.DefaultMode
	}
	if restoredMode != "" {
		mode = restoredMode
	}
	options.Experimental = &option.ExperimentalOptions{ClashAPI: &option.ClashAPIOptions{DefaultMode: mode}}
	if err := configureSingboxRules(&options, homeDirectory); err != nil {
		cancel()
		return nil, nil, nil, err
	}
	// The app bridge owns control; never expose a separate management endpoint.
	options.Log = &option.LogOptions{Disabled: true}
	instance, err := box.New(box.Options{Context: ctx, Options: options})
	if err != nil {
		cancel()
		return nil, nil, nil, err
	}
	return instance, ctx, cancel, nil
}

func validateSingbox(data []byte) error {
	envelope, detected, err := decodeSingbox(data)
	if err != nil {
		return err
	}
	if !detected {
		return errors.New("invalid sing-box envelope")
	}
	instance, _, cancel, err := newSingbox(envelope.Configuration, false)
	if err != nil {
		return err
	}
	defer cancel()
	return instance.Close()
}

func (s *singboxRuntime) closeLocked() error {
	if s.cancel != nil {
		s.cancel()
		s.cancel = nil
	}
	s.ctx = nil
	if s.instance == nil {
		return nil
	}
	err := s.instance.Close()
	s.instance = nil
	return err
}

func (s *singboxRuntime) resetSamplesLocked() {
	s.previousTraffic = Traffic{}
	s.trafficBaseline = Traffic{}
	s.sampledAt = time.Now()
	s.notificationTraffic = Traffic{}
	s.notificationSampledAt = s.sampledAt
}

func (s *singboxRuntime) picksLocked() map[string]string {
	picks := make(map[string]string, len(s.selected))
	for name, pick := range s.selected {
		picks[name] = pick
	}
	if s.instance != nil {
		for _, outbound := range s.instance.Outbound().Outbounds() {
			if group, ok := outbound.(SA.OutboundGroup); ok {
				picks[outbound.Tag()] = group.Now()
			}
		}
	}
	return picks
}

func (s *singboxRuntime) replaceLocked(data []byte, selected map[string]string, running bool) error {
	candidate, ctx, cancel, err := newSingbox(data, running)
	if err != nil {
		return err
	}
	previousPicks := s.picksLocked()
	previousMode := ""
	if s.ctx != nil {
		previousMode = service.PtrFromContext[clashmode.Manager](s.ctx).Mode()
	}
	if err = s.closeLocked(); err != nil {
		cancel()
		candidate.Close()
		return err
	}
	if err = candidate.Start(); err != nil {
		cancel()
		candidate.Close()
		if s.configuration != nil {
			restored, oldCtx, oldCancel, restoreErr := newSingboxWithMode(s.configuration, s.running, previousMode)
			if restoreErr == nil {
				restoreErr = restored.Start()
				if restoreErr == nil {
					s.instance = restored
					s.ctx = oldCtx
					s.cancel = oldCancel
					s.selected = previousPicks
					s.resetSamplesLocked()
					for name, pick := range previousPicks {
						outbound, _ := restored.Outbound().Outbound(name)
						if selector, ok := outbound.(*group.Selector); ok {
							selector.SelectOutbound(pick)
						}
					}
				} else {
					oldCancel()
					restored.Close()
				}
			}
			if restoreErr != nil {
				return fmt.Errorf("apply failed: %w; restore failed: %v", err, restoreErr)
			}
		}
		return err
	}
	s.instance = candidate
	s.ctx = ctx
	s.cancel = cancel
	s.running = running
	s.configuration = append(json.RawMessage(nil), data...)
	s.selected = map[string]string{}
	for name, pick := range selected {
		s.selected[name] = pick
	}
	for name, pick := range selected {
		outbound, ok := candidate.Outbound().Outbound(name)
		if !ok {
			continue
		}
		if selector, ok := outbound.(*group.Selector); ok {
			selector.SelectOutbound(pick)
		}
	}
	s.resetSamplesLocked()
	return nil
}

func singboxPicks() (map[string]string, bool) {
	singbox.RLock()
	defer singbox.RUnlock()
	if singbox.configuration == nil {
		return nil, false
	}
	return singbox.picksLocked(), true
}

func singboxListeners(running bool) (bool, error) {
	singbox.Lock()
	defer singbox.Unlock()
	if singbox.configuration == nil {
		return false, nil
	}
	picks := singbox.picksLocked()
	return true, singbox.replaceLocked(singbox.configuration, picks, running)
}

func singboxProxiesLocked() ProxiesData {
	views := map[string]any{}
	names := []string{}
	if singbox.instance != nil {
		for _, outbound := range singbox.instance.Outbound().Outbounds() {
			kind := outbound.Type()
			if kind == "selector" {
				kind = "Selector"
			}
			if kind == "urltest" {
				kind = "URLTest"
			}
			view := map[string]any{"name": outbound.Tag(), "type": kind}
			if group, ok := outbound.(SA.OutboundGroup); ok {
				view["all"] = group.All()
				view["now"] = group.Now()
				names = append(names, outbound.Tag())
			}
			views[outbound.Tag()] = view
		}
	}
	return ProxiesData{All: names, Proxies: views}
}

func handleSingboxMethod(call *MethodCall, response MethodResponse) bool {
	switch call.Method {
	case getProxiesMethod, changeProxyMethod, getTrafficMethod, getTotalTrafficMethod, resetTrafficMethod,
		getConnectionsMethod, getConnectionCountMethod, closeConnectionsMethod, resetConnectionsMethod, closeConnectionMethod,
		getExternalProvidersMethod, getExternalProviderMethod, updateExternalProviderMethod, sideLoadExternalProviderMethod:
	default:
		return false
	}
	singbox.Lock()
	if singbox.configuration == nil {
		singbox.Unlock()
		return false
	}
	result, methodErr, changed := func() (any, *MethodError, bool) {
		defer singbox.Unlock()
		return singboxMethodLocked(call)
	}()
	if changed {
		refreshRoute()
	}
	if methodErr != nil {
		response.failure(methodErr.Code, methodErr.Message, methodErr.Details)
	} else {
		response.success(result)
	}
	return true
}

func singboxMethodLocked(call *MethodCall) (any, *MethodError, bool) {
	if singbox.instance == nil {
		return nil, &MethodError{Code: "core_unavailable", Message: "sing-box is not running"}, false
	}
	invalidArguments := func(err error) (any, *MethodError, bool) {
		return nil, &MethodError{Code: "invalid_arguments", Message: fmt.Sprintf("invalid arguments for %s: %v", call.Method, err)}, false
	}
	manager := service.PtrFromContext[trafficcontrol.Manager](singbox.ctx)
	switch call.Method {
	case getProxiesMethod:
		return singboxProxiesLocked(), nil, false
	case changeProxyMethod:
		var params ChangeProxyParams
		if err := call.decodeArguments(&params); err != nil {
			return invalidArguments(err)
		}
		outbound, ok := singbox.instance.Outbound().Outbound(params.GroupName)
		selector, selectable := outbound.(*group.Selector)
		if !ok || !selectable {
			return &ChangeProxyResult{Message: "Group is not selectable"}, nil, false
		}
		before := selector.Now()
		if !selector.SelectOutbound(params.ProxyName) {
			return &ChangeProxyResult{Message: "Proxy is not in group"}, nil, false
		}
		changed := before != selector.Now()
		singbox.selected[params.GroupName] = params.ProxyName
		return &ChangeProxyResult{Changed: changed}, nil, changed
	case getTrafficMethod, getTotalTrafficMethod, resetTrafficMethod:
		up, down := manager.Total()
		total := Traffic{Up: up, Down: down}
		if call.Method == resetTrafficMethod {
			singbox.trafficBaseline = total
			singbox.previousTraffic = total
			singbox.sampledAt = time.Now()
			return true, nil, false
		}
		if call.Method == getTotalTrafficMethod {
			return Traffic{Up: up - singbox.trafficBaseline.Up, Down: down - singbox.trafficBaseline.Down}, nil, false
		}
		elapsed := time.Since(singbox.sampledAt).Seconds()
		if elapsed <= 0 {
			elapsed = 1
		}
		result := Traffic{Up: int64(float64(up-singbox.previousTraffic.Up) / elapsed), Down: int64(float64(down-singbox.previousTraffic.Down) / elapsed)}
		singbox.previousTraffic = total
		singbox.sampledAt = time.Now()
		manager.Clear()
		return result, nil, false
	case getConnectionsMethod:
		connections := []any{}
		for _, tracker := range manager.Connections() {
			metadata := tracker.Metadata
			domain := metadata.Domain
			if domain == "" {
				domain = metadata.Destination.Fqdn
			}
			connections = append(connections, map[string]any{
				"id": tracker.ID.String(), "metadata": map[string]any{
					"network": metadata.Network, "type": metadata.InboundType, "sourceIP": metadata.Source.Addr.String(),
					"destinationIP": metadata.Destination.Addr.String(), "sourcePort": fmt.Sprint(metadata.Source.Port),
					"destinationPort": fmt.Sprint(metadata.Destination.Port), "host": domain, "dnsMode": "normal",
				}, "upload": tracker.Upload.Load(), "download": tracker.Download.Load(), "start": tracker.CreatedAt,
				"chains": tracker.Chain, "rule": "sing-box", "rulePayload": "",
			})
		}
		up, down := manager.Total()
		return map[string]any{"connections": connections, "uploadTotal": up, "downloadTotal": down}, nil, false
	case getConnectionCountMethod:
		return manager.ConnectionsLen(), nil, false
	case closeConnectionsMethod, resetConnectionsMethod:
		manager.CloseAllConnections()
		manager.Clear()
		return true, nil, false
	case closeConnectionMethod:
		var id string
		if err := call.decodeArguments(&id); err != nil {
			return invalidArguments(err)
		}
		parsed, err := uuid.FromString(id)
		if err != nil {
			return false, nil, false
		}
		connection := manager.Connection(parsed)
		if connection != nil {
			connection.Close()
		}
		return connection != nil, nil, false
	case getExternalProvidersMethod:
		return []ExternalProvider{}, nil, false
	default:
		return nil, &MethodError{Code: "unsupported_engine_operation", Message: "This provider operation is not available for sing-box"}, false
	}
}

func singboxDelay(params *TestDelayParams) (*Delay, bool) {
	singbox.RLock()
	if singbox.configuration == nil {
		singbox.RUnlock()
		return nil, false
	}
	link := params.TestUrl
	if link == "" {
		link = currentTestURL()
	}
	result := &Delay{Name: params.ProxyName, Url: link, Value: -1}
	if singbox.instance == nil {
		singbox.RUnlock()
		return result, true
	}
	outbound, ok := singbox.instance.Outbound().Outbound(params.ProxyName)
	parent := singbox.ctx
	singbox.RUnlock()
	if !ok {
		return result, true
	}
	timeout := delayTestTimeout(params.Timeout)
	queueCtx, cancelQueue := context.WithTimeout(parent, timeout)
	granted := acquireDelayTestSlot(queueCtx)
	cancelQueue()
	if !granted {
		return nil, true
	}
	defer releaseDelayTestSlot()
	ctx, cancel := context.WithTimeout(parent, timeout)
	defer cancel()
	delay, err := urltest.URLTest(ctx, link, outbound)
	if err == nil {
		result.Value = int32(delay)
	}
	return result, true
}

func singboxUpdate(params *UpdateParams) (bool, error) {
	singbox.Lock()
	defer singbox.Unlock()
	if singbox.configuration == nil {
		return false, nil
	}
	if singbox.instance == nil {
		return true, errors.New("sing-box is not running")
	}
	if params.Tun != nil || params.MixedPort != nil || params.AllowLan != nil || params.IPv6 != nil {
		return true, errors.New("sing-box listener changes require applying the profile")
	}
	if params.Mode != nil {
		mode := strings.ToLower(params.Mode.String())
		if mode != "rule" && mode != "global" && mode != "direct" {
			return true, errors.New("invalid routing mode")
		}
		if strings.EqualFold(service.PtrFromContext[clashmode.Manager](singbox.ctx).Mode(), mode) {
			return true, nil
		}
		var config map[string]any
		if err := json.Unmarshal(singbox.configuration, &config); err != nil {
			return true, err
		}
		experimental, _ := config["experimental"].(map[string]any)
		if experimental == nil {
			experimental = map[string]any{}
			config["experimental"] = experimental
		}
		api, _ := experimental["clash_api"].(map[string]any)
		if api == nil {
			api = map[string]any{}
			experimental["clash_api"] = api
		}
		api["default_mode"] = strings.Title(mode)
		data, err := json.Marshal(config)
		if err != nil {
			return true, err
		}
		return true, singbox.replaceLocked(data, singbox.picksLocked(), singbox.running)
	}
	return true, nil
}

func readSingboxConfig(path string) (map[string]any, bool, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, false, err
	}
	_, detected, err := decodeSingbox(data)
	if !detected || err != nil {
		return nil, detected, err
	}
	var result map[string]any
	err = json.Unmarshal(data, &result)
	return result, true, err
}

func singboxError(err error) string {
	if err != nil {
		return fmt.Sprintf("sing-box: %v", err)
	}
	return ""
}

func singboxOutbound(name string) (SA.Outbound, []string, context.Context, error) {
	singbox.RLock()
	defer singbox.RUnlock()
	if singbox.instance == nil {
		return nil, nil, nil, errors.New("sing-box is not running")
	}
	if name == "" {
		mode := service.PtrFromContext[clashmode.Manager](singbox.ctx).Mode()
		switch strings.ToLower(mode) {
		case "direct":
			name = "DIRECT"
		case "global":
			name = "GLOBAL"
		default:
			name = singbox.instance.Outbound().Default().Tag()
		}
	}
	outbound, ok := singbox.instance.Outbound().Outbound(name)
	if !ok {
		return nil, nil, nil, fmt.Errorf("unknown sing-box outbound %q", name)
	}
	chain := []string{name}
	visited := map[string]bool{}
	for {
		group, ok := outbound.(SA.OutboundGroup)
		if !ok {
			break
		}
		next := group.Now()
		if visited[next] {
			return nil, nil, nil, errors.New("outbound cycle")
		}
		visited[next] = true
		chain = append(chain, next)
		outbound, ok = singbox.instance.Outbound().Outbound(next)
		if !ok {
			return nil, nil, nil, errors.New("outbound unavailable")
		}
	}
	return outbound, chain, singbox.ctx, nil
}

func singboxDial(ctx context.Context, name, address string) (net.Conn, []string, error) {
	outbound, chain, parent, err := singboxOutbound(name)
	if err != nil {
		return nil, nil, err
	}
	dialCtx, cancel := context.WithCancel(ctx)
	defer cancel()
	stop := context.AfterFunc(parent, cancel)
	defer stop()
	conn, err := outbound.DialContext(dialCtx, "tcp", M.ParseSocksaddr(address))
	return conn, chain, err
}

func singboxNotificationTraffic(total bool) (Traffic, bool) {
	singbox.Lock()
	defer singbox.Unlock()
	if singbox.configuration == nil {
		return Traffic{}, false
	}
	if singbox.instance == nil {
		return Traffic{}, true
	}
	manager := service.PtrFromContext[trafficcontrol.Manager](singbox.ctx)
	up, down := manager.Total()
	if total {
		return Traffic{Up: up - singbox.trafficBaseline.Up, Down: down - singbox.trafficBaseline.Down}, true
	}
	elapsed := time.Since(singbox.notificationSampledAt).Seconds()
	if elapsed <= 0 {
		return Traffic{}, true
	}
	result := Traffic{Up: int64(float64(up-singbox.notificationTraffic.Up) / elapsed), Down: int64(float64(down-singbox.notificationTraffic.Down) / elapsed)}
	singbox.notificationTraffic = Traffic{Up: up, Down: down}
	singbox.notificationSampledAt = time.Now()
	manager.Clear()
	return result, true
}
