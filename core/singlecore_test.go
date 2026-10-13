//go:build !legacy_mihomo

package main

import (
	"encoding/json"
	"io"
	"net"
	"net/http"
	"net/http/httptest"
	"net/url"
	"os"
	"path/filepath"
	"testing"
	"time"
)

func TestSingleCoreRejectsLegacyAndDoesNotOpenDefaultListener(t *testing.T) {
	home := t.TempDir()
	handleInitClash(&InitParams{HomeDir: home})
	t.Cleanup(func() { handleShutdown() })
	path := filepath.Join(home, "config.yaml")
	if err := os.WriteFile(path, []byte("mixed-port: 7890\nproxies: []\n"), 0600); err != nil {
		t.Fatal(err)
	}
	if handleValidateConfig(path) == "" {
		t.Fatal("legacy profile accepted")
	}
	if handleSetupConfig(defaultSetupParams()) == "" {
		t.Fatal("legacy profile applied")
	}
	if handleStartListener() {
		t.Fatal("started without a sing-box profile")
	}
	if err := os.WriteFile(path, nil, 0600); err != nil {
		t.Fatal(err)
	}
	if err := handleSetupConfig(defaultSetupParams()); err != "" {
		t.Fatal(err)
	}
	if handleStartListener() {
		t.Fatal("signed-out state opened a listener")
	}
}
func TestSingleCoreNativeApplyAndLegacyReloadPreservesRuntime(t *testing.T) {
	home := t.TempDir()
	handleInitClash(&InitParams{HomeDir: home})
	t.Cleanup(func() { handleShutdown() })
	data, _ := json.Marshal(singboxEnvelope{Core: "sing-box", Configuration: json.RawMessage(singboxTestConfig)})
	path := filepath.Join(home, "config.yaml")
	if err := os.WriteFile(path, data, 0600); err != nil {
		t.Fatal(err)
	}
	if err := handleSetupConfig(defaultSetupParams()); err != "" {
		t.Fatal(err)
	}
	before := singbox.instance
	if err := os.WriteFile(path, []byte("proxies: []"), 0600); err != nil {
		t.Fatal(err)
	}
	if handleSetupConfig(defaultSetupParams()) == "" {
		t.Fatal("legacy reload accepted")
	}
	if singbox.instance != before {
		t.Fatal("invalid legacy reload replaced the working runtime")
	}
}

func TestSingleCoreMixedProxyRoundTripAndStop(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) { _, _ = w.Write([]byte("single-core")) }))
	defer server.Close()
	listener, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		t.Fatal(err)
	}
	address := listener.Addr().String()
	port := listener.Addr().(*net.TCPAddr).Port
	listener.Close()
	var configuration map[string]any
	if err = json.Unmarshal([]byte(singboxTestConfig), &configuration); err != nil {
		t.Fatal(err)
	}
	configuration["inbounds"] = []any{map[string]any{"type": "mixed", "tag": "mixed", "listen": "127.0.0.1", "listen_port": port}}
	data, _ := json.Marshal(configuration)
	singbox.Lock()
	err = singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { handleShutdown() })
	if !handleStartListener() {
		t.Fatal("mixed listener failed to start")
	}
	proxy, _ := url.Parse("http://" + address)
	transport := &http.Transport{Proxy: http.ProxyURL(proxy)}
	defer transport.CloseIdleConnections()
	client := http.Client{Transport: transport, Timeout: 2 * time.Second}
	response, err := client.Get(server.URL)
	if err != nil {
		t.Fatal(err)
	}
	body, err := io.ReadAll(response.Body)
	response.Body.Close()
	if err != nil || string(body) != "single-core" {
		t.Fatalf("proxy response: %s %v", body, err)
	}
	if !handleStopListener() {
		t.Fatal("mixed listener failed to stop")
	}
	conn, err := net.DialTimeout("tcp", address, 200*time.Millisecond)
	if err == nil {
		conn.Close()
		t.Fatal("listener survived stop")
	}
	if !handleShutdown() || !handleShutdown() {
		t.Fatal("shutdown is not idempotent")
	}
}
