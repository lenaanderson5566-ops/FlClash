<div align="center">
<img src="assets/images/icon.png" alt="FastAI" width="88">

# FastAI

FastDog 账号客户端：专注代理连接与线路选择，续费和购买在官网完成。

[English](README.md) · **简体中文** · [官网](https://fastdog.ws)
</div>

## 使用流程

登录 FastDog 账号 → 同步配置 → 选择线路 → 连接代理。配置通过已认证的 V10
接口获取，客户端不再提供手动导入，也不接受网页或 URL schemes 唤起导入。
未付费用户可登录和管理账号，只有可用订阅或额度能够连接代理。

点击官网管理入口时，客户端申请 60 秒有效的一次性登录码。浏览器兑换该码获得
独立会话；App 的长期 token 不会写入网址，App 会话保持有效。

更新信息来自 FastAI 独立接口，按系统和 CPU 架构提供最新版本、构建号、最低
支持版本、下载地址、SHA-256 和更新说明。低于最低版本时限制连接，仍可下载
更新和访问官网。下载安装由用户在系统浏览器中确认。

## 编译

使用 Flutter 3.47.4 / Dart 3.13.3、Go 和 Rust。Windows 还需要 Visual Studio
C++ 桌面工具链；Android 需要 Android SDK/NDK 和 JDK 17。

```sh
git submodule update --init --recursive
flutter pub get
flutter build windows --debug --dart-define=SAFE_MODE=true
```

本机开发运行请使用 `SAFE_MODE=true`。发布版本需要配置自己的签名；没有签名
配置时生成的开发 APK 不应作为正式包发布。默认应用标识为 `ws.fastdog.fastai`，
与原版 FlClash 分开安装。

默认接口和官网地址为 `https://fastdog.ws`。环境配置示例见
[fastai.env.example.json](fastai.env.example.json)。

## 发布与后端

[版本机制和自动登录部署说明](FASTAI.md) 包含后台版本配置、接口定义、签名和
部署顺序。初始版本为 `1.0.0+1`，每次发布递增构建号。推送 Git 代码不会自动部署
官网，也不会自动发布已签名的安装包。

## 开源来源

项目基于 [FlClash](https://github.com/chen08209/FlClash) 和
[Clash.Meta / Mihomo](https://github.com/chen08209/Clash.Meta/tree/FlClash)。
保留原作者版权和 [GPL 许可证](LICENSE)。上游依赖标签、订阅格式和历史更新日志
协议标记属于兼容标识，保留原名称。仓库地址仍为
[lenaanderson5566-ops/FlClash](https://github.com/lenaanderson5566-ops/FlClash)。
