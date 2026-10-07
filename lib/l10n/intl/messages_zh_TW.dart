// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(count, skipped) => "將新增 ${count} 項，跳過 ${skipped} 項已存在";

  static String m1(code) =>
      "Windows 阻止了 FastAICore.exe（錯誤 ${code}）。請安裝官方簽名版本，或聯絡管理員檢查應用控制策略。";

  static String m2(name) => "FastAI 連續兩次未能完成啟動，已暫停配置 ${name} 以避免重複崩潰。請在首頁重新連線。";

  static String m3(url) => "是否要透過 ${url} 建立配置？";

  static String m4(count) => "${count} 天前";

  static String m5(label) => "確定刪除選中的${label}嗎？";

  static String m6(label) => "確定刪除當前${label}嗎？";

  static String m7(label) => "${label}詳情";

  static String m8(label) => "${label}不能為空";

  static String m9(label) => "${label}當前已存在";

  static String m10(name) => "${name} 已是最新版本";

  static String m11(name) => "${name} 已更新";

  static String m12(count) => "${count} 小時前";

  static String m13(count) => "${count} 小時";

  static String m14(target) => "${target} 是一個無效的策略";

  static String m15(ruleSet) => "${ruleSet} 不是有效的規則集";

  static String m16(subRule) => "${subRule} 是一個無效的SUB_RULE";

  static String m17(line, message) => "第 ${line} 行：${message}";

  static String m18(label, max) => "${label}最多${max}個字元";

  static String m19(size) => "已釋放 ${size}";

  static String m20(count) => "${count} 分鐘前";

  static String m21(count) => "${count} 個月前";

  static String m22(code) => "伺服器拒絕訪問（HTTP ${code}），連結可能已過期或憑據有誤";

  static String m23(code) => "伺服器拒絕了請求（HTTP ${code}）";

  static String m24(code) => "該地址下沒有內容（HTTP ${code}），請確認連結是否正確";

  static String m25(detail) => "網路請求失敗：${detail}";

  static String m26(code) => "伺服器出現問題（HTTP ${code}），請稍後再試";

  static String m27(label) => "暫無${label}";

  static String m28(message) => "核心無法解析該代理：${message}";

  static String m29(name) => "名稱 ${name} 已被其他代理或策略組使用";

  static String m30(path) => "策略組之間存在迴圈引用：${path}";

  static String m31(names) => "以下代理集不存在：${names}";

  static String m32(names) => "以下代理或策略不存在：${names}";

  static String m33(name) => "${name} 是內建策略名，不能在此使用";

  static String m34(names) => "配置檔案自身的策略組引用了自定義代理中已沒有的代理：${names}";

  static String m35(label, profiles) =>
      "${label} 仍被 ${profiles} 的自定義策略組或規則使用，請先在那裡移除";

  static String m36(profiles, label) =>
      "${profiles} 的訂閱裡已有 ${label}，改名後這些配置會改用訂閱裡的那個，請換一個名稱";

  static String m37(count) => "${count} 個代理";

  static String m38(count) => "${count} 條規則";

  static String m39(appName) => "${appName}（安全模式）";

  static String m40(count) => "${count} 秒";

  static String m41(count) => "已選擇 ${count} 項";

  static String m42(time) => "檢測於 ${time}";

  static String m43(label) => "${label}只能是一項";

  static String m44(label) => "${label}必須為URL";

  static String m45(count) => "${count} 年前";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("關於"),
    "accessControl": MessageLookupByLibrary.simpleMessage("哪些應用使用代理"),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "只允許選中應用進入VPN",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "選擇加入或排除 VPN 的應用",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "應用訪問控制已關閉",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "選中應用將會被排除在VPN之外",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage("訪問控制設定"),
    "account": MessageLookupByLibrary.simpleMessage("帳號"),
    "action": MessageLookupByLibrary.simpleMessage("操作"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("測試全部延遲"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("直連模式"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("全域性模式"),
    "actionMode": MessageLookupByLibrary.simpleMessage("切換模式"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("系統代理"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("規則模式"),
    "actionStart": MessageLookupByLibrary.simpleMessage("啟動/停止"),
    "actionTun": MessageLookupByLibrary.simpleMessage("虛擬網絡卡"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage("更新全部配置"),
    "actionView": MessageLookupByLibrary.simpleMessage("顯示/隱藏"),
    "add": MessageLookupByLibrary.simpleMessage("新增"),
    "addProfile": MessageLookupByLibrary.simpleMessage("新增配置"),
    "addRule": MessageLookupByLibrary.simpleMessage("新增規則"),
    "addedRules": MessageLookupByLibrary.simpleMessage("附加規則"),
    "address": MessageLookupByLibrary.simpleMessage("地址"),
    "agree": MessageLookupByLibrary.simpleMessage("同意"),
    "allowBypass": MessageLookupByLibrary.simpleMessage("允許應用繞過VPN"),
    "allowLan": MessageLookupByLibrary.simpleMessage("區域網代理"),
    "answers": MessageLookupByLibrary.simpleMessage("應答"),
    "app": MessageLookupByLibrary.simpleMessage("應用"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage("應用訪問控制"),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage("追加系統DNS"),
    "authentication": MessageLookupByLibrary.simpleMessage("認證"),
    "authorize": MessageLookupByLibrary.simpleMessage("授權"),
    "authorized": MessageLookupByLibrary.simpleMessage("已授權"),
    "auto": MessageLookupByLibrary.simpleMessage("自動"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage("自動檢查更新"),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("自啟動"),
    "autoRun": MessageLookupByLibrary.simpleMessage("啟動後自動連線"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage("自動設定系統DNS"),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("自動更新"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage("自動更新間隔（分鐘）"),
    "back": MessageLookupByLibrary.simpleMessage("返回"),
    "backup": MessageLookupByLibrary.simpleMessage("備份"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "該備份來自更高版本的應用，請先更新應用再恢復",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("基礎資訊"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("批次新增"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage("每行一項，也可用逗號分隔"),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage("每行一條，鍵和值之間用空格分隔"),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("行為"),
    "bind": MessageLookupByLibrary.simpleMessage("繫結"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("黑名單模式"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("阻止連線"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("排除域名"),
    "cache": MessageLookupByLibrary.simpleMessage("快取"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("快取演算法"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage("快取已損壞，是否清空？"),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("快取大小"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "請在系統設定中允許訪問相機以掃描二維碼，或從相簿選擇二維碼圖片。",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage("需要相機許可權"),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage("相機不可用"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("取消全選"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "切換代理失敗，已恢復上一次的選擇",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage("重大變更"),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("新功能"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("問題修復"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("效能最佳化"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("已回滾"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage("校驗 TLS 證書"),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("檢查更新"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage("當前應用已經是最新版了"),
    "clearSearch": MessageLookupByLibrary.simpleMessage("清除搜尋"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage("匯出剪貼簿"),
    "clipboardImport": MessageLookupByLibrary.simpleMessage("剪貼簿匯入"),
    "close": MessageLookupByLibrary.simpleMessage("關閉"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("關閉連線"),
    "color": MessageLookupByLibrary.simpleMessage("顏色"),
    "columns": MessageLookupByLibrary.simpleMessage("列數"),
    "compatible": MessageLookupByLibrary.simpleMessage("相容模式"),
    "confirm": MessageLookupByLibrary.simpleMessage("確定"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage("確定要退出當前視窗嗎？"),
    "connected": MessageLookupByLibrary.simpleMessage("已連線"),
    "connecting": MessageLookupByLibrary.simpleMessage("連線中…"),
    "connection": MessageLookupByLibrary.simpleMessage("連線"),
    "connections": MessageLookupByLibrary.simpleMessage("連線"),
    "connectivity": MessageLookupByLibrary.simpleMessage("連通性："),
    "content": MessageLookupByLibrary.simpleMessage("內容"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("內容主題"),
    "copy": MessageLookupByLibrary.simpleMessage("複製"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage("複製環境變數"),
    "copyLink": MessageLookupByLibrary.simpleMessage("複製連結"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("複製成功"),
    "core": MessageLookupByLibrary.simpleMessage("核心"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows 智慧應用控制阻止了 FastAICore.exe。請安裝官方簽名版本或聯絡支援，並保持 Windows 安全防護開啟。",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("核心狀態"),
    "country": MessageLookupByLibrary.simpleMessage("區域"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("檢測到崩潰"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("崩潰分析"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "開啟後，應用崩潰時自動上傳不包含敏感資訊的崩潰日誌",
    ),
    "create": MessageLookupByLibrary.simpleMessage("建立"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("建立時間"),
    "custom": MessageLookupByLibrary.simpleMessage("自定義"),
    "cut": MessageLookupByLibrary.simpleMessage("剪下"),
    "dark": MessageLookupByLibrary.simpleMessage("深色"),
    "dashboard": MessageLookupByLibrary.simpleMessage("儀表盤"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage("檢測到資料有更改，是否儲存"),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "本應用使用 Firebase Crashlytics 收集崩潰資訊以改進應用穩定性。\n收集的資料包括裝置資訊和崩潰詳情，不包含個人敏感資料。\n您可以在設定中關閉此功能。",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage("資料收集說明"),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "儲存更改失敗，已回滾",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("預設"),
    "delay": MessageLookupByLibrary.simpleMessage("延遲"),
    "delayTest": MessageLookupByLibrary.simpleMessage("延遲測試"),
    "delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "基於ClashMeta的多平臺代理客戶端，簡單易用，開源無廣告。",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("目標地址"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("目標地理定位"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("目標IP ASN"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage("依賴第三方api，僅供參考"),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("撥號代理"),
    "direct": MessageLookupByLibrary.simpleMessage("直連"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("禁用UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("已關閉"),
    "disconnected": MessageLookupByLibrary.simpleMessage("已斷開"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage("發現新版本"),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("DNS劫持"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("DNS模式"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNS查詢"),
    "docked": MessageLookupByLibrary.simpleMessage("固定"),
    "domain": MessageLookupByLibrary.simpleMessage("域名"),
    "download": MessageLookupByLibrary.simpleMessage("下載"),
    "edit": MessageLookupByLibrary.simpleMessage("編輯"),
    "editRule": MessageLookupByLibrary.simpleMessage("編輯規則"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("已開啟"),
    "entries": MessageLookupByLibrary.simpleMessage("個條目"),
    "error": MessageLookupByLibrary.simpleMessage("錯誤"),
    "exclude": MessageLookupByLibrary.simpleMessage("從最近任務中隱藏"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage("應用在後臺時，從最近任務中隱藏應用"),
    "excludeType": MessageLookupByLibrary.simpleMessage("排除型別"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("退出"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("退出全屏"),
    "expand": MessageLookupByLibrary.simpleMessage("標準"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("預期狀態"),
    "expireTime": MessageLookupByLibrary.simpleMessage("到期時間"),
    "exportFile": MessageLookupByLibrary.simpleMessage("匯出檔案"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("匯出日誌"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("匯出成功"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("表現力"),
    "externalController": MessageLookupByLibrary.simpleMessage("外部控制器"),
    "externalLink": MessageLookupByLibrary.simpleMessage("外部連結"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("超大"),
    "fade": MessageLookupByLibrary.simpleMessage("淡入"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("Fallback過濾"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "賬號資訊暫未重新整理，連線時將重新檢查賬號狀態。",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "在後臺檢查新版本，下載和安裝需要手動確認。",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("自動選擇"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage("後臺與通知"),
    "fdBanned": MessageLookupByLibrary.simpleMessage("賬戶已停用"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "無法驗證伺服器證書，請檢查系統時間或聯絡支援。",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage("系統網路連線"),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("TCP 連通性"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("安全連線"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("選擇線路"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("客戶端配置"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI 暫時不可用，請前往官網聯絡支援。",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "兩條路徑均未透過。可能是共有網路問題，也可能是目標地址受限，請結合分層結果判斷。",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "本次兩條路徑均訪問到檢測地址。",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("連線對比"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "系統路徑透過，所選線路失敗。建議先排查線路，尚不能確認根因。",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "所選線路透過，系統路徑失敗。建議檢查系統 DNS、路由及本地網路限制。",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("連線"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("已連線"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("連線"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "連線失敗，請重試或切換線路。",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("複製技術報告"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage("獨立流量剩餘"),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "獨立流量與週期流量分別計量，不隨週期重置清除；可用線路和有效期以賬號權益為準。",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("當前線路"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "檢查期間連線設定發生變化，請重新檢查。",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "核心或線路列表未就緒，請重新整理線路後重新連線。",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "尚未連線，請連線後檢查代理線路。",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("系統 DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "域名解析失敗或超時，請檢查網路或切換網路後重試。",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage("公共檢測域名解析成功。"),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage("查詢連線問題並按指引恢復"),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Windows 代理或 PAC 與當前模式不一致，請檢查其他 VPN/代理軟體及系統代理設定，再重新連線。",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "本地代理埠未響應，請斷開後重新連線，再次檢查。",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "本地埠可達；此項不驗證遠端線路。",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Windows 手動代理和 PAC 設定與當前模式一致。",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("重新檢查"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("當前線路"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "當前線路未能訪問檢測地址，請切換線路；全部失敗時檢查 DNS 和本地網路。",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "當前所選線路已訪問 HTTPS 檢測地址；不代表所有服務均可訪問。",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage("正在檢查網路連線…"),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "安全模式下跳過：不啟用代理核心和系統設定。",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "核心、線路和連線許可權已就緒；此項不代表所有系統設定均無衝突。",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "當前連線狀態或裝置無需執行此項檢查。",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "TUN 許可權未就緒，請重新連線並完成授權，或切換系統代理。",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "此項暫未完成驗證，請重試或按下方指引排查。",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "公共檢測端點未透過檢查，不能僅憑此結果判斷整個網際網路不可用。",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "公共檢測端點返回了預期響應。",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("斷開連線"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("未連線"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("正在斷開…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("郵箱"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage("流量已用盡，請續費或購買流量包。"),
    "fdExpired": MessageLookupByLibrary.simpleMessage("套餐已到期"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("週期到期時間"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("全域性模式"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage("檢查完成，部分專案尚未驗證"),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage("有檢測項需要處理"),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage("已執行的檢查均透過"),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "請檢視下方結果，修復操作僅在你點選後執行。",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage("選擇線路，一鍵連線。"),
    "fdHome": MessageLookupByLibrary.simpleMessage("首頁"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "伺服器返回的配置異常，請重新同步或聯絡支援。",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage("郵箱或密碼錯誤"),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage("當前已是最新版本"),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("本地代理"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · 連線後可供其他軟體使用。",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("登入"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("退出登入"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("網路連通性"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage("網路診斷"),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage("無法連線服務，請檢查網路後重試。"),
    "fdNextReset": MessageLookupByLibrary.simpleMessage("下次自動重置（本地時間）"),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("無週期到期時間"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage("購買套餐後即可開始使用"),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "暫無可用線路，請前往官網檢查賬號權益。",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage("官方網站"),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("週期流量已用"),
    "fdPlan": MessageLookupByLibrary.simpleMessage("方案"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage("網際網路連通性"),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage("操作過於頻繁，請稍後重試。"),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "與所選線路使用同一 HTTPS 檢測地址，不顯式指定應用代理。TUN 或系統路由仍可能影響此路徑，不保證繞過 VPN。",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("問題編號"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("重新整理"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage("前往官網註冊或找回密碼"),
    "fdRemaining": MessageLookupByLibrary.simpleMessage("週期剩餘流量"),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage("重新獲取配置並連線"),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "操作未能完成。請檢視下方最新結果，必要時登入並檢查賬號使用許可權。",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "操作可能短暫中斷連線或更換所選線路，完成後會自動複測。線路恢復最多檢測 5 條其他線路。",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("重新連線"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage("檢測並切換可用線路"),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "操作已執行，但尚未確認恢復，請按下方結果繼續排查。",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "代理線路已透過複測，請繼續檢視下方剩餘提示。",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage("正在處理並重新驗證連線…"),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("複製報告"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("判斷依據"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "兩個檢測域名均需在 8 秒內返回至少一個地址。此項檢查系統解析器，不檢測 DNS 洩漏，也不驗證具體上游 DNS 伺服器。",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. 檢查 Wi-Fi/網線，並完成公共網路登入認證。\n2. 切換網路後重新檢查，判斷是否為當前網路的 DNS 問題。\n3. 仍然失敗時，將報告交給客服或網路管理員。",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("異常"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage("未採集到實測引數。"),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "此項無需修復。結果僅代表本次檢測，不保證所有服務均可訪問。",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage("技術引數（ms 為毫秒）"),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("透過"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "8 秒內成功連線配置的本機迴環 TCP 埠。此項不確認監聽程序身份，也不驗證遠端線路。",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. 在 FastAI 中斷開後重新連線。\n2. 仍失敗時重啟 FastAI 後再檢查。\n3. 將報告交給支援；埠連線失敗本身不能證明埠被其他軟體佔用。",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "複製報告包含檢測地址和 DNS 解析結果，不包含賬號、令牌、訂閱內容或 PAC 地址。",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "核對 Windows 當前使用者的手動 HTTP/HTTPS 代理與所選模式，啟用 PAC 時提示潛在衝突。不檢查防火牆、WinHTTP 和組織策略。",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. 開啟 Windows 設定 → 網路和 Internet → 代理。\n2. 退出其他代理/VPN 軟體，核對自己配置的手動代理或 PAC；不要擅自移除組織管理的設定。\n3. 重新連線 FastAI 後複查。",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("修復與後續操作"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "當前線路須在 8 秒內返回 HTTP 204，且沒有代理錯誤。",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. 切換其他線路後重試。\n2. 所有線路都失敗時，結合 DNS 和本地代理結果排查。\n3. 若僅檢測地址失敗，請驗證實際需要的服務，並將報告交給支援。",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "請使用正常模式客戶端並連線後重新檢查。移動端不執行桌面代理埠檢查。",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. 確認已登入且賬號具備連線許可權。\n2. 重新整理線路後重新連線。\n3. TUN 授權異常時完成許可權授權，或切換為系統代理。",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("未執行"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("檢查開始時間"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("未驗證"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "保持證書驗證開啟。公共檢測端點須在 8 秒內返回 HTTP 204，不跟隨重定向。",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. 檢查系統日期和時間。\n2. 完成 Wi-Fi 聯網認證，或嘗試其他網路。\n3. 對照另一檢測端點和代理路徑結果，不要關閉證書驗證。",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage("操作失敗，請重試。"),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage("請求超時，請檢查網路後重試。"),
    "fdRequired": MessageLookupByLibrary.simpleMessage("請填寫此項"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "確認消耗一次可用重置次數，清零當前週期已用流量？獨立流量、套餐及到期時間保持不變。",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage("可用流量重置次數"),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage("當前沒有需要重置的週期已用流量。"),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "消耗一次可用重置次數，清零週期已用流量；獨立流量和套餐到期時間不變。",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage("需要有效的週期流量套餐才能重置。"),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage("暫無可用流量重置次數。"),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "週期流量已重置，賬號資訊已重新整理。",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage("重置週期流量"),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "暫時無法獲取重置權益，請重新整理賬號資訊後重試。",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage("確認重置結果"),
    "fdRouteChecking": MessageLookupByLibrary.simpleMessage("檢測中…"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("檢測失敗"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("上次檢測"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("低延遲"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("延遲較高"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("未檢測"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage("登入已失效，請重新登入。"),
    "fdShop": MessageLookupByLibrary.simpleMessage("套餐"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("智慧模式"),
    "fdSync": MessageLookupByLibrary.simpleMessage("重新整理線路"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage("線路重新整理失敗，請重試後再連線。"),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage("正在同步線路…"),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "在 8 秒內連線公共檢測伺服器，總耗時包含域名解析。",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "TCP 連線失敗，請結合 DNS、網路接入及過濾規則排查，不能僅憑此項斷定防火牆故障。",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage("檢測伺服器的 TCP 連線正常。"),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. 先檢視 DNS 檢測結果。\n2. 切換網路，或完成網路登入認證後重試。\n3. 與管理員核對防火牆/VPN 規則，不要直接關閉防火牆。",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "8 秒內使用系統信任庫完成 TLS；耗時包含 DNS 和 TCP，成功時記錄證書有效期。",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS 未完成，請檢查系統時間、網路攔截及證書信任，不要關閉證書校驗。",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage("TLS 握手和證書校驗透過。"),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "請更新 FastAI 後繼續連線",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("使用一次重置"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "請檢查郵箱和密碼，或前往官網完成驗證。",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("官網賬戶服務"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "續費、訂單、賬戶設定與客服請前往官網辦理。",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage("登入後連線並選擇線路"),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("高保真"),
    "file": MessageLookupByLibrary.simpleMessage("檔案"),
    "fileDesc": MessageLookupByLibrary.simpleMessage("直接上傳配置檔案"),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage("檔案有修改，是否儲存修改"),
    "filter": MessageLookupByLibrary.simpleMessage("篩選"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("查詢程序"),
    "floating": MessageLookupByLibrary.simpleMessage("懸浮"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("字型"),
    "fontSize": MessageLookupByLibrary.simpleMessage("大小"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage("您確定要強制重啟核心嗎？"),
    "format": MessageLookupByLibrary.simpleMessage("格式"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("果繽紛"),
    "general": MessageLookupByLibrary.simpleMessage("常規"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("自動更新"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage("Geo低記憶體模式"),
    "global": MessageLookupByLibrary.simpleMessage("全域性"),
    "go": MessageLookupByLibrary.simpleMessage("前往"),
    "goDownload": MessageLookupByLibrary.simpleMessage("前往下載"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Helper 服務不可用，無法啟用 TUN 模式，請重新安裝 FastAI。",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("隱藏 IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage("隱藏超時節點"),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "不顯示上次延遲測試超時的節點",
    ),
    "host": MessageLookupByLibrary.simpleMessage("主機"),
    "hours": MessageLookupByLibrary.simpleMessage("小時"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("圖片"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("圖示記錄"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("圖示樣式"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("圖示連結"),
    "import": MessageLookupByLibrary.simpleMessage("匯入"),
    "importFile": MessageLookupByLibrary.simpleMessage("透過檔案匯入"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("從URL匯入"),
    "inbound": MessageLookupByLibrary.simpleMessage("入站"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage("包含所有代理"),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("長期有效"),
    "init": MessageLookupByLibrary.simpleMessage("初始化"),
    "initiator": MessageLookupByLibrary.simpleMessage("發起方"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "讀取應用列表許可權已被拒絕，無法獲取已安裝的應用。請前往系統設定手動開啟。",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "當前系統在授權前不會提供已安裝的應用列表，授權後即可配置分應用代理。",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "需要讀取應用列表許可權",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage("智慧選擇"),
    "interfaceName": MessageLookupByLibrary.simpleMessage("網絡卡名稱"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage("出站網絡卡"),
    "internet": MessageLookupByLibrary.simpleMessage("網際網路"),
    "interval": MessageLookupByLibrary.simpleMessage("間隔"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("內網 IP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage("無效備份檔案"),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "DSCP 標記不能超過 63",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "僅支援 tcp 或 udp",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "該二維碼不包含配置檔案連結",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "請輸入數字或範圍，如 80 或 8000-9000，多個用 / 分隔",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP 地址"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("濫用記錄"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("代理"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("命中標記"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("組織"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage("型別查詢失敗"),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("優"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("等級"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("普通"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("重新查詢"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("風險"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("採用來源"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("各來源"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage("出站 IP 不一致"),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("無法判定型別"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage("限流"),
    "ipType": MessageLookupByLibrary.simpleMessage("型別"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("商業"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("機房"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("行動網路"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("住宅"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("IPv6超時（毫秒）"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("剛剛"),
    "key": MessageLookupByLibrary.simpleMessage("鍵"),
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("上次更新"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage("啟動未完成"),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "應用上次在啟動過程中意外退出。已跳過本次自動配置，你可以手動啟動重試。",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("佈局"),
    "light": MessageLookupByLibrary.simpleMessage("淺色"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("自動換行"),
    "list": MessageLookupByLibrary.simpleMessage("列表"),
    "listen": MessageLookupByLibrary.simpleMessage("監聽"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage("監聽路由標記"),
    "liveConnections": MessageLookupByLibrary.simpleMessage("實時連線"),
    "loading": MessageLookupByLibrary.simpleMessage("載入中…"),
    "local": MessageLookupByLibrary.simpleMessage("本地"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "本地網路許可權被拒絕：已改用 gvisor 棧，區域網無法訪問。",
    ),
    "log": MessageLookupByLibrary.simpleMessage("日誌"),
    "logLevel": MessageLookupByLibrary.simpleMessage("日誌等級"),
    "logs": MessageLookupByLibrary.simpleMessage("日誌"),
    "loopback": MessageLookupByLibrary.simpleMessage("UWP 迴環解鎖"),
    "loose": MessageLookupByLibrary.simpleMessage("寬鬆"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("最大失敗次數"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("最大化"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage("常駐記憶體"),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage("應用及共享"),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("堆記憶體空閒"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage("堆記憶體使用中"),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage("核心未執行"),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage("執行時開銷"),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("協程棧"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "基於程序常駐記憶體估算，可能與系統顯示的數值不同。",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "核心與應用執行在同一程序，核心部分按執行時統計估算，其餘計入應用及共享記憶體。",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("記憶體資訊"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("記憶體已釋放"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("最小"),
    "minimize": MessageLookupByLibrary.simpleMessage("最小化"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage("關閉視窗後繼續執行"),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("混合埠"),
    "mode": MessageLookupByLibrary.simpleMessage("模式"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("單色"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "name": MessageLookupByLibrary.simpleMessage("名稱"),
    "network": MessageLookupByLibrary.simpleMessage("網路"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage("請求已取消"),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "無法連線到伺服器，請檢查網路連線或代理設定",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("網路檢測"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "無法解析伺服器地址，請確認連結正確且 DNS 可用",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "請求過於頻繁（HTTP 429），請稍後再試",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("網路速度"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "請求超時，請檢查網路或代理後重試",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "安全連線失敗，伺服器證書可能無效，或連線被攔截",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("網路型別"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("中性"),
    "no": MessageLookupByLibrary.simpleMessage("否"),
    "noData": MessageLookupByLibrary.simpleMessage("暫無資料"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("不再提示"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("無網路"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("無網路應用"),
    "noResolve": MessageLookupByLibrary.simpleMessage("不解析IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage("沒有匹配的結果"),
    "none": MessageLookupByLibrary.simpleMessage("無"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage("當前代理組無法選中"),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage("新增一個配置檔案後即可開始使用"),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage("僅統計代理流量"),
    "optional": MessageLookupByLibrary.simpleMessage("可選"),
    "options": MessageLookupByLibrary.simpleMessage("選項"),
    "other": MessageLookupByLibrary.simpleMessage("其他"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("出站 IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("出站模式"),
    "override": MessageLookupByLibrary.simpleMessage("覆寫"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("覆寫DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("覆寫模式"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("覆寫NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage("名稱為空"),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "未選擇任何代理或代理集，核心會拒絕該策略組",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("自定義"),
    "palette": MessageLookupByLibrary.simpleMessage("調色盤"),
    "password": MessageLookupByLibrary.simpleMessage("密碼"),
    "paste": MessageLookupByLibrary.simpleMessage("貼上"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("從相簿選擇"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("視窗置頂"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "請上傳有效的二維碼",
    ),
    "port": MessageLookupByLibrary.simpleMessage("埠"),
    "preview": MessageLookupByLibrary.simpleMessage("預覽"),
    "process": MessageLookupByLibrary.simpleMessage("程序"),
    "profile": MessageLookupByLibrary.simpleMessage("配置"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("請輸入有效間隔時間格式"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("請輸入自動更新間隔時間"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "配置檔案已經修改，是否關閉自動更新？",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "請輸入配置名稱",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "請輸入有效配置URL",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "請輸入配置URL",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("配置"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("配置排序"),
    "project": MessageLookupByLibrary.simpleMessage("專案"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage("訂閱"),
    "providers": MessageLookupByLibrary.simpleMessage("外部資源"),
    "proxies": MessageLookupByLibrary.simpleMessage("代理"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("代理鏈"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("策略組"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("代理節點"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("代理集"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("純黑"),
    "qrcode": MessageLookupByLibrary.simpleMessage("二維碼"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage("掃描二維碼獲取配置檔案"),
    "quickAdd": MessageLookupByLibrary.simpleMessage("快捷新增"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("彩虹"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("最近請求"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Redir埠"),
    "redo": MessageLookupByLibrary.simpleMessage("重做"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("釋放記憶體"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage("釋放記憶體失敗"),
    "remote": MessageLookupByLibrary.simpleMessage("遠端"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("遠端目標"),
    "remove": MessageLookupByLibrary.simpleMessage("移除"),
    "replace": MessageLookupByLibrary.simpleMessage("替換"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("全部替換"),
    "request": MessageLookupByLibrary.simpleMessage("請求"),
    "requests": MessageLookupByLibrary.simpleMessage("請求"),
    "reset": MessageLookupByLibrary.simpleMessage("重置"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "當前頁面存在更改，確定重置嗎？",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("資源"),
    "respectRules": MessageLookupByLibrary.simpleMessage("遵守規則"),
    "restart": MessageLookupByLibrary.simpleMessage("重啟"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage("您確定要重啟核心嗎？"),
    "restore": MessageLookupByLibrary.simpleMessage("恢復"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("恢復策略"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage("相容"),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("覆蓋"),
    "retry": MessageLookupByLibrary.simpleMessage("重試"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("路由地址"),
    "routeMode": MessageLookupByLibrary.simpleMessage("路由模式"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage("繞過私有路由地址"),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("使用配置"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("規則"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage("邏輯規則 AND"),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage("匹配完整域名"),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "匹配域名關鍵字",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用域名正規表示式匹配",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配域名字尾",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "萬用字元匹配，僅支援*和?萬用字元",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "匹配DSCP標記（僅限 tproxy udp 入站）",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage("匹配請求目標埠範圍"),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 IP 所屬國家程式碼",
    ),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 Geosite 內的域名",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage("匹配入站名稱"),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage("匹配入站埠"),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage("匹配入站型別"),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "匹配入站使用者名稱，支援使用 / 分隔多個使用者名稱",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage("匹配 IP 所屬 ASN"),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "匹配 IP 地址範圍，IP-CIDR6 只是一個別名",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage("匹配 IP 地址範圍"),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 IP 字尾範圍",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage("匹配所有請求，無需條件"),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage("匹配TCP或者UDP"),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage("邏輯規則 NOT"),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("邏輯規則 OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "使用程序匹配，在Android平臺可以匹配包名",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用程序名稱正規表示式匹配，在Android平臺可以匹配包名",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "使用程序名稱萬用字元匹配，僅支援*和?萬用字元",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "使用完整程序路徑匹配",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "使用程序路徑正規表示式匹配",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "使用程序路徑萬用字元匹配，僅支援*和?萬用字元",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "匹配重匹配名稱，多個名稱用/分隔",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "引用規則集合，需配置rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "匹配來源 IP 所屬國家程式碼",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "匹配來源 IP 所屬 ASN",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "匹配來源 IP 地址範圍",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "匹配來源 IP 字尾範圍",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage("匹配請求來源埠範圍"),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "匹配至子規則，需要注意括號的使用",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "匹配 Linux USER ID",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("規則名稱"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BT 下載直連",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "遮蔽 DNS over TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("遮蔽 QUIC"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("遮蔽 STUN"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage("區域網直連"),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple 與 Microsoft 直連",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("規則集"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("規則集"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("規則目標"),
    "rules": MessageLookupByLibrary.simpleMessage("規則"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("啟動時間"),
    "safeMode": MessageLookupByLibrary.simpleMessage("安全模式"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("儲存"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("是否儲存更改？"),
    "script": MessageLookupByLibrary.simpleMessage("指令碼"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage("滾動到已選"),
    "search": MessageLookupByLibrary.simpleMessage("搜尋"),
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("全選"),
    "selected": MessageLookupByLibrary.simpleMessage("已選擇"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("伺服器"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("可用"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("已被封禁"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("檢測"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("全部檢測"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("即將上線"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage("不允許的 ISP"),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("檢測失敗"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("管理服務"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage("僅限自制內容"),
    "servicePending": MessageLookupByLibrary.simpleMessage("待檢測"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage("訪問受限"),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("服務狀態"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("不可用"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage("地區不支援"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "show": MessageLookupByLibrary.simpleMessage("顯示"),
    "showLess": MessageLookupByLibrary.simpleMessage("收起"),
    "showMore": MessageLookupByLibrary.simpleMessage("展開"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "通知欄顯示停止按鈕",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("緊湊"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("側邊欄背景模糊"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("啟動時最小化"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("單條新增"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("尺寸"),
    "slide": MessageLookupByLibrary.simpleMessage("滑動"),
    "socksPort": MessageLookupByLibrary.simpleMessage("Socks埠"),
    "sort": MessageLookupByLibrary.simpleMessage("排序"),
    "source": MessageLookupByLibrary.simpleMessage("來源"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("源IP"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("特殊代理"),
    "specialRules": MessageLookupByLibrary.simpleMessage("特殊規則"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("網速統計"),
    "standard": MessageLookupByLibrary.simpleMessage("標準"),
    "start": MessageLookupByLibrary.simpleMessage("啟動"),
    "startVpn": MessageLookupByLibrary.simpleMessage("正在啟動VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("狀態"),
    "stop": MessageLookupByLibrary.simpleMessage("暫停"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("正在停止VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("策略"),
    "style": MessageLookupByLibrary.simpleMessage("風格"),
    "subRule": MessageLookupByLibrary.simpleMessage("子規則"),
    "submit": MessageLookupByLibrary.simpleMessage("提交"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage("訂閱資訊"),
    "suspended": MessageLookupByLibrary.simpleMessage("掛起中…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("切換配置"),
    "sync": MessageLookupByLibrary.simpleMessage("同步"),
    "system": MessageLookupByLibrary.simpleMessage("系統"),
    "systemApp": MessageLookupByLibrary.simpleMessage("系統應用"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("系統代理"),
    "tab": MessageLookupByLibrary.simpleMessage("標籤頁"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("選項卡動畫"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP併發"),
    "testUrl": MessageLookupByLibrary.simpleMessage("測速連結"),
    "textScale": MessageLookupByLibrary.simpleMessage("文字縮放"),
    "theme": MessageLookupByLibrary.simpleMessage("主題"),
    "themeColor": MessageLookupByLibrary.simpleMessage("主題色彩"),
    "themeMode": MessageLookupByLibrary.simpleMessage("主題模式"),
    "tight": MessageLookupByLibrary.simpleMessage("緊湊"),
    "time": MessageLookupByLibrary.simpleMessage("時間"),
    "timeout": MessageLookupByLibrary.simpleMessage("超時"),
    "tip": MessageLookupByLibrary.simpleMessage("提示"),
    "toggle": MessageLookupByLibrary.simpleMessage("切換"),
    "tolerance": MessageLookupByLibrary.simpleMessage("容差"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("調性點綴"),
    "tools": MessageLookupByLibrary.simpleMessage("工具"),
    "torch": MessageLookupByLibrary.simpleMessage("手電筒"),
    "total": MessageLookupByLibrary.simpleMessage("總計"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("總流量"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("Tproxy埠"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("流量統計"),
    "tun": MessageLookupByLibrary.simpleMessage("虛擬網絡卡"),
    "tunDesc": MessageLookupByLibrary.simpleMessage("僅在管理員模式生效"),
    "turnOff": MessageLookupByLibrary.simpleMessage("關閉"),
    "turnOn": MessageLookupByLibrary.simpleMessage("開啟"),
    "undo": MessageLookupByLibrary.simpleMessage("撤銷"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("統一延遲"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage("未知網路錯誤"),
    "unmaximize": MessageLookupByLibrary.simpleMessage("向下還原"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("取消置頂"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "upload": MessageLookupByLibrary.simpleMessage("上傳"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("透過URL獲取配置檔案"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("使用Hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage("使用系統Hosts"),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("已用流量"),
    "userAgent": MessageLookupByLibrary.simpleMessage("使用者代理"),
    "value": MessageLookupByLibrary.simpleMessage("值"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("活力"),
    "view": MessageLookupByLibrary.simpleMessage("檢視"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "檢測到VPN相關配置改動",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage("重啟VPN後改變生效"),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("白名單模式"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("寫入系統"),
    "yearsAgo": m45,
  };
}
