package main

import (
	"github.com/metacubex/mihomo/dns"
	"github.com/metacubex/mihomo/tunnel/statistic"
	"testing"
)

func TestHistoryHooksDisabledAndProbeRoutingRetained(t *testing.T) {
	if dns.DefaultQueryNotify != nil {
		t.Fatal("DNS query history callback must be disabled")
	}
	if statistic.DefaultRequestNotify == nil {
		t.Fatal("explicit probes still need request routing notifications")
	}
}
