//go:build android && cgo

package main

import (
	"context"
	"net"
	"net/netip"
	"os"
	"strconv"
	"strings"
	"syscall"

	"github.com/metacubex/mihomo/component/resolver"
	mdns "github.com/miekg/dns"
	"github.com/sagernet/sing-box/adapter"
	sdns "github.com/sagernet/sing-box/dns"
	"github.com/sagernet/sing-box/log"
	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing-tun"
	"github.com/sagernet/sing/service"
)

func singboxPlatformContext(ctx context.Context) context.Context {
	installHooks()
	service.MustRegister[adapter.PlatformInterface](ctx, &mobilePlatform{
		protect: func(fd int) error {
			th := activeTunHandler.Load()
			if th == nil {
				return nil
			}
			return th.handleProtect(fd)
		},
		openTun: func(options *tun.Options) (tun.Tun, error) {
			th := activeTunHandler.Load()
			if th == nil {
				return nil, errTunNotReady
			}
			th.mu.RLock()
			defer th.mu.RUnlock()
			if th.singboxFD <= 0 {
				return nil, errTunNotReady
			}
			fd, err := syscall.Dup(th.singboxFD)
			if err != nil {
				return nil, err
			}
			options.FileDescriptor = fd
			options.AutoRoute = false
			options.MTU = 9000
			device, err := tun.New(*options)
			if err != nil {
				syscall.Close(fd)
			}
			return device, err
		},
		owner: func(request *adapter.FindConnectionOwnerRequest) (*adapter.ConnectionOwner, error) {
			th := activeTunHandler.Load()
			if th == nil {
				return nil, os.ErrNotExist
			}
			source := net.JoinHostPort(request.SourceAddress, strconv.Itoa(int(request.SourcePort)))
			target := net.JoinHostPort(request.DestinationAddress, strconv.Itoa(int(request.DestinationPort)))
			var src, dst net.Addr
			if request.IpProtocol == syscall.IPPROTO_UDP {
				src, _ = net.ResolveUDPAddr("udp", source)
				dst, _ = net.ResolveUDPAddr("udp", target)
			} else {
				src, _ = net.ResolveTCPAddr("tcp", source)
				dst, _ = net.ResolveTCPAddr("tcp", target)
			}
			if src == nil || dst == nil {
				return nil, os.ErrInvalid
			}
			uid, name := th.handleResolveProcess(src, dst)
			if uid < 0 {
				return nil, os.ErrNotExist
			}
			return &adapter.ConnectionOwner{UserId: int32(uid), AndroidPackageNames: []string{name}}, nil
		},
	})
	registry := service.FromContext[adapter.DNSTransportRegistry](ctx).(*sdns.TransportRegistry)
	sdns.RegisterTransport[option.LocalDNSServerOptions](registry, "local", func(ctx context.Context, logger log.ContextLogger, tag string, options option.LocalDNSServerOptions) (adapter.DNSTransport, error) {
		return &androidSystemDNS{TransportAdapter: sdns.NewTransportAdapterWithLocalOptions("local", tag, options)}, nil
	})
	return ctx
}

type androidSystemDNS struct{ sdns.TransportAdapter }

func (*androidSystemDNS) Start(adapter.StartStage, *adapter.Scope) error { return nil }
func (*androidSystemDNS) Reset()                                         {}
func (*androidSystemDNS) Exchange(ctx context.Context, message *mdns.Msg) (*mdns.Msg, error) {
	return resolver.SystemResolver.ExchangeContext(ctx, message)
}

func (d *androidSystemDNS) ExchangeAsync(ctx context.Context, message *mdns.Msg, callback func(*mdns.Msg, error)) {
	safeGoDetached("singboxAndroidDNS", func() {
		response, err := d.Exchange(ctx, message)
		callback(response, err)
	})
}

func configureSingboxPlatform(options *option.Options, running bool) error {
	if options.Route == nil {
		options.Route = &option.RouteOptions{}
	}
	options.Route.AutoDetectInterface = true
	// Only VpnService establishes routes; each box owns a duplicate of its descriptor.
	inbounds := options.Inbounds[:0]
	for _, inbound := range options.Inbounds {
		if inbound.Type != "tun" {
			inbounds = append(inbounds, inbound)
		}
	}
	options.Inbounds = inbounds
	th := activeTunHandler.Load()
	if !running || th == nil {
		return nil
	}
	th.mu.RLock()
	defer th.mu.RUnlock()
	if th.singboxFD <= 0 {
		return nil
	}
	tunOptions := &option.TunInboundOptions{InterfaceName: "FastAI", MTU: 9000, Stack: strings.ToLower(th.singboxStack)}
	for _, value := range strings.Split(th.singboxAddress, ",") {
		prefix, err := netip.ParsePrefix(strings.TrimSpace(value))
		if err != nil {
			return err
		}
		tunOptions.Address = append(tunOptions.Address, prefix)
	}
	options.Inbounds = append(options.Inbounds, option.Inbound{Type: "tun", Tag: "fastai-android-tun", Options: tunOptions})
	return nil
}
