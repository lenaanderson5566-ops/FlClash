package main

import (
	"bytes"
	"context"
	"crypto/sha256"
	"encoding/json"
	"fmt"
	"net"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"testing"
	"time"

	"github.com/miekg/dns"
	"github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/common/srs"
	"github.com/sagernet/sing-box/experimental/clashmode"
	"github.com/sagernet/sing-box/option"
	rule "github.com/sagernet/sing-box/route/rule"
	M "github.com/sagernet/sing/common/metadata"
	"github.com/sagernet/sing/service"
)

func TestGeneratedDefaultRulesRoutingAndDNS(t *testing.T) {
	data, err := os.ReadFile("testdata/fastai-singbox-rules.json")
	if err != nil {
		t.Fatal(err)
	}
	var envelope struct {
		Configuration map[string]any `json:"configuration"`
	}
	if err = json.Unmarshal(data, &envelope); err != nil {
		t.Fatal(err)
	}
	config := envelope.Configuration
	config["outbounds"] = []any{
		map[string]any{"type": "direct", "tag": "DIRECT"},
		map[string]any{"type": "direct", "tag": "GLOBAL"},
		map[string]any{"type": "direct", "tag": "节点选择"},
	}
	offline := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) { w.WriteHeader(503) }))
	defer offline.Close()
	for _, value := range config["route"].(map[string]any)["rule_set"].([]any) {
		set := value.(map[string]any)
		set["url"] = offline.URL + "/" + set["tag"].(string)
		set["http_client"] = map[string]any{"connect_timeout": "1s"}
	}
	dnsServer := func(answer string) int {
		packet, err := net.ListenPacket("udp", "127.0.0.1:0")
		if err != nil {
			t.Fatal(err)
		}
		server := &dns.Server{PacketConn: packet, Handler: dns.HandlerFunc(func(w dns.ResponseWriter, q *dns.Msg) {
			response := new(dns.Msg)
			response.SetReply(q)
			response.Answer = []dns.RR{&dns.A{Hdr: dns.RR_Header{Name: q.Question[0].Name, Rrtype: dns.TypeA, Class: dns.ClassINET, Ttl: 30}, A: net.ParseIP(answer)}}
			_ = w.WriteMsg(response)
		})}
		done := make(chan struct{})
		go func() { defer close(done); _ = server.ActivateAndServe() }()
		t.Cleanup(func() { _ = server.Shutdown(); _ = packet.Close(); <-done })
		return packet.LocalAddr().(*net.UDPAddr).Port
	}
	directPort, proxyPort := dnsServer("192.0.2.1"), dnsServer("192.0.2.2")
	config["dns"].(map[string]any)["servers"] = []any{
		map[string]any{"type": "udp", "tag": "local", "server": "127.0.0.1", "server_port": directPort},
		map[string]any{"type": "udp", "tag": "fastai-dns-direct", "server": "127.0.0.1", "server_port": directPort},
		map[string]any{"type": "udp", "tag": "fastai-dns-proxy", "server": "127.0.0.1", "server_port": proxyPort},
	}
	handleInitClash(&InitParams{HomeDir: t.TempDir()})
	t.Cleanup(func() { handleShutdown() })
	data, _ = json.Marshal(config)
	singbox.Lock()
	err = singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	for _, mode := range []engineMode{"rule", "global", "direct"} {
		if err := handleUpdateConfig(&UpdateParams{Mode: &mode}); err != "" {
			t.Fatal(err)
		}
		for _, tc := range []struct{ host, route, dns string }{
			{"www.baidu.com", "DIRECT", "192.0.2.1"},
			{"example.com", "节点选择", "192.0.2.2"},
			{"router.lan", "DIRECT", "192.0.2.1"},
			{"223.5.5.5", "DIRECT", ""},
			{"192.168.1.1", "DIRECT", ""},
			{"1.1.1.1", "节点选择", ""},
		} {
			wantRoute, wantDNS := tc.route, tc.dns
			if mode == "global" {
				wantRoute, wantDNS = "GLOBAL", "192.0.2.2"
			}
			if mode == "direct" {
				wantRoute, wantDNS = "DIRECT", "192.0.2.1"
			}
			metadata := &adapter.InboundContext{Destination: M.ParseSocksaddr(tc.host + ":443")}
			if metadata.Destination.IsFqdn() {
				metadata.Domain = tc.host
			}
			gotRoute := "节点选择"
			for _, r := range singbox.instance.Router().Rules() {
				metadata.ResetRuleCache()
				if r.Match(metadata) {
					if action, ok := r.Action().(*rule.RuleActionRoute); ok {
						gotRoute = action.Outbound
						break
					}
				}
			}
			if gotRoute != wantRoute {
				t.Errorf("%s: route %s = %s, want %s", mode, tc.host, gotRoute, wantRoute)
			}
			if tc.dns == "" {
				continue
			}
			query := new(dns.Msg)
			query.SetQuestion(dns.Fqdn(tc.host), dns.TypeA)
			ctx, cancel := context.WithTimeout(context.Background(), time.Second)
			response, err := service.FromContext[adapter.DNSRouter](singbox.ctx).Exchange(ctx, query, adapter.DNSQueryOptions{})
			cancel()
			if err != nil {
				t.Fatal(err)
			}
			if len(response.Answer) != 1 || response.Answer[0].(*dns.A).A.String() != wantDNS {
				t.Errorf("%s: DNS %s = %v, want %s", mode, tc.host, response.Answer, wantDNS)
			}
		}
	}
}

func ruleTestConfig(t *testing.T, url string) []byte {
	t.Helper()
	var config map[string]any
	if err := json.Unmarshal([]byte(singboxTestConfig), &config); err != nil {
		t.Fatal(err)
	}
	route := config["route"].(map[string]any)
	route["rule_set"] = []any{
		map[string]any{"type": "remote", "tag": "cn-site", "format": "binary", "url": url + "/geosite-cn.srs", "initial_path": "fastai-bundled:geosite-cn.srs", "http_client": map[string]any{"connect_timeout": "1s"}, "update_interval": "5d"},
		map[string]any{"type": "remote", "tag": "cn-ip", "format": "binary", "url": url + "/geoip-cn.srs", "initial_path": "fastai-bundled:geoip-cn.srs", "http_client": map[string]any{"connect_timeout": "1s"}, "update_interval": "5d"},
	}
	route["rules"] = append(route["rules"].([]any), map[string]any{"rule_set": []string{"cn-site", "cn-ip"}, "action": "route", "outbound": "DIRECT"})
	data, err := json.Marshal(config)
	if err != nil {
		t.Fatal(err)
	}
	return data
}

func TestBundledRulesManifestAndRepair(t *testing.T) {
	var manifest []struct{ Name, SHA256 string }
	data, err := os.ReadFile("rulesets/manifest.json")
	if err != nil {
		t.Fatal(err)
	}
	if err = json.Unmarshal(data, &manifest); err != nil {
		t.Fatal(err)
	}
	home := t.TempDir()
	for _, item := range manifest {
		data, err := bundledSingboxRules.ReadFile("rulesets/" + item.Name)
		if err != nil {
			t.Fatal(err)
		}
		if fmt.Sprintf("%x", sha256.Sum256(data)) != item.SHA256 {
			t.Fatal("bundled checksum mismatch", item.Name)
		}
		if _, err = srs.Read(bytes.NewReader(data), false); err != nil {
			t.Fatal("invalid bundled rule set", err)
		}
		path, err := installSingboxRule(home, item.Name)
		if err != nil {
			t.Fatal(err)
		}
		if err = os.WriteFile(path, []byte("corrupt"), 0600); err != nil {
			t.Fatal(err)
		}
		if _, err = installSingboxRule(home, item.Name); err != nil {
			t.Fatal(err)
		}
		restored, _ := os.ReadFile(path)
		if !bytes.Equal(data, restored) {
			t.Fatal("bundled rule was not repaired")
		}
	}
}

func TestSingboxRulesOfflineStartupMatchingAndModeReload(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) { w.WriteHeader(503) }))
	defer server.Close()
	handleInitClash(&InitParams{HomeDir: t.TempDir()})
	t.Cleanup(func() { handleShutdown() })
	data := ruleTestConfig(t, server.URL)
	singbox.Lock()
	err := singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal("offline startup failed", err)
	}
	for _, tc := range []struct {
		tag, target string
		want        bool
	}{
		{"cn-site", "www.baidu.com", true}, {"cn-site", "example.com", false},
		{"cn-ip", "223.5.5.5", true}, {"cn-ip", "1.1.1.1", false},
	} {
		set, ok := singbox.instance.Router().RuleSet(tc.tag)
		if !ok {
			t.Fatal("missing rule set", tc.tag)
		}
		metadata := &adapter.InboundContext{Destination: M.ParseSocksaddr(tc.target + ":443")}
		if metadata.Destination.IsFqdn() {
			metadata.Domain = tc.target
		}
		if got := set.Match(metadata); got != tc.want {
			t.Errorf("%s match %s = %v, want %v", tc.tag, tc.target, got, tc.want)
		}
	}
	for _, value := range []engineMode{"global", "direct", "rule"} {
		if err := handleUpdateConfig(&UpdateParams{Mode: &value}); err != "" {
			t.Fatal("mode reload with open cache", err)
		}
		if got := service.PtrFromContext[clashmode.Manager](singbox.ctx).Mode(); !bytes.EqualFold([]byte(got), []byte(value)) {
			t.Fatalf("mode = %s, want %s", got, value)
		}
	}
}

func TestSingboxRuleDownloadCacheAndOfflineReuse(t *testing.T) {
	var binary bytes.Buffer
	err := srs.Write(&binary, option.PlainRuleSet{Rules: []option.HeadlessRule{{Type: "default", DefaultOptions: option.DefaultHeadlessRule{Domain: []string{"cached.example"}}}}}, 3)
	if err != nil {
		t.Fatal(err)
	}
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("ETag", "rules-v1")
		_, _ = w.Write(binary.Bytes())
	}))
	defer server.Close()
	home := t.TempDir()
	handleInitClash(&InitParams{HomeDir: home})
	t.Cleanup(func() { handleShutdown() })
	data := ruleTestConfig(t, server.URL)
	singbox.Lock()
	err = singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal(err)
	}
	cache := service.FromContext[adapter.CacheFile](singbox.ctx)
	deadline := time.Now().Add(3 * time.Second)
	for cache.LoadRuleSet("cn-site") == nil || cache.LoadRuleSet("cn-ip") == nil {
		if time.Now().After(deadline) {
			t.Fatal("downloaded rules were not cached")
		}
		time.Sleep(10 * time.Millisecond)
	}
	server.Close()
	singbox.Lock()
	err = singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal("cached startup failed", err)
	}
	set, _ := singbox.instance.Router().RuleSet("cn-site")
	if !set.Match(&adapter.InboundContext{Domain: "cached.example", Destination: M.ParseSocksaddr("cached.example:443")}) {
		t.Fatal("did not restore downloaded rules")
	}
	if _, err = os.Stat(filepath.Join(home, "sing-box", "rules.db")); err != nil {
		t.Fatal(err)
	}
	cache = service.FromContext[adapter.CacheFile](singbox.ctx)
	if err = cache.SaveRuleSet("cn-site", &adapter.SavedBinary{Content: []byte("corrupt"), LastUpdated: time.Now()}); err != nil {
		t.Fatal(err)
	}
	singbox.Lock()
	err = singbox.replaceLocked(data, nil, false)
	singbox.Unlock()
	if err != nil {
		t.Fatal("corrupt cache prevented offline fallback", err)
	}
	set, _ = singbox.instance.Router().RuleSet("cn-site")
	if !set.Match(&adapter.InboundContext{Domain: "www.baidu.com", Destination: M.ParseSocksaddr("www.baidu.com:443")}) {
		t.Fatal("corrupt cache did not fall back to bundled rules")
	}
}
