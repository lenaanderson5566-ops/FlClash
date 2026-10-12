# FastAI sing-box on macOS

The app uses sing-box by default, with explicit Mihomo fallback. The existing
FastAICore process, IPC lifecycle, TUN authorization and system proxy/DNS cleanup
remain authoritative. TUN names are allocated by sing-tun to avoid an occupied
utun interface. Subscription JSON and local protocol capability filtering use the
same app API as Windows and Android; no backend changes are needed.

## Build

Use macOS 12 or newer, Xcode with its command-line tools selected, Go and the
Flutter version pinned by the repository. Run `dart setup.dart macos` on the
architecture being packaged (Apple Silicon or Intel). The build hook uses CGO,
the selected macOS SDK and deployment target 12.0. `macos_tags` enables Naive.
Cronet static libraries for both architectures are pinned by go.mod/go.sum.
The executable is signed by the existing Xcode Copy Core phase; the Cronet
license is copied into the app Resources. No external Cronet dylib is loaded.

## Verification on a Mac

Run the normal Flutter analysis and focused tests, then run in core:

```sh
CGO_ENABLED=1 MACOSX_DEPLOYMENT_TARGET=12.0 go test -tags=with_gvisor,with_quic,with_utls,with_wireguard,with_naive_outbound .
```

The shared Naive test exercises local TLS/HTTP2 and repeated start/close.
Validate a signed build on Intel and Apple Silicon: system proxy, administrator
approval/cancellation, TUN, Naive connection, switching back to Mihomo,
sleep/wake, network changes and DNS/proxy restoration after disconnect/exit.
A Windows cross-build without CGO only checks the portable Darwin core; it does
not validate the Xcode/Cronet link, signing, permissions or actual TUN networking.

Hiddify's desktop core/service separation was reviewed as design reference.
This integration uses FastAI's existing lifecycle and official sing-box/Cronet;
no Hiddify implementation was copied. References:
- https://github.com/hiddify/hiddify-app/blob/main/lib/hiddifycore/core_interface/core_interface_desktop.dart
- https://github.com/hiddify/hiddify-app/blob/main/LICENSE.md
- https://github.com/SagerNet/cronet-go
