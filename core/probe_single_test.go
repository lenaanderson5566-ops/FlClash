package main

import (
	"encoding/json"
	"net"
	"net/http"
	"net/http/httptest"
	"slices"
	"strings"
	"testing"
	"time"
)

func probeServer(t *testing.T, handler http.HandlerFunc) *httptest.Server {
	t.Helper()
	server := httptest.NewServer(handler)
	t.Cleanup(server.Close)
	return server
}

func withProbeProxies(t *testing.T, names ...string) {
	t.Helper()
	if len(names) == 0 {
		names = []string{"DIRECT"}
	}
	outbounds := []map[string]any{}
	for _, name := range names {
		outbounds = append(outbounds, map[string]any{"type": "direct", "tag": name})
	}
	data, _ := json.Marshal(map[string]any{"outbounds": outbounds, "route": map[string]any{"final": names[0]}})
	singbox.Lock()
	err := singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { singbox.Lock(); _ = singbox.closeLocked(); singbox.configuration = nil; singbox.Unlock() })
}

func TestHandleProbePinsTheNamedProxy(t *testing.T) {
	var userAgent string
	server := probeServer(t, func(w http.ResponseWriter, r *http.Request) {
		userAgent = r.UserAgent()
		w.WriteHeader(http.StatusForbidden)
		_, _ = w.Write([]byte("ip=203.0.113.7\nloc=US\n"))
	})
	withProbeProxies(t, "node-a")

	result := handleProbe(&ProbeParams{
		Url:       server.URL + "/trace",
		ProxyName: "node-a",
		Headers:   map[string]string{"User-Agent": "probe-test"},
		Timeout:   2000,
		MaxBody:   1024,
	})

	if result == nil {
		t.Fatal("handleProbe = nil, want a result")
	}
	if result.Error != "" {
		t.Fatalf("error = %q (%s), want none", result.Error, result.Message)
	}
	if result.StatusCode != http.StatusForbidden {
		t.Errorf("status = %d, want 403", result.StatusCode)
	}
	if result.Body != "ip=203.0.113.7\nloc=US\n" {
		t.Errorf("body = %q", result.Body)
	}
	if !slices.Equal(result.Chains, []string{"node-a"}) {
		t.Errorf("chains = %v, want [node-a]", result.Chains)
	}
	if result.Url != server.URL+"/trace" {
		t.Errorf("url = %q", result.Url)
	}
	if userAgent != "probe-test" {
		t.Errorf("user agent = %q, want the header the caller passed", userAgent)
	}
}

func TestHandleProbeFollowsRedirectsAndCapsTheBody(t *testing.T) {
	server := probeServer(t, func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/" {
			http.Redirect(w, r, "/final", http.StatusFound)
			return
		}
		_, _ = w.Write([]byte(strings.Repeat("x", 100)))
	})
	withProbeProxies(t, "node-a")

	result := handleProbe(&ProbeParams{Url: server.URL, ProxyName: "node-a", Timeout: 2000, MaxBody: 8})

	if result == nil || result.Error != "" {
		t.Fatalf("result = %+v, want a success", result)
	}
	if result.StatusCode != http.StatusOK {
		t.Errorf("status = %d, want 200 after the redirect", result.StatusCode)
	}
	if result.Url != server.URL+"/final" {
		t.Errorf("url = %q, want the redirect target", result.Url)
	}
	if len(result.Body) != 8 {
		t.Errorf("body length = %d, want the cap", len(result.Body))
	}
}

func TestReadProbeBodyStopsOnceTheMarkerArrives(t *testing.T) {
	marker := "\"currentTerritory\":\"JP\""
	page := strings.Repeat("x", probeScanChunk-10) + marker + strings.Repeat("y", 4*probeScanChunk)
	var seen int

	body := readProbeBody(strings.NewReader(page), int64(len(page)), func(tail string) bool {
		seen++
		return strings.Contains(tail, marker)
	})

	if !strings.Contains(body, marker) {
		t.Fatalf("body lost the marker that straddled two chunks")
	}
	if len(body) >= len(page) || seen != 2 {
		t.Errorf("read %d of %d bytes in %d chunks, want it to stop at the marker", len(body), len(page), seen)
	}
}

func TestReadProbeBodyKeepsTheCapWithoutAMarker(t *testing.T) {
	page := strings.Repeat("x", 3*probeScanChunk)

	body := readProbeBody(strings.NewReader(page), probeScanChunk+5, func(string) bool { return false })

	if len(body) != probeScanChunk+5 {
		t.Errorf("body length = %d, want the cap", len(body))
	}
}

func TestHandleProbeSkipsTheBodyWhenNotAsked(t *testing.T) {
	server := probeServer(t, func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusNoContent)
	})
	withProbeProxies(t, "node-a")

	result := handleProbe(&ProbeParams{Url: server.URL, ProxyName: "node-a", Timeout: 2000})

	if result == nil || result.Error != "" {
		t.Fatalf("result = %+v, want a success", result)
	}
	if result.StatusCode != http.StatusNoContent || result.Body != "" {
		t.Errorf("status = %d body = %q, want 204 with no body", result.StatusCode, result.Body)
	}
}

func TestHandleProbeReportsATimeout(t *testing.T) {
	addr := blackHoleServer(t)
	withProbeProxies(t, "node-a")

	start := time.Now()
	result := handleProbe(&ProbeParams{Url: "http://" + addr.String(), ProxyName: "node-a", Timeout: 200})

	if result == nil {
		t.Fatal("handleProbe = nil, want a result")
	}
	if result.Error != probeErrorTimeout {
		t.Errorf("error = %q (%s), want timeout", result.Error, result.Message)
	}
	if elapsed := time.Since(start); elapsed > 2*time.Second {
		t.Errorf("took %s, want the caller's budget", elapsed)
	}
}

func TestHandleProbeReportsARefusedConnection(t *testing.T) {
	server := probeServer(t, func(http.ResponseWriter, *http.Request) {})
	url := server.URL
	server.Close()
	withProbeProxies(t, "node-a")

	result := handleProbe(&ProbeParams{Url: url, ProxyName: "node-a", Timeout: 2000})

	if result == nil || result.Error != probeErrorFailed {
		t.Fatalf("result = %+v, want a failed probe", result)
	}
	if result.StatusCode != 0 || result.Message == "" {
		t.Errorf("status = %d message = %q, want no status and a reason", result.StatusCode, result.Message)
	}
}

func TestHandleProbeRejectsAnUnknownProxyWithoutWaitingForASlot(t *testing.T) {
	for i := 0; i < probeConcurrency; i++ {
		probeSlots <- struct{}{}
	}
	t.Cleanup(func() {
		for i := 0; i < probeConcurrency; i++ {
			<-probeSlots
		}
	})

	done := make(chan *ProbeResult, 1)
	go func() {
		done <- handleProbe(&ProbeParams{Url: "http://example.invalid", ProxyName: "missing", Timeout: 1})
	}()

	select {
	case result := <-done:
		if result == nil || result.Error != probeErrorFailed {
			t.Errorf("result = %+v, want a failed probe", result)
		}
	case <-time.After(time.Second):
		t.Fatal("an unknown proxy queued behind a saturated probe semaphore")
	}
}

func TestHandleProbeGivesUpQueueingOnTheDeadline(t *testing.T) {
	for i := 0; i < probeConcurrency; i++ {
		probeSlots <- struct{}{}
	}
	t.Cleanup(func() {
		for i := 0; i < probeConcurrency; i++ {
			<-probeSlots
		}
	})
	withProbeProxies(t, "node-a")

	if result := handleProbe(&ProbeParams{Url: "http://example.invalid", ProxyName: "node-a", Timeout: 50}); result != nil {
		t.Errorf("result = %+v, want nil when no slot was granted", result)
	}
}

func blackHoleServer(t *testing.T) net.Addr {
	t.Helper()

	listener, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		t.Fatalf("listen: %v", err)
	}

	var conns []net.Conn
	accepting := make(chan struct{})
	go func() {
		defer close(accepting)
		for {
			conn, err := listener.Accept()
			if err != nil {
				return
			}
			conns = append(conns, conn)
		}
	}()

	t.Cleanup(func() {
		_ = listener.Close()
		// Join the accept loop before touching conns: the close above is what
		// ends it, and the receive is the only ordering between the two.
		<-accepting
		for _, conn := range conns {
			_ = conn.Close()
		}
	})

	return listener.Addr()
}
