<div align="center">
<img src="assets/images/icon.png" alt="FastAI" width="88">

# FastAI

A FastDog account-based proxy client for Windows, Android, macOS and Linux.

**English** · [简体中文](README_zh_CN.md) · [Website](https://fastdog.ws)
</div>

## Client workflow

Sign in with your FastDog account, synchronize the authenticated configuration,
choose a route and connect. Account renewals, orders and purchases are managed on
the website. Website links use short-lived, one-time browser login codes.

FastAI uses the V2Board V10 API and the existing Mihomo proxy core. Manual profile
imports and external URL-scheme imports are disabled in the default client. App
updates use FastAI's own platform/architecture release catalog and minimum
supported versions. Unpaid accounts can sign in and manage their account but
cannot use unavailable proxy nodes.

## Building

Use Flutter 3.47.4 / Dart 3.13.3, Go and Rust; Windows also needs Visual Studio's
C++ desktop toolchain. Initialize the core submodule before building:

```sh
git submodule update --init --recursive
flutter pub get
flutter build windows --debug --dart-define=SAFE_MODE=true
```

Native build hooks compile the Core and desktop Helper. For a host-safe development
run, always pass `--dart-define=SAFE_MODE=true`. Native Android builds need the
Android SDK/NDK and JDK 17. Configure your own release signing keys; a development
APK is not a publishable production package. The default app identity is
`ws.fastdog.fastai`, independent of upstream FlClash.

The default panel and website are `https://fastdog.ws`. Deployment overrides are
listed in [fastai.env.example.json](fastai.env.example.json).

## Releases and deployment

[FastAI release and website sign-in guide](FASTAI.md) documents the API, admin
catalog fields, signing, update behavior and deployment order. The initial FastAI
version is `1.0.0+1`; increment the build number for each published package.
Publishing source does not deploy the panel or create a signed app release.

## License and upstream

FastAI is derived from [FlClash](https://github.com/chen08209/FlClash), built on
[Clash.Meta / Mihomo](https://github.com/chen08209/Clash.Meta/tree/FlClash).
The original copyright notices and [GPL license](LICENSE) are preserved. Pinned
upstream dependency tags and subscription/changelog protocol identifiers retain
their original names. The fork's source repository URL remains
[lenaanderson5566-ops/FlClash](https://github.com/lenaanderson5566-ops/FlClash).
