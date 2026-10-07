// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static String m0(count, skipped) => "将添加 ${count} 项，跳过 ${skipped} 项已存在";

  static String m1(code) =>
      "Windows 阻止了 FastAICore.exe（错误 ${code}）。请安装官方签名版本，或联系管理员检查应用控制策略。";

  static String m2(name) => "FastAI 连续两次未能完成启动，已暂停配置 ${name} 以避免重复崩溃。请在首页重新连接。";

  static String m3(url) => "是否要通过 ${url} 创建配置？";

  static String m4(count) => "${count} 天前";

  static String m5(label) => "确定删除选中的${label}吗？";

  static String m6(label) => "确定删除当前${label}吗？";

  static String m7(label) => "${label}详情";

  static String m8(label) => "${label}不能为空";

  static String m9(label) => "${label}当前已存在";

  static String m10(name) => "${name} 已是最新版本";

  static String m11(name) => "${name} 已更新";

  static String m12(count) => "${count} 小时前";

  static String m13(count) => "${count} 小时";

  static String m14(target) => "${target} 是一个无效的策略";

  static String m15(ruleSet) => "${ruleSet} 不是有效的规则集";

  static String m16(subRule) => "${subRule} 是一个无效的SUB_RULE";

  static String m17(line, message) => "第 ${line} 行：${message}";

  static String m18(label, max) => "${label}最多${max}个字符";

  static String m19(size) => "已释放 ${size}";

  static String m20(count) => "${count} 分钟前";

  static String m21(count) => "${count} 个月前";

  static String m22(code) => "服务器拒绝访问（HTTP ${code}），链接可能已过期或凭据有误";

  static String m23(code) => "服务器拒绝了请求（HTTP ${code}）";

  static String m24(code) => "该地址下没有内容（HTTP ${code}），请确认链接是否正确";

  static String m25(detail) => "网络请求失败：${detail}";

  static String m26(code) => "服务器出现问题（HTTP ${code}），请稍后再试";

  static String m27(label) => "暂无${label}";

  static String m28(message) => "内核无法解析该代理：${message}";

  static String m29(name) => "名称 ${name} 已被其他代理或策略组使用";

  static String m30(path) => "策略组之间存在循环引用：${path}";

  static String m31(names) => "以下代理集不存在：${names}";

  static String m32(names) => "以下代理或策略不存在：${names}";

  static String m33(name) => "${name} 是内置策略名，不能在此使用";

  static String m34(names) => "配置文件自身的策略组引用了自定义代理中已没有的代理：${names}";

  static String m35(label, profiles) =>
      "${label} 仍被 ${profiles} 的自定义策略组或规则使用，请先在那里移除";

  static String m36(profiles, label) =>
      "${profiles} 的订阅里已有 ${label}，改名后这些配置会改用订阅里的那个，请换一个名称";

  static String m37(count) => "${count} 个代理";

  static String m38(count) => "${count} 条规则";

  static String m39(appName) => "${appName}（安全模式）";

  static String m40(count) => "${count} 秒";

  static String m41(count) => "已选择 ${count} 项";

  static String m42(time) => "检测于 ${time}";

  static String m43(label) => "${label}只能是一项";

  static String m44(label) => "${label}必须为URL";

  static String m45(count) => "${count} 年前";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("关于"),
    "accessControl": MessageLookupByLibrary.simpleMessage("哪些应用使用代理"),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "只允许选中应用进入VPN",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "选择加入或排除 VPN 的应用",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "应用访问控制已关闭",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "选中应用将会被排除在VPN之外",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage("访问控制设置"),
    "account": MessageLookupByLibrary.simpleMessage("帐号"),
    "action": MessageLookupByLibrary.simpleMessage("操作"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("测试全部延迟"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("直连模式"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("全局模式"),
    "actionMode": MessageLookupByLibrary.simpleMessage("切换模式"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("系统代理"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("规则模式"),
    "actionStart": MessageLookupByLibrary.simpleMessage("启动/停止"),
    "actionTun": MessageLookupByLibrary.simpleMessage("虚拟网卡"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage("更新全部配置"),
    "actionView": MessageLookupByLibrary.simpleMessage("显示/隐藏"),
    "add": MessageLookupByLibrary.simpleMessage("添加"),
    "addProfile": MessageLookupByLibrary.simpleMessage("添加配置"),
    "addRule": MessageLookupByLibrary.simpleMessage("添加规则"),
    "addedRules": MessageLookupByLibrary.simpleMessage("附加规则"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "agree": MessageLookupByLibrary.simpleMessage("同意"),
    "allowBypass": MessageLookupByLibrary.simpleMessage("允许应用绕过VPN"),
    "allowLan": MessageLookupByLibrary.simpleMessage("局域网代理"),
    "answers": MessageLookupByLibrary.simpleMessage("应答"),
    "app": MessageLookupByLibrary.simpleMessage("应用"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage("应用访问控制"),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage("追加系统DNS"),
    "authentication": MessageLookupByLibrary.simpleMessage("认证"),
    "authorize": MessageLookupByLibrary.simpleMessage("授权"),
    "authorized": MessageLookupByLibrary.simpleMessage("已授权"),
    "auto": MessageLookupByLibrary.simpleMessage("自动"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage("自动检查更新"),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("自启动"),
    "autoRun": MessageLookupByLibrary.simpleMessage("启动后自动连接"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage("自动设置系统DNS"),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("自动更新"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage("自动更新间隔（分钟）"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "backup": MessageLookupByLibrary.simpleMessage("备份"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "该备份来自更高版本的应用，请先更新应用再恢复",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("基础信息"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("批量添加"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage("每行一项，也可用逗号分隔"),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage("每行一条，键和值之间用空格分隔"),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("行为"),
    "bind": MessageLookupByLibrary.simpleMessage("绑定"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("黑名单模式"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("阻止连接"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("排除域名"),
    "cache": MessageLookupByLibrary.simpleMessage("缓存"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("缓存算法"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage("缓存已损坏，是否清空？"),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("缓存大小"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "请在系统设置中允许访问相机以扫描二维码，或从相册选择二维码图片。",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage("需要相机权限"),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage("相机不可用"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("取消全选"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "切换代理失败，已恢复上一次的选择",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage("重大变更"),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("新功能"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("问题修复"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("性能优化"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("已回滚"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage("校验 TLS 证书"),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("检查更新"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage("当前应用已经是最新版了"),
    "clearSearch": MessageLookupByLibrary.simpleMessage("清除搜索"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage("导出剪贴板"),
    "clipboardImport": MessageLookupByLibrary.simpleMessage("剪贴板导入"),
    "close": MessageLookupByLibrary.simpleMessage("关闭"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("关闭连接"),
    "color": MessageLookupByLibrary.simpleMessage("颜色"),
    "columns": MessageLookupByLibrary.simpleMessage("列数"),
    "compatible": MessageLookupByLibrary.simpleMessage("兼容模式"),
    "confirm": MessageLookupByLibrary.simpleMessage("确定"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage("确定要退出当前窗口吗？"),
    "connected": MessageLookupByLibrary.simpleMessage("已连接"),
    "connecting": MessageLookupByLibrary.simpleMessage("连接中…"),
    "connection": MessageLookupByLibrary.simpleMessage("连接"),
    "connections": MessageLookupByLibrary.simpleMessage("连接"),
    "connectivity": MessageLookupByLibrary.simpleMessage("连通性："),
    "content": MessageLookupByLibrary.simpleMessage("内容"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("内容主题"),
    "copy": MessageLookupByLibrary.simpleMessage("复制"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage("复制环境变量"),
    "copyLink": MessageLookupByLibrary.simpleMessage("复制链接"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("复制成功"),
    "core": MessageLookupByLibrary.simpleMessage("内核"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows 智能应用控制阻止了 FastAICore.exe。请安装官方签名版本或联系支持，并保持 Windows 安全防护开启。",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("核心状态"),
    "country": MessageLookupByLibrary.simpleMessage("区域"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("检测到崩溃"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("崩溃分析"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "开启后，应用崩溃时自动上传不包含敏感信息的崩溃日志",
    ),
    "create": MessageLookupByLibrary.simpleMessage("创建"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("创建时间"),
    "custom": MessageLookupByLibrary.simpleMessage("自定义"),
    "cut": MessageLookupByLibrary.simpleMessage("剪切"),
    "dark": MessageLookupByLibrary.simpleMessage("深色"),
    "dashboard": MessageLookupByLibrary.simpleMessage("仪表盘"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage("检测到数据有更改，是否保存"),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "本应用使用 Firebase Crashlytics 收集崩溃信息以改进应用稳定性。\n收集的数据包括设备信息和崩溃详情，不包含个人敏感数据。\n您可以在设置中关闭此功能。",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage("数据收集说明"),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "保存更改失败，已回滚",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("默认"),
    "delay": MessageLookupByLibrary.simpleMessage("延迟"),
    "delayTest": MessageLookupByLibrary.simpleMessage("延迟测试"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "基于ClashMeta的多平台代理客户端，简单易用，开源无广告。",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("目标地址"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("目标地理定位"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("目标IP ASN"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage("依赖第三方api，仅供参考"),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("拨号代理"),
    "direct": MessageLookupByLibrary.simpleMessage("直连"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("禁用UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("已关闭"),
    "disconnected": MessageLookupByLibrary.simpleMessage("已断开"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage("发现新版本"),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("DNS劫持"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("DNS模式"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNS查询"),
    "docked": MessageLookupByLibrary.simpleMessage("固定"),
    "domain": MessageLookupByLibrary.simpleMessage("域名"),
    "download": MessageLookupByLibrary.simpleMessage("下载"),
    "edit": MessageLookupByLibrary.simpleMessage("编辑"),
    "editRule": MessageLookupByLibrary.simpleMessage("编辑规则"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("已开启"),
    "entries": MessageLookupByLibrary.simpleMessage("个条目"),
    "error": MessageLookupByLibrary.simpleMessage("错误"),
    "exclude": MessageLookupByLibrary.simpleMessage("从最近任务中隐藏"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage("应用在后台时，从最近任务中隐藏应用"),
    "excludeType": MessageLookupByLibrary.simpleMessage("排除类型"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("退出"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("退出全屏"),
    "expand": MessageLookupByLibrary.simpleMessage("标准"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("预期状态"),
    "expireTime": MessageLookupByLibrary.simpleMessage("到期时间"),
    "exportFile": MessageLookupByLibrary.simpleMessage("导出文件"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("导出日志"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("导出成功"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("表现力"),
    "externalController": MessageLookupByLibrary.simpleMessage("外部控制器"),
    "externalLink": MessageLookupByLibrary.simpleMessage("外部链接"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("超大"),
    "fade": MessageLookupByLibrary.simpleMessage("淡入"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("Fallback过滤"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "账号信息暂未刷新，连接时将重新检查账号状态。",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "在后台检查新版本，下载和安装需要手动确认。",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("自动选择"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage("后台与通知"),
    "fdBanned": MessageLookupByLibrary.simpleMessage("账户已停用"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "无法验证服务器证书，请检查系统时间或联系支持。",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage("系统网络连接"),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("TCP 连通性"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("安全连接"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("选择线路"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("客户端配置"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI 暂时不可用，请前往官网联系支持。",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "两条路径均未通过。可能是共有网络问题，也可能是目标地址受限，请结合分层结果判断。",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "本次两条路径均访问到检测地址。",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("连接对比"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "系统路径通过，所选线路失败。建议先排查线路，尚不能确认根因。",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "所选线路通过，系统路径失败。建议检查系统 DNS、路由及本地网络限制。",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("连接"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("已连接"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("连接"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "连接失败，请重试或切换线路。",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("复制技术报告"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage("独立流量剩余"),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "独立流量与周期流量分别计量，不随周期重置清除；可用线路和有效期以账号权益为准。",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("当前线路"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "检查期间连接设置发生变化，请重新检查。",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "内核或线路列表未就绪，请刷新线路后重新连接。",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "尚未连接，请连接后检查代理线路。",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("系统 DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "域名解析失败或超时，请检查网络或切换网络后重试。",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage("公共检测域名解析成功。"),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage("查找连接问题并按指引恢复"),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Windows 代理或 PAC 与当前模式不一致，请检查其他 VPN/代理软件及系统代理设置，再重新连接。",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "本地代理端口未响应，请断开后重新连接，再次检查。",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "本地端口可达；此项不验证远端线路。",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Windows 手动代理和 PAC 设置与当前模式一致。",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("重新检查"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("当前线路"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "当前线路未能访问检测地址，请切换线路；全部失败时检查 DNS 和本地网络。",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "当前所选线路已访问 HTTPS 检测地址；不代表所有服务均可访问。",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage("正在检查网络连接…"),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "安全模式下跳过：不启用代理内核和系统设置。",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "内核、线路和连接权限已就绪；此项不代表所有系统设置均无冲突。",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "当前连接状态或设备无需执行此项检查。",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "TUN 权限未就绪，请重新连接并完成授权，或切换系统代理。",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "此项暂未完成验证，请重试或按下方指引排查。",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "公共检测端点未通过检查，不能仅凭此结果判断整个互联网不可用。",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "公共检测端点返回了预期响应。",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("断开连接"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("未连接"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("正在断开…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("邮箱"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage("流量已用尽，请续费或购买流量包。"),
    "fdExpired": MessageLookupByLibrary.simpleMessage("套餐已到期"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("周期到期时间"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("全局模式"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage("检查完成，部分项目尚未验证"),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage("有检测项需要处理"),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage("已执行的检查均通过"),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "请查看下方结果，修复操作仅在你点击后执行。",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage("选择线路，一键连接。"),
    "fdHome": MessageLookupByLibrary.simpleMessage("首页"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "服务器返回的配置异常，请重新同步或联系支持。",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage("邮箱或密码错误"),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage("当前已是最新版本"),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("本地代理"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · 连接后可供其他软件使用。",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("登录"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("退出登录"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("网络连通性"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage("一键网络诊断"),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage("无法连接服务，请检查网络后重试。"),
    "fdNextReset": MessageLookupByLibrary.simpleMessage("下次自动重置（本地时间）"),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("无周期到期时间"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage("购买套餐后即可开始使用"),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "暂无可用线路，请前往官网检查账号权益。",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage("官方网站"),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("周期流量已用"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage("互联网连通性"),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage("操作过于频繁，请稍后重试。"),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "与所选线路使用同一 HTTPS 检测地址，不显式指定应用代理。TUN 或系统路由仍可能影响此路径，不保证绕过 VPN。",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("问题编号"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("刷新"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage("前往官网注册或找回密码"),
    "fdRemaining": MessageLookupByLibrary.simpleMessage("周期剩余流量"),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage("重新获取配置并连接"),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "操作未能完成。请查看下方最新结果，必要时登录并检查账号使用权限。",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "操作可能短暂中断连接或更换所选线路，完成后会自动复测。线路恢复最多检测 5 条其他线路。",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("重新连接"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage("检测并切换可用线路"),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "操作已执行，但尚未确认恢复，请按下方结果继续排查。",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "代理线路已通过复测，请继续查看下方剩余提示。",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage("正在处理并重新验证连接…"),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("复制报告"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("判断依据"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "两个检测域名均需在 8 秒内返回至少一个地址。此项检查系统解析器，不检测 DNS 泄漏，也不验证具体上游 DNS 服务器。",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. 检查 Wi-Fi/网线，并完成公共网络登录认证。\n2. 切换网络后重新检查，判断是否为当前网络的 DNS 问题。\n3. 仍然失败时，将报告交给客服或网络管理员。",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("异常"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage("未采集到实测参数。"),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "此项无需修复。结果仅代表本次检测，不保证所有服务均可访问。",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage("技术参数（ms 为毫秒）"),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("通过"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "8 秒内成功连接配置的本机回环 TCP 端口。此项不确认监听进程身份，也不验证远端线路。",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. 在 FastAI 中断开后重新连接。\n2. 仍失败时重启 FastAI 后再检查。\n3. 将报告交给支持；端口连接失败本身不能证明端口被其他软件占用。",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "复制报告包含检测地址和 DNS 解析结果，不包含账号、令牌、订阅内容或 PAC 地址。",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "核对 Windows 当前用户的手动 HTTP/HTTPS 代理与所选模式，启用 PAC 时提示潜在冲突。不检查防火墙、WinHTTP 和组织策略。",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. 打开 Windows 设置 → 网络和 Internet → 代理。\n2. 退出其他代理/VPN 软件，核对自己配置的手动代理或 PAC；不要擅自移除组织管理的设置。\n3. 重新连接 FastAI 后复查。",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("修复与后续操作"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "当前线路须在 8 秒内返回 HTTP 204，且没有代理错误。",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. 切换其他线路后重试。\n2. 所有线路都失败时，结合 DNS 和本地代理结果排查。\n3. 若仅检测地址失败，请验证实际需要的服务，并将报告交给支持。",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "请使用正常模式客户端并连接后重新检查。移动端不执行桌面代理端口检查。",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. 确认已登录且账号具备连接权限。\n2. 刷新线路后重新连接。\n3. TUN 授权异常时完成权限授权，或切换为系统代理。",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("未执行"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("检查开始时间"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("未验证"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "保持证书验证开启。公共检测端点须在 8 秒内返回 HTTP 204，不跟随重定向。",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. 检查系统日期和时间。\n2. 完成 Wi-Fi 联网认证，或尝试其他网络。\n3. 对照另一检测端点和代理路径结果，不要关闭证书验证。",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage("操作失败，请重试。"),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage("请求超时，请检查网络后重试。"),
    "fdRequired": MessageLookupByLibrary.simpleMessage("请填写此项"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "确认消耗一次可用重置次数，清零当前周期已用流量？独立流量、套餐及到期时间保持不变。",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage("可用流量重置次数"),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage("当前没有需要重置的周期已用流量。"),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "消耗一次可用重置次数，清零周期已用流量；独立流量和套餐到期时间不变。",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage("需要有效的周期流量套餐才能重置。"),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage("暂无可用流量重置次数。"),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage("周期流量已重置，账号信息已刷新。"),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage("重置周期流量"),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "暂时无法获取重置权益，请刷新账号信息后重试。",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage("确认重置结果"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("检测失败"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("上次检测"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("低延迟"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("延迟较高"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("未检测"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage("登录已失效，请重新登录。"),
    "fdShop": MessageLookupByLibrary.simpleMessage("套餐"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("智能模式"),
    "fdSync": MessageLookupByLibrary.simpleMessage("刷新线路"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage("线路刷新失败，请重试后再连接。"),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage("正在同步线路…"),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "在 8 秒内连接公共检测服务器，总耗时包含域名解析。",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "TCP 连接失败，请结合 DNS、网络接入及过滤规则排查，不能仅凭此项断定防火墙故障。",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage("检测服务器的 TCP 连接正常。"),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. 先查看 DNS 检测结果。\n2. 切换网络，或完成网络登录认证后重试。\n3. 与管理员核对防火墙/VPN 规则，不要直接关闭防火墙。",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "8 秒内使用系统信任库完成 TLS；耗时包含 DNS 和 TCP，成功时记录证书有效期。",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS 未完成，请检查系统时间、网络拦截及证书信任，不要关闭证书校验。",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage("TLS 握手和证书校验通过。"),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "请更新 FastAI 后继续连接",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("使用一次重置"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "请检查邮箱和密码，或前往官网完成验证。",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("官网账户服务"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "续费、订单、账户设置与客服请前往官网办理。",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage("登录后连接并选择线路"),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("高保真"),
    "file": MessageLookupByLibrary.simpleMessage("文件"),
    "fileDesc": MessageLookupByLibrary.simpleMessage("直接上传配置文件"),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage("文件有修改，是否保存修改"),
    "filter": MessageLookupByLibrary.simpleMessage("筛选"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("查找进程"),
    "floating": MessageLookupByLibrary.simpleMessage("悬浮"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("字体"),
    "fontSize": MessageLookupByLibrary.simpleMessage("大小"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage("您确定要强制重启核心吗？"),
    "format": MessageLookupByLibrary.simpleMessage("格式"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("果缤纷"),
    "general": MessageLookupByLibrary.simpleMessage("常规"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("自动更新"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage("Geo低内存模式"),
    "global": MessageLookupByLibrary.simpleMessage("全局"),
    "go": MessageLookupByLibrary.simpleMessage("前往"),
    "goDownload": MessageLookupByLibrary.simpleMessage("前往下载"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Helper 服务不可用，无法启用 TUN 模式，请重新安装 FastAI。",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("隐藏 IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage("隐藏超时节点"),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "不显示上次延迟测试超时的节点",
    ),
    "host": MessageLookupByLibrary.simpleMessage("主机"),
    "hours": MessageLookupByLibrary.simpleMessage("小时"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("图片"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("图标记录"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("图标样式"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("图标链接"),
    "import": MessageLookupByLibrary.simpleMessage("导入"),
    "importFile": MessageLookupByLibrary.simpleMessage("通过文件导入"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("从URL导入"),
    "inbound": MessageLookupByLibrary.simpleMessage("入站"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage("包含所有代理"),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("长期有效"),
    "init": MessageLookupByLibrary.simpleMessage("初始化"),
    "initiator": MessageLookupByLibrary.simpleMessage("发起方"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "读取应用列表权限已被拒绝，无法获取已安装的应用。请前往系统设置手动开启。",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "当前系统在授权前不会提供已安装的应用列表，授权后即可配置分应用代理。",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "需要读取应用列表权限",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage("智能选择"),
    "interfaceName": MessageLookupByLibrary.simpleMessage("网卡名称"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage("出站网卡"),
    "internet": MessageLookupByLibrary.simpleMessage("互联网"),
    "interval": MessageLookupByLibrary.simpleMessage("间隔"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("内网 IP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage("无效备份文件"),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "DSCP 标记不能超过 63",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "仅支持 tcp 或 udp",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "该二维码不包含配置文件链接",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "请输入数字或范围，如 80 或 8000-9000，多个用 / 分隔",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP 地址"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("滥用记录"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("代理"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("命中标记"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("组织"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage("类型查询失败"),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("优"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("等级"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("普通"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("重新查询"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("风险"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("采用来源"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("各来源"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage("出站 IP 不一致"),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("无法判定类型"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage("限流"),
    "ipType": MessageLookupByLibrary.simpleMessage("类型"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("商业"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("机房"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("移动网络"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("住宅"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("IPv6超时（毫秒）"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("刚刚"),
    "key": MessageLookupByLibrary.simpleMessage("键"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("上次更新"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage("启动未完成"),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "应用上次在启动过程中意外退出。已跳过本次自动配置，你可以手动启动重试。",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("布局"),
    "light": MessageLookupByLibrary.simpleMessage("浅色"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("自动换行"),
    "list": MessageLookupByLibrary.simpleMessage("列表"),
    "listen": MessageLookupByLibrary.simpleMessage("监听"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage("监听路由标记"),
    "liveConnections": MessageLookupByLibrary.simpleMessage("实时连接"),
    "loading": MessageLookupByLibrary.simpleMessage("加载中…"),
    "local": MessageLookupByLibrary.simpleMessage("本地"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "本地网络权限被拒绝：已改用 gvisor 栈，局域网无法访问。",
    ),
    "log": MessageLookupByLibrary.simpleMessage("日志"),
    "logLevel": MessageLookupByLibrary.simpleMessage("日志等级"),
    "logs": MessageLookupByLibrary.simpleMessage("日志"),
    "loopback": MessageLookupByLibrary.simpleMessage("UWP 回环解锁"),
    "loose": MessageLookupByLibrary.simpleMessage("宽松"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("最大失败次数"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("最大化"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage("常驻内存"),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage("应用及共享"),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("堆内存空闲"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage("堆内存使用中"),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage("内核未运行"),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage("运行时开销"),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("协程栈"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "基于进程常驻内存估算，可能与系统显示的数值不同。",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "内核与应用运行在同一进程，内核部分按运行时统计估算，其余计入应用及共享内存。",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("内存信息"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("内存已释放"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("最小"),
    "minimize": MessageLookupByLibrary.simpleMessage("最小化"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage("关闭窗口后继续运行"),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("混合端口"),
    "mode": MessageLookupByLibrary.simpleMessage("模式"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("单色"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "name": MessageLookupByLibrary.simpleMessage("名称"),
    "network": MessageLookupByLibrary.simpleMessage("网络"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage("请求已取消"),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "无法连接到服务器，请检查网络连接或代理设置",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("网络检测"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "无法解析服务器地址，请确认链接正确且 DNS 可用",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "请求过于频繁（HTTP 429），请稍后再试",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("网络速度"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "请求超时，请检查网络或代理后重试",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "安全连接失败，服务器证书可能无效，或连接被拦截",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("网络类型"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("中性"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "noData": MessageLookupByLibrary.simpleMessage("暂无数据"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("不再提示"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("无网络"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("无网络应用"),
    "noResolve": MessageLookupByLibrary.simpleMessage("不解析IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage("没有匹配的结果"),
    "none": MessageLookupByLibrary.simpleMessage("无"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage("当前代理组无法选中"),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage("添加一个配置文件后即可开始使用"),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage("仅统计代理流量"),
    "optional": MessageLookupByLibrary.simpleMessage("可选"),
    "options": MessageLookupByLibrary.simpleMessage("选项"),
    "other": MessageLookupByLibrary.simpleMessage("其他"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("出站 IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("出站模式"),
    "override": MessageLookupByLibrary.simpleMessage("覆写"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("覆写DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("覆写模式"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("覆写NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage("名称为空"),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "未选择任何代理或代理集，内核会拒绝该策略组",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("自定义"),
    "palette": MessageLookupByLibrary.simpleMessage("调色板"),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "paste": MessageLookupByLibrary.simpleMessage("粘贴"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("从相册选择"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("窗口置顶"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "请上传有效的二维码",
    ),
    "port": MessageLookupByLibrary.simpleMessage("端口"),
    "preview": MessageLookupByLibrary.simpleMessage("预览"),
    "process": MessageLookupByLibrary.simpleMessage("进程"),
    "profile": MessageLookupByLibrary.simpleMessage("配置"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("请输入有效间隔时间格式"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("请输入自动更新间隔时间"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "配置文件已经修改，是否关闭自动更新？",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "请输入配置名称",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "请输入有效配置URL",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "请输入配置URL",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("配置"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("配置排序"),
    "project": MessageLookupByLibrary.simpleMessage("项目"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage("订阅"),
    "providers": MessageLookupByLibrary.simpleMessage("外部资源"),
    "proxies": MessageLookupByLibrary.simpleMessage("代理"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("代理链"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("策略组"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("代理节点"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("代理集"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("纯黑"),
    "qrcode": MessageLookupByLibrary.simpleMessage("二维码"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage("扫描二维码获取配置文件"),
    "quickAdd": MessageLookupByLibrary.simpleMessage("快捷添加"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("彩虹"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("最近请求"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Redir端口"),
    "redo": MessageLookupByLibrary.simpleMessage("重做"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("释放内存"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage("释放内存失败"),
    "remote": MessageLookupByLibrary.simpleMessage("远程"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("远程目标"),
    "remove": MessageLookupByLibrary.simpleMessage("移除"),
    "replace": MessageLookupByLibrary.simpleMessage("替换"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("全部替换"),
    "request": MessageLookupByLibrary.simpleMessage("请求"),
    "requests": MessageLookupByLibrary.simpleMessage("请求"),
    "reset": MessageLookupByLibrary.simpleMessage("重置"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "当前页面存在更改，确定重置吗？",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("资源"),
    "respectRules": MessageLookupByLibrary.simpleMessage("遵守规则"),
    "restart": MessageLookupByLibrary.simpleMessage("重启"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage("您确定要重启核心吗？"),
    "restore": MessageLookupByLibrary.simpleMessage("恢复"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("恢复策略"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage("兼容"),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("覆盖"),
    "retry": MessageLookupByLibrary.simpleMessage("重试"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("路由地址"),
    "routeMode": MessageLookupByLibrary.simpleMessage("路由模式"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage("绕过私有路由地址"),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("使用配置"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("规则"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage("逻辑规则 AND"),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage("匹配完整域名"),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "匹配域名关键字",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用域名正则表达式匹配",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配域名后缀",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "通配符匹配，仅支持*和?通配符",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "匹配DSCP标记（仅限 tproxy udp 入站）",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage("匹配请求目标端口范围"),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage("匹配 IP 所属国家代码"),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 Geosite 内的域名",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage("匹配入站名称"),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage("匹配入站端口"),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage("匹配入站类型"),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "匹配入站用户名，支持使用 / 分隔多个用户名",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage("匹配 IP 所属 ASN"),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "匹配 IP 地址范围，IP-CIDR6 只是一个别名",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage("匹配 IP 地址范围"),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 IP 后缀范围",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage("匹配所有请求，无需条件"),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage("匹配TCP或者UDP"),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage("逻辑规则 NOT"),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("逻辑规则 OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "使用进程匹配，在Android平台可以匹配包名",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用进程名称正则表达式匹配，在Android平台可以匹配包名",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "使用进程名称通配符匹配，仅支持*和?通配符",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "使用完整进程路径匹配",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用进程路径正则表达式匹配",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "使用进程路径通配符匹配，仅支持*和?通配符",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "匹配重匹配名称，多个名称用/分隔",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "引用规则集合，需配置rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "匹配来源 IP 所属国家代码",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "匹配来源 IP 所属 ASN",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "匹配来源 IP 地址范围",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配来源 IP 后缀范围",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage("匹配请求来源端口范围"),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "匹配至子规则，需要注意括号的使用",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 Linux USER ID",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("规则名称"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BT 下载直连",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "屏蔽 DNS over TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("屏蔽 QUIC"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("屏蔽 STUN"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage("局域网直连"),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple 与 Microsoft 直连",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("规则集"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("规则集"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("规则目标"),
    "rules": MessageLookupByLibrary.simpleMessage("规则"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("启动时间"),
    "safeMode": MessageLookupByLibrary.simpleMessage("安全模式"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("是否保存更改？"),
    "script": MessageLookupByLibrary.simpleMessage("脚本"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage("滚动到已选"),
    "search": MessageLookupByLibrary.simpleMessage("搜索"),
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("全选"),
    "selected": MessageLookupByLibrary.simpleMessage("已选择"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("服务器"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("可用"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("已被封禁"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("检测"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("全部检测"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("即将上线"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage("不允许的 ISP"),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("检测失败"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("管理服务"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage("仅限自制内容"),
    "servicePending": MessageLookupByLibrary.simpleMessage("待检测"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage("访问受限"),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("服务状态"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("不可用"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage("地区不支持"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "show": MessageLookupByLibrary.simpleMessage("显示"),
    "showLess": MessageLookupByLibrary.simpleMessage("收起"),
    "showMore": MessageLookupByLibrary.simpleMessage("展开"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "通知栏显示停止按钮",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("紧凑"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("侧边栏背景模糊"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("启动时最小化"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("单条添加"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("尺寸"),
    "slide": MessageLookupByLibrary.simpleMessage("滑动"),
    "socksPort": MessageLookupByLibrary.simpleMessage("Socks端口"),
    "sort": MessageLookupByLibrary.simpleMessage("排序"),
    "source": MessageLookupByLibrary.simpleMessage("来源"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("源IP"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("特殊代理"),
    "specialRules": MessageLookupByLibrary.simpleMessage("特殊规则"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("网速统计"),
    "standard": MessageLookupByLibrary.simpleMessage("标准"),
    "start": MessageLookupByLibrary.simpleMessage("启动"),
    "startVpn": MessageLookupByLibrary.simpleMessage("正在启动VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("状态"),
    "stop": MessageLookupByLibrary.simpleMessage("暂停"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("正在停止VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("策略"),
    "style": MessageLookupByLibrary.simpleMessage("风格"),
    "subRule": MessageLookupByLibrary.simpleMessage("子规则"),
    "submit": MessageLookupByLibrary.simpleMessage("提交"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage("订阅信息"),
    "suspended": MessageLookupByLibrary.simpleMessage("挂起中…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("切换配置"),
    "sync": MessageLookupByLibrary.simpleMessage("同步"),
    "system": MessageLookupByLibrary.simpleMessage("系统"),
    "systemApp": MessageLookupByLibrary.simpleMessage("系统应用"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("系统代理"),
    "tab": MessageLookupByLibrary.simpleMessage("标签页"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("选项卡动画"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP并发"),
    "testUrl": MessageLookupByLibrary.simpleMessage("测速链接"),
    "textScale": MessageLookupByLibrary.simpleMessage("文本缩放"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "themeColor": MessageLookupByLibrary.simpleMessage("主题色彩"),
    "themeMode": MessageLookupByLibrary.simpleMessage("主题模式"),
    "tight": MessageLookupByLibrary.simpleMessage("紧凑"),
    "time": MessageLookupByLibrary.simpleMessage("时间"),
    "timeout": MessageLookupByLibrary.simpleMessage("超时"),
    "tip": MessageLookupByLibrary.simpleMessage("提示"),
    "toggle": MessageLookupByLibrary.simpleMessage("切换"),
    "tolerance": MessageLookupByLibrary.simpleMessage("容差"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("调性点缀"),
    "tools": MessageLookupByLibrary.simpleMessage("工具"),
    "torch": MessageLookupByLibrary.simpleMessage("手电筒"),
    "total": MessageLookupByLibrary.simpleMessage("总计"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("总流量"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("Tproxy端口"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("流量统计"),
    "tun": MessageLookupByLibrary.simpleMessage("虚拟网卡"),
    "tunDesc": MessageLookupByLibrary.simpleMessage("仅在管理员模式生效"),
    "turnOff": MessageLookupByLibrary.simpleMessage("关闭"),
    "turnOn": MessageLookupByLibrary.simpleMessage("开启"),
    "undo": MessageLookupByLibrary.simpleMessage("撤销"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("统一延迟"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage("未知网络错误"),
    "unmaximize": MessageLookupByLibrary.simpleMessage("向下还原"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("取消置顶"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "upload": MessageLookupByLibrary.simpleMessage("上传"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("通过URL获取配置文件"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("使用Hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage("使用系统Hosts"),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("已用流量"),
    "userAgent": MessageLookupByLibrary.simpleMessage("用户代理"),
    "value": MessageLookupByLibrary.simpleMessage("值"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("活力"),
    "view": MessageLookupByLibrary.simpleMessage("查看"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "检测到VPN相关配置改动",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage("重启VPN后改变生效"),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("白名单模式"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("写入系统"),
    "yearsAgo": m45,
  };
}
