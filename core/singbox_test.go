//go:build !legacy_mihomo

package main

import (
	"encoding/json"
	"github.com/sagernet/sing-box/protocol/group"
	"net"
	"net/http"
	"net/http/httptest"
	"os"
	"runtime"
	"strconv"
	"strings"
	"testing"
	"time"

	"github.com/sagernet/sing-box/common/trafficcontrol"
	"github.com/sagernet/sing-box/experimental/clashmode"
	"github.com/sagernet/sing/service"
)

const singboxTestConfig = `{"inbounds":[],"outbounds":[{"type":"direct","tag":"DIRECT"},{"type":"direct","tag":"alternative"},{"type":"selector","tag":"GLOBAL","outbounds":["DIRECT","alternative"]}],"route":{"final":"GLOBAL","rules":[{"clash_mode":"Global","outbound":"GLOBAL"},{"clash_mode":"Direct","outbound":"DIRECT"}]}}`

func TestSingboxLifecycleAndSelection(t *testing.T) {
	instance, ctx, cancel, err := newSingbox([]byte(singboxTestConfig), false)
	if err != nil {
		t.Fatal(err)
	}
	defer cancel()
	defer instance.Close()
	if err = instance.Start(); err != nil {
		t.Fatal(err)
	}
	if service.PtrFromContext[trafficcontrol.Manager](ctx) == nil {
		t.Fatal("missing traffic manager")
	}
	if service.PtrFromContext[clashmode.Manager](ctx) == nil {
		t.Fatal("missing mode manager")
	}
}

func TestSingboxRejectsInvalidConfiguration(t *testing.T) {
	if runtime.GOOS != "windows" && runtime.GOOS != "android" && runtime.GOOS != "darwin" && runtime.GOOS != "linux" {
		t.Skip("unsupported profile platform")
	}
	data, _ := json.Marshal(singboxEnvelope{Core: "sing-box", Configuration: json.RawMessage(`{"outbounds":[{"type":"invalid"}]}`)})
	if validateSingbox(data) == nil {
		t.Fatal("invalid protocol accepted")
	}
	data, _ = json.Marshal(singboxEnvelope{Core: "sing-box", Configuration: json.RawMessage(singboxTestConfig)})
	if err := validateSingbox(data); err != nil {
		t.Fatal(err)
	}
}

func TestSingboxPanelTemplate(t *testing.T) {
	if runtime.GOOS != "windows" && runtime.GOOS != "android" && runtime.GOOS != "darwin" && runtime.GOOS != "linux" {
		t.Skip("unsupported profile platform")
	}
	data, err := os.ReadFile("testdata/fastai-singbox.json")
	if err != nil {
		t.Fatal(err)
	}
	if err = validateSingbox(data); err != nil {
		t.Fatal(err)
	}
}

func TestSingboxProbeAndFailedReload(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) { w.WriteHeader(http.StatusNoContent) }))
	defer server.Close()
	singbox.Lock()
	err := singbox.replaceLocked([]byte(singboxTestConfig), map[string]string{"GLOBAL": "alternative"}, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	defer func() { singbox.Lock(); singbox.closeLocked(); singbox.configuration = nil; singbox.Unlock() }()
	picks, active := singboxPicks()
	if !active || picks["GLOBAL"] != "alternative" {
		t.Fatalf("selection not restored: %v", picks)
	}
	delay, handled := singboxDelay(&TestDelayParams{ProxyName: "GLOBAL", TestUrl: server.URL, Timeout: 2000})
	if !handled || delay == nil || delay.Value < 0 {
		t.Fatalf("probe failed: %+v", delay)
	}
	probe := handleProbe(&ProbeParams{Url: server.URL, ProxyName: "GLOBAL", Timeout: 2000})
	if probe == nil || probe.StatusCode != 204 {
		t.Fatalf("HTTP probe failed: %+v", probe)
	}
	singbox.Lock()
	old := singbox.instance
	err = singbox.replaceLocked([]byte(`{"outbounds":[{"type":"not-a-protocol"}]}`), nil, false)
	retained := old == singbox.instance
	singbox.Unlock()
	if err == nil || !retained {
		t.Fatal("invalid reload discarded working engine")
	}

	_, portText, err := net.SplitHostPort(strings.TrimPrefix(server.URL, "http://"))
	if err != nil {
		t.Fatal(err)
	}
	port, _ := strconv.Atoi(portText)
	var occupied map[string]any
	if err = json.Unmarshal([]byte(singboxTestConfig), &occupied); err != nil {
		t.Fatal(err)
	}
	occupied["inbounds"] = []any{map[string]any{"type": "mixed", "listen": "127.0.0.1", "listen_port": port}}
	badRuntime, _ := json.Marshal(occupied)
	mode := engineMode("global")
	if handled, updateErr := singboxUpdate(&UpdateParams{Mode: &mode}); !handled || updateErr != nil {
		t.Fatalf("mode update failed: %v", updateErr)
	}
	singbox.Lock()
	outbound, _ := singbox.instance.Outbound().Outbound("GLOBAL")
	outbound.(*group.Selector).SelectOutbound("DIRECT")
	singbox.previousTraffic = Traffic{Up: 100, Down: 200}
	singbox.trafficBaseline = Traffic{Up: 100, Down: 200}
	singbox.notificationTraffic = Traffic{Up: 100, Down: 200}
	err = singbox.replaceLocked(badRuntime, nil, true)
	restored := singbox.instance
	singbox.Unlock()
	if err == nil || restored == nil {
		t.Fatal("failed listener start did not restore previous runtime")
	}
	picks, _ = singboxPicks()
	if picks["GLOBAL"] != "DIRECT" {
		t.Fatalf("rollback lost the live selection: %v", picks)
	}
	if mode := service.PtrFromContext[clashmode.Manager](singbox.ctx).Mode(); mode != "Global" {
		t.Fatalf("rollback lost the live mode: %s", mode)
	}
	mode = engineMode("direct")
	mixedPort := 7890
	if handled, updateErr := singboxUpdate(&UpdateParams{Mode: &mode, MixedPort: &mixedPort}); !handled || updateErr == nil {
		t.Fatal("listener update was not rejected")
	}
	if mode := service.PtrFromContext[clashmode.Manager](singbox.ctx).Mode(); mode != "Global" {
		t.Fatalf("rejected update partially changed mode: %s", mode)
	}
	if traffic, _ := singboxNotificationTraffic(true); traffic != (Traffic{}) {
		t.Fatalf("rollback retained the old traffic baseline: %+v", traffic)
	}
	if traffic, _ := singboxNotificationTraffic(false); traffic != (Traffic{}) {
		t.Fatalf("rollback retained the old notification sample: %+v", traffic)
	}
	singbox.RLock()
	previousTraffic := singbox.previousTraffic
	singbox.RUnlock()
	if previousTraffic != (Traffic{}) {
		t.Fatalf("rollback retained the old UI sample: %+v", previousTraffic)
	}
	probe = handleProbe(&ProbeParams{Url: server.URL, ProxyName: "GLOBAL", Timeout: 2000})
	if probe == nil || probe.StatusCode != 204 {
		t.Fatalf("restored runtime cannot dial: %+v", probe)
	}
	outbound, _ = restored.Outbound().Outbound("GLOBAL")
	if !outbound.(*group.Selector).SelectOutbound("DIRECT") {
		t.Fatal("cannot select outbound")
	}
	picks, _ = singboxPicks()
	if picks["GLOBAL"] != "DIRECT" {
		t.Fatal("route did not reflect selection")
	}
}

func TestSingboxRepeatedCloseReleasesRuntime(t *testing.T) {
	var state singboxRuntime
	for i := 0; i < 20; i++ {
		if err := state.replaceLocked([]byte(singboxTestConfig), nil, false); err != nil {
			t.Fatal(err)
		}
		ctx := state.ctx
		if err := state.closeLocked(); err != nil {
			t.Fatal(err)
		}
		if ctx.Err() == nil || state.ctx != nil || state.cancel != nil || state.instance != nil {
			t.Fatal("closed runtime retains its context or instance")
		}
		if err := state.closeLocked(); err != nil {
			t.Fatal(err)
		}
	}
}

func TestSingboxRollbackPreservesListenerMode(t *testing.T) {
	var state singboxRuntime
	defer state.closeLocked()
	var config map[string]any
	if err := json.Unmarshal([]byte(singboxTestConfig), &config); err != nil {
		t.Fatal(err)
	}
	config["inbounds"] = []any{map[string]any{"type": "mixed", "listen": "127.0.0.1"}}
	data, _ := json.Marshal(config)
	if err := state.replaceLocked(data, nil, true); err != nil {
		t.Fatal(err)
	}
	occupied, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		t.Fatal(err)
	}
	defer occupied.Close()
	config["inbounds"] = []any{map[string]any{"type": "mixed", "listen": "127.0.0.1", "listen_port": occupied.Addr().(*net.TCPAddr).Port}}
	data, _ = json.Marshal(config)
	previousRunning := isRunning.Swap(false)
	defer isRunning.Store(previousRunning)
	if err = state.replaceLocked(data, nil, true); err == nil {
		t.Fatal("occupied listener unexpectedly started")
	}
	if state.instance == nil || len(state.instance.Inbound().Inbounds()) != 1 {
		t.Fatal("rollback lost the previous runtime's listener mode")
	}
}

func TestSingboxProbeCancelledOnClose(t *testing.T) {
	requested := make(chan struct{})
	released := make(chan struct{})
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		close(requested)
		<-r.Context().Done()
		close(released)
	}))
	defer server.Close()
	defer server.CloseClientConnections()
	singbox.Lock()
	err := singbox.replaceLocked([]byte(singboxTestConfig), nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	defer func() {
		singbox.Lock()
		singbox.closeLocked()
		singbox.configuration = nil
		singbox.Unlock()
	}()
	done := make(chan *ProbeResult, 1)
	go func() {
		done <- handleProbe(&ProbeParams{Url: server.URL, ProxyName: "DIRECT", Timeout: 30000})
	}()
	select {
	case <-requested:
	case <-time.After(3 * time.Second):
		t.Fatal("probe never reached server")
	}
	singbox.Lock()
	err = singbox.closeLocked()
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	select {
	case result := <-done:
		if result == nil || result.Error == "" {
			t.Fatalf("cancelled probe returned success: %+v", result)
		}
	case <-time.After(3 * time.Second):
		t.Fatal("probe survived runtime shutdown")
	}
	select {
	case <-released:
	case <-time.After(3 * time.Second):
		t.Fatal("probe connection survived runtime shutdown")
	}
	if len(probeSlots) != 0 {
		t.Fatal("cancelled probe retained its concurrency slot")
	}
}
