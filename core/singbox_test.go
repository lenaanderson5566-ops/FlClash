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

	"github.com/sagernet/sing-box/common/trafficcontrol"
	"github.com/sagernet/sing-box/experimental/clashmode"
	"github.com/sagernet/sing/service"
)

const singboxTestConfig = `{"inbounds":[],"outbounds":[{"type":"direct","tag":"DIRECT"},{"type":"direct","tag":"alternative"},{"type":"selector","tag":"GLOBAL","outbounds":["DIRECT","alternative"]}],"route":{"final":"GLOBAL"}}`

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
	if runtime.GOOS != "windows" {
		t.Skip("Windows profile format")
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
	if runtime.GOOS != "windows" {
		t.Skip("Windows profile")
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
	singbox.Lock()
	err = singbox.replaceLocked(badRuntime, nil, true)
	restored := singbox.instance
	singbox.Unlock()
	if err == nil || restored == nil {
		t.Fatal("failed listener start did not restore previous runtime")
	}
	probe = handleProbe(&ProbeParams{Url: server.URL, ProxyName: "GLOBAL", Timeout: 2000})
	if probe == nil || probe.StatusCode != 204 {
		t.Fatalf("restored runtime cannot dial: %+v", probe)
	}
	outbound, _ := restored.Outbound().Outbound("GLOBAL")
	if !outbound.(*group.Selector).SelectOutbound("DIRECT") {
		t.Fatal("cannot select outbound")
	}
	picks, _ = singboxPicks()
	if picks["GLOBAL"] != "DIRECT" {
		t.Fatal("route did not reflect selection")
	}
}
