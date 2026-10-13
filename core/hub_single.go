package main

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"runtime/debug"
	"strconv"
	"sync"
	"sync/atomic"
	"time"
)

const defaultTestURL = "https://www.gstatic.com/generate_204"
const defaultDelayTestTimeout = 5 * time.Second
const delayTestConcurrency = 50

var configMu, selectMu sync.Mutex
var isInit, isRunning, logEnabled atomic.Bool
var sdkVersion atomic.Int32
var testURL atomic.Pointer[string]
var homeDirectory string
var delayTestSlots = make(chan struct{}, delayTestConcurrency)
var errConfigNotApplied = errors.New("sing-box configuration is not applied")

func defaultSetupParams() *SetupParams {
	return &SetupParams{TestURL: defaultTestURL, SelectedMap: map[string]string{}}
}
func setTestURL(s string) {
	if s != "" {
		testURL.Store(&s)
	}
}
func currentTestURL() string {
	if s := testURL.Load(); s != nil {
		return *s
	}
	return defaultTestURL
}
func acquireDelayTestSlot(ctx context.Context) bool { return acquireSlot(ctx, delayTestSlots) }
func releaseDelayTestSlot()                         { <-delayTestSlots }
func delayTestTimeout(ms int64) time.Duration {
	if ms <= 0 {
		return defaultDelayTestTimeout
	}
	return time.Duration(ms) * time.Millisecond
}
func UnmarshalJson(data []byte, v any) error {
	d := json.NewDecoder(bytes.NewReader(data))
	d.UseNumber()
	return d.Decode(v)
}
func logError(format string, args ...any) {
	s := fmt.Sprintf(format, args...)
	fmt.Fprintln(os.Stderr, s)
	if logEnabled.Load() {
		sendMessage(Message{Type: LogMessage, Data: map[string]string{"LogLevel": "error", "Payload": s}})
	}
}
func handleInitClash(p *InitParams) bool {
	configMu.Lock()
	defer configMu.Unlock()
	homeDirectory = p.HomeDir
	sdkVersion.Store(int32(p.Version))
	initOwnership(p.HomeDir)
	isInit.Store(true)
	return true
}
func handleGetIsInit() bool { return isInit.Load() }
func handleForceGC() {
	runtime.GC()
	if runtime.GOOS == "android" {
		debug.FreeOSMemory()
	}
}
func handleStartListener() bool {
	configMu.Lock()
	defer configMu.Unlock()
	ok, err := singboxListeners(true)
	if !ok || err != nil {
		if err != nil {
			logError("%v", err)
		}
		return false
	}
	isRunning.Store(true)
	refreshRoute()
	return true
}
func handleStopListener() bool {
	configMu.Lock()
	defer configMu.Unlock()
	_, err := singboxListeners(false)
	if err != nil {
		logError("%v", err)
		return false
	}
	isRunning.Store(false)
	return true
}
func handleShutdown() bool {
	stopRouteWatch()
	handleStopLog()
	configMu.Lock()
	defer configMu.Unlock()
	singbox.Lock()
	err := singbox.closeLocked()
	singbox.configuration = nil
	singbox.Unlock()
	isRunning.Store(false)
	isInit.Store(false)
	return err == nil
}
func handleValidateConfig(path string) string {
	configMu.Lock()
	defer configMu.Unlock()
	data, err := os.ReadFile(path)
	if err == nil {
		err = validateSingbox(data)
	}
	return singboxError(err)
}
func handleValidateProxies(m []map[string]any) []string {
	results := make([]string, len(m))
	for i := range results {
		results[i] = "Mihomo proxy snippets are not supported; refresh the sing-box profile"
	}
	return results
}
func applyConfig(p *SetupParams) error {
	configMu.Lock()
	defer configMu.Unlock()
	data, err := os.ReadFile(filepath.Join(homeDirectory, "config.yaml"))
	if err != nil {
		return err
	}
	// Empty config is the signed-out state; it must not open a direct listener.
	if len(bytes.TrimSpace(data)) == 0 {
		singbox.Lock()
		err = singbox.closeLocked()
		singbox.configuration = nil
		singbox.Unlock()
		isRunning.Store(false)
		bumpRouteEpoch()
		return err
	}
	e, ok, err := decodeSingbox(data)
	if err != nil {
		return err
	}
	if !ok {
		return errors.New("only sing-box profiles are supported; refresh your subscription")
	}
	if err = validateSingbox(data); err != nil {
		return err
	}
	singbox.Lock()
	err = singbox.replaceLocked(e.Configuration, p.SelectedMap, isRunning.Load())
	singbox.Unlock()
	if err == nil {
		setTestURL(p.TestURL)
		bumpRouteEpoch()
	}
	return err
}

var setupConfig = applyConfig

func handleSetupConfig(p *SetupParams) string {
	if !isInit.Load() {
		return "not initialized"
	}
	return singboxError(setupConfig(p))
}
func handleUpdateConfig(p *UpdateParams) string {
	configMu.Lock()
	defer configMu.Unlock()
	ok, err := singboxUpdate(p)
	if !ok {
		return errConfigNotApplied.Error()
	}
	if err == nil && p.Mode != nil {
		bumpRouteEpoch()
	}
	return singboxError(err)
}
func handleGetConfig(path string) (map[string]any, error) {
	v, ok, err := readSingboxConfig(path)
	if err != nil {
		return nil, err
	}
	if !ok {
		return nil, errors.New("only sing-box profiles are supported")
	}
	return v, nil
}
func handleDumpRuleSet(path string) (string, error) {
	return "", errors.New("Mihomo rule sets are not supported")
}
func handleTestDelay(p *TestDelayParams) *Delay { v, _ := singboxDelay(p); return v }
func handleGetProxies() ProxiesData             { return ProxiesData{Proxies: map[string]any{}, All: []string{}} }
func handleChangeProxy(p *ChangeProxyParams) *ChangeProxyResult {
	return &ChangeProxyResult{Message: errConfigNotApplied.Error()}
}
func handleGetTraffic(_ bool) Traffic      { v, _ := singboxNotificationTraffic(false); return v }
func handleGetTotalTraffic(_ bool) Traffic { v, _ := singboxNotificationTraffic(true); return v }
func handleResetTraffic()                  {}
func handleGetConnections() any {
	return map[string]any{"connections": []any{}, "uploadTotal": 0, "downloadTotal": 0}
}
func handleGetConnectionCount() int { return 0 }
func handleCloseConnections() bool {
	singbox.Lock()
	defer singbox.Unlock()
	if singbox.instance != nil {
		_, err, _ := singboxMethodLocked(&MethodCall{Method: closeConnectionsMethod})
		return err == nil
	}
	return true
}
func handleResetConnections() bool                            { return handleCloseConnections() }
func handleCloseConnection(id string) bool                    { return false }
func handleGetExternalProviders() []ExternalProvider          { return []ExternalProvider{} }
func handleGetExternalProvider(name string) *ExternalProvider { return nil }
func handleUpdateGeoData(kind string) string                  { return "sing-box manages its own rule sets" }
func unsupportedProvider() *MethodError {
	return &MethodError{Code: "unsupported_engine_operation", Message: "Mihomo providers are not supported"}
}
func handleUpdateExternalProvider(name string) *MethodError { return unsupportedProvider() }
func handleSideLoadExternalProvider(name string, data []byte) *MethodError {
	return unsupportedProvider()
}
func handleStartLog() { logEnabled.Store(true) }
func handleStopLog()  { logEnabled.Store(false) }
func handleGetMemoryStats() MemoryStats {
	var s runtime.MemStats
	runtime.ReadMemStats(&s)
	return MemoryStats{Rss: s.Sys - s.HeapReleased, HeapInuse: s.HeapInuse, HeapIdle: s.HeapIdle - s.HeapReleased, StackInuse: s.StackInuse, RuntimeOther: s.MSpanInuse + s.MCacheInuse + s.BuckHashSys + s.GCSys + s.OtherSys}
}
func handleCrash() { panic("handle invoke crash") }
func providerPaths(home string, id int64) (string, string) {
	root := filepath.Join(home, "profiles", "providers")
	return root, filepath.Join(root, strconv.FormatInt(id, 10))
}
func handleClearEffect(id int64) string {
	configMu.Lock()
	defer configMu.Unlock()
	if !isInit.Load() {
		return "not initialized"
	}
	if id <= 0 {
		return "invalid profile id"
	}
	root, path := providerPaths(homeDirectory, id)
	if err := os.RemoveAll(path); err != nil {
		return err.Error()
	}
	_ = os.Remove(root)
	return ""
}
