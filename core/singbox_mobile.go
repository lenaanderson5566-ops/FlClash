package main

import (
	"context"
	"net/netip"
	"os"

	"github.com/sagernet/sing-box/adapter"
	"github.com/sagernet/sing-box/option"
	"github.com/sagernet/sing-tun"
	"github.com/sagernet/sing/common/logger"
)

type mobilePlatform struct {
	protect func(int) error
	openTun func(*tun.Options) (tun.Tun, error)
	owner   func(*adapter.FindConnectionOwnerRequest) (*adapter.ConnectionOwner, error)
}

var _ adapter.PlatformInterface = (*mobilePlatform)(nil)

func (*mobilePlatform) Initialize(adapter.NetworkManager) error     { return nil }
func (*mobilePlatform) UsePlatformAutoDetectInterfaceControl() bool { return true }
func (p *mobilePlatform) AutoDetectInterfaceControl(fd int) error   { return p.protect(fd) }
func (*mobilePlatform) UsePlatformInterface() bool                  { return true }
func (p *mobilePlatform) OpenInterface(options *tun.Options, _ option.TunPlatformOptions) (tun.Tun, error) {
	return p.openTun(options)
}
func (*mobilePlatform) ProcessPlatformOptions(option.TunPlatformOptions) error { return nil }

// Android's existing ConnectivityManager observer owns network changes, not netlink.
func (*mobilePlatform) UsePlatformDefaultInterfaceMonitor() bool { return true }
func (*mobilePlatform) CreateDefaultInterfaceMonitor(logger.Logger) tun.DefaultInterfaceMonitor {
	return nil
}
func (*mobilePlatform) UsePlatformNetworkInterfaces() bool { return false }
func (*mobilePlatform) NetworkInterfaces() ([]adapter.NetworkInterface, error) {
	return nil, os.ErrInvalid
}
func (*mobilePlatform) UnderNetworkExtension() bool                     { return false }
func (*mobilePlatform) NetworkExtensionIncludeAllNetworks() bool        { return false }
func (*mobilePlatform) ClearDNSCache()                                  {}
func (*mobilePlatform) RequestPermissionForWIFIState() error            { return os.ErrPermission }
func (*mobilePlatform) ReadWIFIState(context.Context) adapter.WIFIState { return adapter.WIFIState{} }
func (*mobilePlatform) UsePlatformConnectionOwnerFinder() bool          { return true }
func (p *mobilePlatform) FindConnectionOwner(r *adapter.FindConnectionOwnerRequest) (*adapter.ConnectionOwner, error) {
	return p.owner(r)
}
func (*mobilePlatform) UsePlatformWIFIMonitor() bool                 { return true }
func (*mobilePlatform) UsePlatformNotification() bool                { return false }
func (*mobilePlatform) SendNotification(*adapter.Notification) error { return os.ErrInvalid }
func (*mobilePlatform) CancelNotification(string, int32) error       { return os.ErrInvalid }
func (*mobilePlatform) MyInterfaceAddress() []netip.Addr             { return nil }
func (*mobilePlatform) UsePlatformNeighborResolver() bool            { return false }
func (*mobilePlatform) StartNeighborMonitor(adapter.NeighborUpdateListener) error {
	return os.ErrInvalid
}
func (*mobilePlatform) CloseNeighborMonitor(adapter.NeighborUpdateListener) error { return nil }
func (*mobilePlatform) UsePlatformShell() bool                                    { return false }
func (*mobilePlatform) CheckPlatformShell() error                                 { return os.ErrInvalid }
func (*mobilePlatform) OpenShellSession(*adapter.PlatformUser, string, []string, string, int32, int32) (adapter.ShellSession, error) {
	return nil, os.ErrInvalid
}
func (*mobilePlatform) LookupUser(string) (*adapter.PlatformUser, error) { return nil, os.ErrInvalid }
func (*mobilePlatform) LookupSFTPServer() (string, error)                { return "", os.ErrInvalid }
func (*mobilePlatform) ReadSystemSSHHostKey() ([]byte, error)            { return nil, os.ErrInvalid }
func (*mobilePlatform) TailscaleHostname() string                        { return "FastAI" }
func (*mobilePlatform) UsePlatformBridge() bool                          { return false }
func (*mobilePlatform) CreateBridge(adapter.BridgeOptions) (adapter.BridgeSession, error) {
	return nil, os.ErrInvalid
}
