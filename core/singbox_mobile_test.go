package main

import (
	"context"
	"errors"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	box "github.com/sagernet/sing-box"
	"github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/include"
	"github.com/sagernet/sing-box/option"
	M "github.com/sagernet/sing/common/metadata"
	"github.com/sagernet/sing/service"
)

func TestMobileSocketProtection(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) { w.WriteHeader(204) }))
	defer server.Close()
	for _, refused := range []bool{false, true} {
		t.Run(map[bool]string{false: "allowed", true: "refused"}[refused], func(t *testing.T) {
			calls := 0
			denied := errors.New("VPN refused protection")
			ctx := service.ContextWithDefaultRegistry(include.Context(context.Background()))
			service.MustRegister[adapter.PlatformInterface](ctx, &mobilePlatform{protect: func(fd int) error {
				calls++
				if fd <= 0 {
					t.Error("invalid socket descriptor")
				}
				if refused {
					return denied
				}
				return nil
			}})
			instance, err := box.New(box.Options{Context: ctx, Options: option.Options{
				Log:       &option.LogOptions{Disabled: true},
				Route:     &option.RouteOptions{AutoDetectInterface: true},
				Outbounds: []option.Outbound{{Type: "direct", Tag: "DIRECT", Options: &option.DirectOutboundOptions{}}},
			}})
			if err != nil {
				t.Fatal(err)
			}
			defer instance.Close()
			if err = instance.Start(); err != nil {
				t.Fatal(err)
			}
			outbound, _ := instance.Outbound().Outbound("DIRECT")
			conn, err := outbound.DialContext(ctx, "tcp", M.ParseSocksaddr(server.Listener.Addr().String()))
			if conn != nil {
				defer conn.Close()
			}
			if refused && err == nil {
				t.Fatal("unprotected connection was accepted")
			}
			if !refused && err != nil {
				t.Fatal(err)
			}
			if calls == 0 {
				t.Fatal("socket protection was bypassed")
			}
		})
	}
}

func TestNotificationSamplingDoesNotConsumeUISample(t *testing.T) {
	singbox.Lock()
	if err := singbox.replaceLocked([]byte(singboxTestConfig), nil, false); err != nil {
		singbox.Unlock()
		t.Fatal(err)
	}
	sampledAt := time.Now().Add(-time.Second)
	singbox.sampledAt = sampledAt
	singbox.Unlock()
	defer func() {
		singbox.Lock()
		singbox.closeLocked()
		singbox.configuration = nil
		singbox.Unlock()
	}()
	if _, active := singboxNotificationTraffic(false); !active {
		t.Fatal("missing native traffic sample")
	}
	if _, active := singboxNotificationTraffic(true); !active {
		t.Fatal("missing native traffic total")
	}
	singbox.RLock()
	defer singbox.RUnlock()
	if !singbox.sampledAt.Equal(sampledAt) {
		t.Fatal("notification changed UI sampling interval")
	}
}
