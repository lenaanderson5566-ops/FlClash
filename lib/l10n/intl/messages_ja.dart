// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(count, skipped) => "${count}件を追加、${skipped}件は既存のためスキップ";

  static String m1(code) =>
      "Windows が FastAICore.exe をブロックしました（エラー ${code}）。公式の署名済みバージョンをインストールするか、管理者にアプリ制御ポリシーの確認を依頼してください。";

  static String m2(name) =>
      "FastAI の起動が2回続けて完了しなかったため、設定 ${name} を一時停止しました。ホームから再接続してください。";

  static String m3(url) => "${url} からプロファイルを作成しますか？";

  static String m4(count) => "${count} 日前";

  static String m5(label) => "選択した${label}を削除してもよろしいですか？";

  static String m6(label) => "この${label}を削除してもよろしいですか？";

  static String m7(label) => "${label}の詳細";

  static String m8(label) => "${label}は空にできません";

  static String m9(label) => "${label}はすでに存在します";

  static String m10(name) => "${name} はすでに最新です";

  static String m11(name) => "${name} を更新しました";

  static String m12(count) => "${count} 時間前";

  static String m13(count) => "${count} 時間";

  static String m14(target) => "${target} は無効なポリシーです";

  static String m15(ruleSet) => "${ruleSet} は無効なルールセットです";

  static String m16(subRule) => "${subRule} は無効な SUB_RULE です";

  static String m17(line, message) => "${line}行目：${message}";

  static String m18(label, max) => "${label}は最大${max}文字です";

  static String m19(size) => "${size} を解放しました";

  static String m20(count) => "${count} 分前";

  static String m21(count) => "${count} か月前";

  static String m22(code) =>
      "サーバーがアクセスを拒否しました（HTTP ${code}）。リンクの期限切れか、認証情報が誤っている可能性があります";

  static String m23(code) => "サーバーがリクエストを拒否しました（HTTP ${code}）";

  static String m24(code) =>
      "このアドレスには何も見つかりませんでした（HTTP ${code}）。URL が正しいか確認してください";

  static String m25(detail) => "ネットワークリクエストに失敗しました：${detail}";

  static String m26(code) => "サーバーで問題が発生しました（HTTP ${code}）。しばらくしてから再試行してください";

  static String m27(label) => "${label}はまだありません";

  static String m28(message) => "コアがこのプロキシを解析できません：${message}";

  static String m29(name) => "名前 ${name} は他のプロキシまたはプロキシグループで使用されています";

  static String m30(path) => "プロキシグループが循環参照しています：${path}";

  static String m31(names) => "次のプロキシプロバイダーは存在しません：${names}";

  static String m32(names) => "次のプロキシまたはポリシーは存在しません：${names}";

  static String m33(name) => "${name} は組み込みポリシー名のため使用できません";

  static String m34(names) =>
      "プロファイル自身のプロキシグループが、カスタムプロキシに含まれないプロキシを参照しています：${names}";

  static String m35(label, profiles) =>
      "${label} は ${profiles} のカスタムプロキシグループまたはルールでまだ使用されています。先にそこから外してください";

  static String m36(profiles, label) =>
      "${profiles} のサブスクリプションには既に ${label} があるため、名前を変えるとそちらが使われます。別の名前にしてください";

  static String m37(count) => "プロキシ ${count} 件";

  static String m38(count) => "ルール ${count} 件";

  static String m39(appName) => "${appName}（セーフモード）";

  static String m40(count) => "${count} 秒";

  static String m41(count) => "${count} 件選択中";

  static String m42(time) => "${time} に検査";

  static String m43(label) => "${label}は1項目のみ指定できます";

  static String m44(label) => "${label}はURLである必要があります";

  static String m45(count) => "${count} 年前";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("アプリについて"),
    "accessControl": MessageLookupByLibrary.simpleMessage("プロキシを使用するアプリ"),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "選択したアプリのみVPNを経由します",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "VPNに含めるアプリまたは除外するアプリを選択",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "アプリアクセス制御は無効です",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "選択したアプリはVPNから除外されます",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage("アクセス制御の設定"),
    "account": MessageLookupByLibrary.simpleMessage("アカウント"),
    "action": MessageLookupByLibrary.simpleMessage("アクション"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("すべての遅延をテスト"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("ダイレクトモード"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("グローバルモード"),
    "actionMode": MessageLookupByLibrary.simpleMessage("モード切替"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("システムプロキシ"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("ルールモード"),
    "actionStart": MessageLookupByLibrary.simpleMessage("開始/停止"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage("プロファイルを更新"),
    "actionView": MessageLookupByLibrary.simpleMessage("表示/非表示"),
    "add": MessageLookupByLibrary.simpleMessage("追加"),
    "addProfile": MessageLookupByLibrary.simpleMessage("プロファイルを追加"),
    "addRule": MessageLookupByLibrary.simpleMessage("ルールを追加"),
    "addedRules": MessageLookupByLibrary.simpleMessage("追加ルール"),
    "address": MessageLookupByLibrary.simpleMessage("アドレス"),
    "agree": MessageLookupByLibrary.simpleMessage("同意する"),
    "allowBypass": MessageLookupByLibrary.simpleMessage("アプリによるVPNバイパスを許可"),
    "allowLan": MessageLookupByLibrary.simpleMessage("LANプロキシ"),
    "answers": MessageLookupByLibrary.simpleMessage("応答"),
    "app": MessageLookupByLibrary.simpleMessage("アプリ"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage("アプリアクセス制御"),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage("システムDNSを追加"),
    "authentication": MessageLookupByLibrary.simpleMessage("認証"),
    "authorize": MessageLookupByLibrary.simpleMessage("許可"),
    "authorized": MessageLookupByLibrary.simpleMessage("許可済み"),
    "auto": MessageLookupByLibrary.simpleMessage("自動"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage("更新の自動チェック"),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("自動起動"),
    "autoRun": MessageLookupByLibrary.simpleMessage("起動後に自動接続"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage("システムDNSを自動設定"),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("自動更新"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage("自動更新間隔（分）"),
    "back": MessageLookupByLibrary.simpleMessage("戻る"),
    "backup": MessageLookupByLibrary.simpleMessage("バックアップ"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "このバックアップは新しいバージョンのアプリで作成されています。アプリを更新してから復元してください",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("基本情報"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("一括追加"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "1行に1項目、またはカンマ区切りで入力してください",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "1行に1件、キーと値はスペースで区切ってください",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("動作"),
    "bind": MessageLookupByLibrary.simpleMessage("連携"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("ブラックリストモード"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("接続をブロック"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("除外ドメイン"),
    "cache": MessageLookupByLibrary.simpleMessage("キャッシュ"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("キャッシュアルゴリズム"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage(
      "キャッシュが破損しています。クリアしますか？",
    ),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("キャッシュサイズ"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "QRコードをスキャンするには、システム設定でカメラへのアクセスを許可するか、アルバムからQRコード画像を選択してください。",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "カメラの権限が必要です",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage("カメラを使用できません"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("すべて選択解除"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "プロキシの切り替えに失敗したため、前回の選択に戻しました",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage("破壊的変更"),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("新機能"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("不具合修正"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("パフォーマンス"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("取り消し"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage("TLS証明書を検証"),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("更新を確認"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage("すでに最新バージョンです"),
    "clearSearch": MessageLookupByLibrary.simpleMessage("検索をクリア"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage("クリップボードへエクスポート"),
    "clipboardImport": MessageLookupByLibrary.simpleMessage("クリップボードからインポート"),
    "close": MessageLookupByLibrary.simpleMessage("閉じる"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("接続を閉じる"),
    "color": MessageLookupByLibrary.simpleMessage("カラー"),
    "columns": MessageLookupByLibrary.simpleMessage("列数"),
    "compatible": MessageLookupByLibrary.simpleMessage("互換モード"),
    "confirm": MessageLookupByLibrary.simpleMessage("OK"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage(
      "現在のウィンドウを閉じてもよろしいですか？",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("接続済み"),
    "connecting": MessageLookupByLibrary.simpleMessage("接続中…"),
    "connection": MessageLookupByLibrary.simpleMessage("接続"),
    "connections": MessageLookupByLibrary.simpleMessage("接続"),
    "connectivity": MessageLookupByLibrary.simpleMessage("接続状態："),
    "content": MessageLookupByLibrary.simpleMessage("内容"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("コンテンツ"),
    "copy": MessageLookupByLibrary.simpleMessage("コピー"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage("環境変数をコピー"),
    "copyLink": MessageLookupByLibrary.simpleMessage("リンクをコピー"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("コピーしました"),
    "core": MessageLookupByLibrary.simpleMessage("コア"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows のスマート アプリ コントロールが FastAICore.exe をブロックしました。公式の署名済みバージョンをインストールするか、サポートにお問い合わせください。Windows のセキュリティ保護は有効にしてください。",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("コアの状態"),
    "country": MessageLookupByLibrary.simpleMessage("地域"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("クラッシュを検出しました"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("クラッシュ分析"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "有効にすると、アプリのクラッシュ時に機密情報を含まないクラッシュログを自動的にアップロードします",
    ),
    "create": MessageLookupByLibrary.simpleMessage("作成"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("作成日時"),
    "custom": MessageLookupByLibrary.simpleMessage("カスタム"),
    "cut": MessageLookupByLibrary.simpleMessage("切り取り"),
    "dark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "dashboard": MessageLookupByLibrary.simpleMessage("ダッシュボード"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "データの変更を検出しました。保存しますか？",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "本アプリは、安定性向上のために Firebase Crashlytics を使用してクラッシュ情報を収集します。\n収集されるデータにはデバイス情報とクラッシュの詳細が含まれますが、個人の機密データは含まれません。\nこの機能は設定で無効にできます。",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage("データ収集について"),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "変更の保存に失敗したため、元に戻しました",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("デフォルト"),
    "delay": MessageLookupByLibrary.simpleMessage("遅延"),
    "delayTest": MessageLookupByLibrary.simpleMessage("遅延テスト"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "ClashMetaベースのマルチプラットフォーム対応プロキシクライアント。シンプルで使いやすく、オープンソースで広告もありません。",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("宛先"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("宛先GeoIP"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("宛先IP ASN"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage(
      "サードパーティAPIに依存しているため、参考値です",
    ),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("ダイヤラープロキシ"),
    "direct": MessageLookupByLibrary.simpleMessage("ダイレクト"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("UDPを無効化"),
    "disabled": MessageLookupByLibrary.simpleMessage("無効"),
    "disconnected": MessageLookupByLibrary.simpleMessage("切断済み"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage(
      "新しいバージョンが見つかりました",
    ),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("DNSハイジャック"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("DNSモード"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNSクエリ"),
    "docked": MessageLookupByLibrary.simpleMessage("固定"),
    "domain": MessageLookupByLibrary.simpleMessage("ドメイン"),
    "download": MessageLookupByLibrary.simpleMessage("ダウンロード"),
    "edit": MessageLookupByLibrary.simpleMessage("編集"),
    "editRule": MessageLookupByLibrary.simpleMessage("ルールを編集"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("有効"),
    "entries": MessageLookupByLibrary.simpleMessage(" 件"),
    "error": MessageLookupByLibrary.simpleMessage("エラー"),
    "exclude": MessageLookupByLibrary.simpleMessage("最近のタスクから隠す"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "バックグラウンド時に、最近のタスクからアプリを隠します",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("除外タイプ"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("終了"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("全画面表示を終了"),
    "expand": MessageLookupByLibrary.simpleMessage("標準"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("期待するステータス"),
    "expireTime": MessageLookupByLibrary.simpleMessage("有効期限"),
    "exportFile": MessageLookupByLibrary.simpleMessage("ファイルをエクスポート"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("ログをエクスポート"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("エクスポートが完了しました"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("エクスプレッシブ"),
    "externalController": MessageLookupByLibrary.simpleMessage("外部コントローラー"),
    "externalLink": MessageLookupByLibrary.simpleMessage("外部リンク"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("特大"),
    "fade": MessageLookupByLibrary.simpleMessage("フェード"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("フォールバックフィルター"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "アカウント情報を更新できませんでした。接続時に再確認します。",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "バックグラウンドで新しいバージョンを確認します。ダウンロードとインストールは手動で行います。",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("自動選択"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "バックグラウンドと通知",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage("アカウント停止中"),
    "fdBrowserComplete": MessageLookupByLibrary.simpleMessage(
      "認証を受け取りました。FastAI に戻ってログインを完了してください。",
    ),
    "fdBrowserExpired": MessageLookupByLibrary.simpleMessage(
      "認証の有効期限が切れました。もう一度ログインしてください。",
    ),
    "fdBrowserFailed": MessageLookupByLibrary.simpleMessage(
      "ブラウザーでのログインを完了できませんでした。再試行するかメールでログインしてください。",
    ),
    "fdBrowserLogin": MessageLookupByLibrary.simpleMessage("ブラウザーでログイン"),
    "fdBrowserWaiting": MessageLookupByLibrary.simpleMessage(
      "ブラウザーでの確認を待っています…",
    ),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "サーバー証明書を確認できません。システム時刻を確認するかサポートにお問い合わせください。",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage("システム接続"),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("TCP 接続"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("安全な接続"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("接続先を選ぶ"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("クライアント設定"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI は一時的に利用できません。公式サイトからサポートにお問い合わせください。",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "両経路とも失敗。共通のネットワーク問題または検査先の制限の可能性があります。各層の結果を確認してください。",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "今回、両方の経路で検査先に到達しました。",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("接続の比較"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "システム経路は成功し、選択中の経路は失敗。接続先から確認してください。原因は未確定です。",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "選択中の経路は成功し、システム経路は失敗。DNS、経路、回線制限を確認してください。",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("接続"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("接続済み"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("接続"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "接続できませんでした。再試行するか接続先を変更してください。",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("技術レポートをコピー"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage("独立データ残量"),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "追加データ容量は期間の容量とは別に管理され、期間リセットでは消去されません。利用範囲と有効期限はアカウントによって異なります。",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("現在の接続先"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "確認中に接続設定が変更されました。再確認してください。",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "コアまたは接続先が未準備です。接続先を更新して再接続してください。",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "未接続です。接続してから経路を確認してください。",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("システム DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "名前解決が失敗またはタイムアウトしました。ネットワークを確認するか、別の回線でお試しください。",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "公開テストドメインを正常に名前解決しました。",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage("接続の問題を調べて復旧する"),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Windows プロキシ/PAC が現在のモードと一致しません。他の VPN とシステム設定を確認して再接続してください。",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "ローカルプロキシが応答しません。切断して再接続後、再試行してください。",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "ローカルポートに接続できました。リモート経路は未検証です。",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Windows の手動プロキシと PAC 設定が現在のモードに一致しています。",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("再確認"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("現在の経路"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "検査先に接続できません。接続先を切り替え、すべて失敗する場合は DNS とネットワークを確認してください。",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "選択中の経路で HTTPS 検査先に接続できました。他のサービスは結果が異なる場合があります。",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage(
      "ネットワーク接続を確認しています…",
    ),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "セーフモードではプロキシとシステム設定の確認をスキップします。",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "コア、接続先、権限は準備済みです。すべてのシステム設定を検証するものではありません。",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "現在の接続状態や端末では、この検査は対象外です。",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "TUN 権限がありません。再接続して許可するか、システムプロキシを選択してください。",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "この項目を確認できませんでした。再試行するか、以下の案内に従ってください。",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "公開テスト先を確認できませんでした。この結果だけではインターネット全体の障害とは判断できません。",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "公開テスト先から期待した応答を受信しました。",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("切断"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("未接続"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("切断中…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("メールアドレス"),
    "fdEmailLogin": MessageLookupByLibrary.simpleMessage("またはメールでログイン"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "通信量を使い切りました。更新または追加容量を購入してください。",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("プラン期限切れ"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("期間の有効期限"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("グローバルモード"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage("確認完了・一部未検証"),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage("確認が必要な項目があります"),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage("実行した確認は正常です"),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "以下の結果を確認してください。修復は選択した場合のみ実行します。",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage("接続先を選び、ワンクリックで接続。"),
    "fdHidePassword": MessageLookupByLibrary.simpleMessage("パスワードを非表示"),
    "fdHome": MessageLookupByLibrary.simpleMessage("ホーム"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "サーバーから無効な設定が返されました。再同期するかサポートにお問い合わせください。",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "メールアドレスまたはパスワードが違います",
    ),
    "fdInvalidEmail": MessageLookupByLibrary.simpleMessage(
      "有効なメールアドレスを入力してください",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage("最新バージョンです"),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("ローカルプロキシ"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · 接続後に他のアプリで使用できます。",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("ログイン"),
    "fdLoginTitle": MessageLookupByLibrary.simpleMessage("アカウントにログイン"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("ネットワーク接続"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage("ネットワーク診断"),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "サービスに接続できません。ネットワークを確認して再試行してください。",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage("次回の自動リセット（現地時刻）"),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("期間の期限なし"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage("プランを購入して開始"),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "利用可能な経路がありません。公式サイトでアカウントを確認してください。",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage("公式サイト"),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("期間データ使用量"),
    "fdPlan": MessageLookupByLibrary.simpleMessage("プラン"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage("インターネット接続"),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "リクエストが多すぎます。しばらくお待ちください。",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "選択中の経路と同じ URL を使用し、アプリのプロキシを明示しません。TUN/OS 経路の影響は残るため VPN を迂回する保証はありません。",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("問い合わせ番号"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("更新"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage("公式サイトで登録・パスワード再設定"),
    "fdRemaining": MessageLookupByLibrary.simpleMessage("期間の残り通信量"),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage("設定を再取得して接続"),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "操作を完了できませんでした。最新の結果とアカウントの利用権限を確認してください。",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "接続が一時中断されるか、経路が変わる場合があります。完了後に再検査します。代替経路は最大 5 件を検査します。",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("再接続"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage("利用可能な経路に切り替え"),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "操作は完了しましたが、復旧は未確認です。以下の案内に従ってください。",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "プロキシ経路の再検査に成功しました。残りの警告も確認してください。",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage("修復して接続を再確認しています…"),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("レポートをコピー"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("判定基準"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "両方のドメインが8秒以内にアドレスを返すこと。システムの名前解決を確認し、DNS リークや上流 DNS サーバーは検証しません。",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Wi-Fi/有線とネットワーク認証を確認。\n2. 別の回線で再確認。\n3. 改善しない場合はレポートをサポートへ。",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("問題あり"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage("測定データがありません。"),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "この項目の修復は不要です。結果は今回の測定のみで、すべてのサービスへの接続を保証しません。",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "技術情報（ms = ミリ秒）",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("正常"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "8秒以内にローカル TCP ポートへ接続すること。待受プロセスやリモート経路は確認しません。",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. FastAI を再接続。\n2. 改善しない場合は再起動。\n3. レポートをサポートへ。ポート失敗だけでは他アプリの占有と断定できません。",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "コピーには検査先と DNS 応答が含まれますが、アカウント、トークン、サブスクリプション、PAC URL は含みません。",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "Windows ユーザーの手動プロキシを確認し、PAC 有効時は競合の可能性を示します。ファイアウォール、WinHTTP、組織ポリシーは対象外です。",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. Windows 設定 → ネットワーク → プロキシを確認。\n2. 他の VPN を終了し、自分のプロキシ/PAC 設定を確認。組織の設定は削除しないでください。\n3. FastAI を再接続して確認。",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("対処手順"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "選択した経路から 8 秒以内に HTTP 204 を受信し、プロキシエラーがないことを確認します。",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. 別の接続先で再試行。\n2. すべて失敗する場合は DNS とローカルプロキシを確認。\n3. 検査先のみ失敗する場合は必要なサービスを確認し、レポートを送付。",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "通常モードで接続後、再確認してください。モバイルではデスクトップのポート確認は行いません。",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. ログインと利用権限を確認。\n2. 接続先を更新して再接続。\n3. TUN 権限を許可するかシステムプロキシへ切り替え。",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("未実行"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("確認開始時刻"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("未検証"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "証明書を検証し、8 秒以内の HTTP 204 応答を確認します。リダイレクトには追従しません。",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. システム日時を確認します。\n2. Wi-Fi 認証を完了するか、別のネットワークを試します。\n3. 別のテスト先とプロキシ経路の結果を比較します。証明書検証を無効にしないでください。",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "操作に失敗しました。再試行してください。",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "リクエストがタイムアウトしました。ネットワークを確認して再試行してください。",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage("必須項目です"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "リセット権を1回使用して期間使用量をゼロにしますか？独立データ、プラン、契約期限は変更されません。",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage("利用可能なリセット回数"),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage("リセットする期間使用量はありません。"),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "リセット権を1回消費して期間使用量をゼロにします。独立データと契約期限は変更されません。",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "有効な期間データプランが必要です。",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "利用可能なリセット権はありません。",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "期間使用量をリセットし、アカウント情報を更新しました。",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage("期間データをリセット"),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "リセット権を取得できません。アカウント情報を更新して再試行してください。",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage("リセット結果を確認"),
    "fdRouteChecking": MessageLookupByLibrary.simpleMessage("確認中…"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("確認失敗"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("前回の測定"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("低遅延"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("遅延大"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("未確認"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "セッションが切れました。再ログインしてください。",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("プラン"),
    "fdShowPassword": MessageLookupByLibrary.simpleMessage("パスワードを表示"),
    "fdSigningIn": MessageLookupByLibrary.simpleMessage("ログイン中…"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("スマートモード"),
    "fdSync": MessageLookupByLibrary.simpleMessage("経路を更新"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "経路を更新できませんでした。再試行してから接続してください。",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage("接続先を同期中…"),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "8 秒以内に公開確認用サーバーへ接続します。所要時間には DNS 解決を含みます。",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "TCP 接続に失敗しました。DNS、回線、フィルタリングを確認してください。原因は断定できません。",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "確認用サーバーに TCP 接続できました。",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. DNS 結果を確認。\n2. 別の回線やネットワーク認証を試す。\n3. 管理者と VPN/ファイアウォール規則を確認。全体を無効にしないでください。",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "システムの信頼ストアで8秒以内に TLS を完了。DNS/TCP を含み、取得できた証明書の有効期間を記録します。",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS に失敗しました。日時、通信の介入、証明書の信頼を確認し、検証は無効にしないでください。",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "TLS ハンドシェイクと証明書検証に成功しました。",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage("接続するには更新が必要です"),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("リセットを1回使用"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "メールとパスワードを確認するか、公式サイトで認証してください。",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("公式サイトで管理"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "更新、注文、アカウント設定とサポートは公式サイトでご利用いただけます。",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage("ログインして接続先を選択"),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("フィデリティ"),
    "file": MessageLookupByLibrary.simpleMessage("ファイル"),
    "fileDesc": MessageLookupByLibrary.simpleMessage("プロファイルファイルを直接アップロードします"),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage(
      "ファイルが変更されています。変更を保存しますか？",
    ),
    "filter": MessageLookupByLibrary.simpleMessage("フィルター"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("プロセス検出"),
    "floating": MessageLookupByLibrary.simpleMessage("フローティング"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("フォント"),
    "fontSize": MessageLookupByLibrary.simpleMessage("サイズ"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "コアを強制再起動してもよろしいですか？",
    ),
    "format": MessageLookupByLibrary.simpleMessage("形式"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("フルーツサラダ"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("自動更新"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage("Geo低メモリモード"),
    "global": MessageLookupByLibrary.simpleMessage("グローバル"),
    "go": MessageLookupByLibrary.simpleMessage("開く"),
    "goDownload": MessageLookupByLibrary.simpleMessage("ダウンロードへ"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Helper サービスが利用できないため、TUN モードを有効にできません。FastAI を再インストールしてください。",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("IP を隠す"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage(
      "タイムアウトしたノードを隠す",
    ),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "前回の遅延テストがタイムアウトしたノードを表示しない",
    ),
    "host": MessageLookupByLibrary.simpleMessage("ホスト"),
    "hours": MessageLookupByLibrary.simpleMessage("時間"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("アイコン"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("アイコン履歴"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("アイコンスタイル"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("アイコンURL"),
    "import": MessageLookupByLibrary.simpleMessage("インポート"),
    "importFile": MessageLookupByLibrary.simpleMessage("ファイルからインポート"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("URLからインポート"),
    "inbound": MessageLookupByLibrary.simpleMessage("インバウンド"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage("すべてのプロキシを含める"),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("無期限"),
    "init": MessageLookupByLibrary.simpleMessage("初期化"),
    "initiator": MessageLookupByLibrary.simpleMessage("発信元"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "アプリ一覧の権限が拒否されたため、インストール済みアプリを取得できません。システム設定から手動で許可してください。",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "このシステムでは、許可するまでインストール済みアプリの一覧が提供されません。許可すると、アプリごとのプロキシを設定できます。",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "アプリ一覧の権限が必要です",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage("スマート選択"),
    "interfaceName": MessageLookupByLibrary.simpleMessage("インターフェース名"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage(
      "アウトバウンドインターフェース",
    ),
    "internet": MessageLookupByLibrary.simpleMessage("インターネット"),
    "interval": MessageLookupByLibrary.simpleMessage("間隔"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("イントラネットIP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage("無効なバックアップファイル"),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "DSCP マークは 63 を超えられません",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "tcp または udp のみ対応しています",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "このQRコードにはプロファイルのリンクが含まれていません",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "80 や 8000-9000 のような数値または範囲を / 区切りで入力してください",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP アドレス"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("不正利用の履歴"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("プロキシ"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("検出"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("組織"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage(
      "IP タイプを判定できませんでした",
    ),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("良好"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("レベル"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("普通"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("再確認"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("リスクあり"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("採用したソース"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("各ソース"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage(
      "アウトバウンド IP が不一致",
    ),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("判定不可"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage("レート制限"),
    "ipType": MessageLookupByLibrary.simpleMessage("タイプ"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("ビジネス"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("データセンター"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("モバイル回線"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("住宅"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("IPv6タイムアウト（ms）"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("たった今"),
    "key": MessageLookupByLibrary.simpleMessage("キー"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "large": MessageLookupByLibrary.simpleMessage("大"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("最終更新"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage("起動が完了しませんでした"),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "前回、アプリは起動中に予期せず終了しました。今回の自動セットアップはスキップしました。手動で起動して再試行できます。",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("レイアウト"),
    "light": MessageLookupByLibrary.simpleMessage("ライト"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("折り返し"),
    "list": MessageLookupByLibrary.simpleMessage("リスト"),
    "listen": MessageLookupByLibrary.simpleMessage("リッスン"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage("リッスンのルーティングマーク"),
    "liveConnections": MessageLookupByLibrary.simpleMessage("リアルタイム接続"),
    "loading": MessageLookupByLibrary.simpleMessage("読み込み中…"),
    "local": MessageLookupByLibrary.simpleMessage("ローカル"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "ローカルネットワークの権限が拒否されたため gvisor スタックを使用します。LAN にはアクセスできません。",
    ),
    "log": MessageLookupByLibrary.simpleMessage("ログ"),
    "logLevel": MessageLookupByLibrary.simpleMessage("ログレベル"),
    "logs": MessageLookupByLibrary.simpleMessage("ログ"),
    "loopback": MessageLookupByLibrary.simpleMessage("UWP ループバック解除"),
    "loose": MessageLookupByLibrary.simpleMessage("ゆったり"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("最大失敗回数"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("最大化"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage("常駐メモリ"),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage("アプリと共有"),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("未使用のヒープ"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage("使用中のヒープ"),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "コアは実行されていません",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage("ランタイムのオーバーヘッド"),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("ゴルーチンスタック"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "プロセスの常駐メモリからの推定値で、システムの表示とは異なる場合があります。",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "コアはアプリと同じプロセスで動作します。コア分はランタイム統計から推定し、残りはアプリと共有メモリとして計上します。",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("メモリ情報"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("メモリを解放しました"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("最小"),
    "minimize": MessageLookupByLibrary.simpleMessage("最小化"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage("ウィンドウを閉じても実行を継続"),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("Mixedポート"),
    "mode": MessageLookupByLibrary.simpleMessage("モード"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("モノクローム"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("その他"),
    "name": MessageLookupByLibrary.simpleMessage("名前"),
    "network": MessageLookupByLibrary.simpleMessage("ネットワーク"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "リクエストはキャンセルされました",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "サーバーに接続できませんでした。ネットワーク接続またはプロキシ設定を確認してください",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("ネットワーク検出"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "サーバーのアドレスを解決できませんでした。URL が正しいこと、DNS が使えることを確認してください",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "リクエストが多すぎます（HTTP 429）。しばらく待ってから再試行してください",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("ネットワーク速度"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "リクエストがタイムアウトしました。ネットワークまたはプロキシを確認してから再試行してください",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "安全な接続に失敗しました。サーバー証明書が無効か、接続が傍受されている可能性があります",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("ネットワーク種別"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("ニュートラル"),
    "no": MessageLookupByLibrary.simpleMessage("いいえ"),
    "noData": MessageLookupByLibrary.simpleMessage("データがありません"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("今後表示しない"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("ネットワークがありません"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("ネットワーク不使用アプリ"),
    "noResolve": MessageLookupByLibrary.simpleMessage("IPを解決しない"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage("一致する結果はありません"),
    "none": MessageLookupByLibrary.simpleMessage("なし"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "現在のプロキシグループは選択できません",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "プロファイルを追加して始めましょう",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage(
      "プロキシトラフィックのみ集計",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("任意"),
    "options": MessageLookupByLibrary.simpleMessage("オプション"),
    "other": MessageLookupByLibrary.simpleMessage("その他"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("アウトバウンド IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("アウトバウンドモード"),
    "override": MessageLookupByLibrary.simpleMessage("上書き"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("DNSを上書き"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("上書きモード"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("NTPを上書き"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage("名前が空です"),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "プロキシもプロキシプロバイダーも選択されていないため、コアはこのグループを拒否します",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("カスタム"),
    "palette": MessageLookupByLibrary.simpleMessage("パレット"),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "paste": MessageLookupByLibrary.simpleMessage("貼り付け"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("アルバムから選択"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("最前面に固定"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "有効なQRコードをアップロードしてください",
    ),
    "port": MessageLookupByLibrary.simpleMessage("ポート"),
    "preview": MessageLookupByLibrary.simpleMessage("プレビュー"),
    "process": MessageLookupByLibrary.simpleMessage("プロセス"),
    "profile": MessageLookupByLibrary.simpleMessage("プロファイル"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("有効な間隔を入力してください"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("自動更新間隔を入力してください"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "プロファイルが変更されています。自動更新を無効にしますか？",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "プロファイル名を入力してください",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "有効なプロファイルURLを入力してください",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "プロファイルのURLを入力してください",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("プロファイル"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("プロファイルの並べ替え"),
    "project": MessageLookupByLibrary.simpleMessage("プロジェクト"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage(
      "サブスクリプション",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("外部リソース"),
    "proxies": MessageLookupByLibrary.simpleMessage("プロキシ"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("プロキシチェーン"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("プロキシグループ"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("プロキシノード"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("プロキシプロバイダー"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("ピュアブラック"),
    "qrcode": MessageLookupByLibrary.simpleMessage("QRコード"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage(
      "QRコードをスキャンしてプロファイルを取得します",
    ),
    "quickAdd": MessageLookupByLibrary.simpleMessage("クイック追加"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("レインボー"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("最近のリクエスト"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Redirポート"),
    "redo": MessageLookupByLibrary.simpleMessage("やり直す"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("メモリを解放"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage(
      "メモリの解放に失敗しました",
    ),
    "remote": MessageLookupByLibrary.simpleMessage("リモート"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("リモート宛先"),
    "remove": MessageLookupByLibrary.simpleMessage("削除"),
    "replace": MessageLookupByLibrary.simpleMessage("置換"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("すべて置換"),
    "request": MessageLookupByLibrary.simpleMessage("リクエスト"),
    "requests": MessageLookupByLibrary.simpleMessage("リクエスト"),
    "reset": MessageLookupByLibrary.simpleMessage("リセット"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "このページには変更があります。リセットしてもよろしいですか？",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("リソース"),
    "respectRules": MessageLookupByLibrary.simpleMessage("ルールに従う"),
    "restart": MessageLookupByLibrary.simpleMessage("再起動"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage("コアを再起動してもよろしいですか？"),
    "restore": MessageLookupByLibrary.simpleMessage("復元"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("復元方式"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage("互換"),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("上書き"),
    "retry": MessageLookupByLibrary.simpleMessage("再試行"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("ルートアドレス"),
    "routeMode": MessageLookupByLibrary.simpleMessage("ルートモード"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage(
      "プライベートアドレスをバイパス",
    ),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("設定を使用"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("ルール"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage("論理ルール AND"),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage("完全なドメインにマッチ"),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "ドメインキーワードにマッチ",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "ドメインの正規表現でマッチ",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "ドメインサフィックスにマッチ",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "ワイルドカードでマッチ（* と ? のみ対応）",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "DSCPマークにマッチ（tproxy udpインバウンドのみ）",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "宛先ポート範囲にマッチ",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage("IPの国コードにマッチ"),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "Geosite 内のドメインにマッチ",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage("インバウンド名にマッチ"),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage(
      "インバウンドポートにマッチ",
    ),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage(
      "インバウンドタイプにマッチ",
    ),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "インバウンドユーザー名にマッチ（/ で複数指定可）",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "IPが属するASNにマッチ",
    ),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "IPアドレス範囲にマッチ（IP-CIDR6 は別名です）",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "IPアドレス範囲にマッチ",
    ),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "IPサフィックス範囲にマッチ",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "すべてのリクエストにマッチ（条件不要）",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "TCPまたはUDPにマッチ",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage("論理ルール NOT"),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("論理ルール OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "プロセス名でマッチ（Androidではパッケージ名にマッチ）",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "プロセス名の正規表現でマッチ（Androidではパッケージ名にマッチ）",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "プロセス名のワイルドカードでマッチ（* と ? のみ対応）",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "プロセスのフルパスでマッチ",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "プロセスパスの正規表現でマッチ",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "プロセスパスのワイルドカードでマッチ（* と ? のみ対応）",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "再マッチ名にマッチ（複数は / で区切る）",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "ルールセットを参照します。rule-providersの設定が必要です",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "送信元IPの国コードにマッチ",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "送信元IPが属するASNにマッチ",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "送信元IPアドレス範囲にマッチ",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "送信元IPサフィックス範囲にマッチ",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "送信元ポート範囲にマッチ",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "サブルールへマッチします。括弧の使い方に注意してください",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "LinuxのユーザーIDにマッチ",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("ルール名"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BitTorrent を直接接続",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "DNS over TLS をブロック",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("QUIC をブロック"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("STUN をブロック"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage("LAN 直接接続"),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple と Microsoft に直接接続",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("ルールプロバイダー"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("ルールセット"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("ルールターゲット"),
    "rules": MessageLookupByLibrary.simpleMessage("ルール"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("起動時間"),
    "safeMode": MessageLookupByLibrary.simpleMessage("セーフモード"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("保存"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("変更を保存しますか？"),
    "script": MessageLookupByLibrary.simpleMessage("スクリプト"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage("選択項目へスクロール"),
    "search": MessageLookupByLibrary.simpleMessage("検索"),
    "seconds": MessageLookupByLibrary.simpleMessage("秒"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("すべて選択"),
    "selected": MessageLookupByLibrary.simpleMessage("選択済み"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("サーバー"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("利用可能"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("ブロック済み"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("検査"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("すべて検査"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("近日提供予定"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage(
      "許可されていない ISP",
    ),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("検出に失敗しました"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("サービスを管理"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage("オリジナル作品のみ"),
    "servicePending": MessageLookupByLibrary.simpleMessage("未検査"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage("アクセス制限"),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("サービスの状態"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("利用不可"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage("対象外の地域"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "show": MessageLookupByLibrary.simpleMessage("表示"),
    "showLess": MessageLookupByLibrary.simpleMessage("折りたたむ"),
    "showMore": MessageLookupByLibrary.simpleMessage("展開"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "通知に停止ボタンを表示",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("コンパクト"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("サイドバーのぼかし"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("最小化して起動"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("個別追加"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("サイズ"),
    "slide": MessageLookupByLibrary.simpleMessage("スライド"),
    "socksPort": MessageLookupByLibrary.simpleMessage("SOCKSポート"),
    "sort": MessageLookupByLibrary.simpleMessage("並べ替え"),
    "source": MessageLookupByLibrary.simpleMessage("ソース"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("送信元IP"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("特殊プロキシ"),
    "specialRules": MessageLookupByLibrary.simpleMessage("特殊ルール"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("速度統計"),
    "standard": MessageLookupByLibrary.simpleMessage("標準"),
    "start": MessageLookupByLibrary.simpleMessage("開始"),
    "startVpn": MessageLookupByLibrary.simpleMessage("VPNを起動しています…"),
    "status": MessageLookupByLibrary.simpleMessage("状態"),
    "stop": MessageLookupByLibrary.simpleMessage("停止"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("VPNを停止しています…"),
    "strategy": MessageLookupByLibrary.simpleMessage("戦略"),
    "style": MessageLookupByLibrary.simpleMessage("スタイル"),
    "subRule": MessageLookupByLibrary.simpleMessage("サブルール"),
    "submit": MessageLookupByLibrary.simpleMessage("送信"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage("サブスクリプション情報"),
    "suspended": MessageLookupByLibrary.simpleMessage("一時停止中…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("プロファイルを切り替え"),
    "sync": MessageLookupByLibrary.simpleMessage("同期"),
    "system": MessageLookupByLibrary.simpleMessage("システム"),
    "systemApp": MessageLookupByLibrary.simpleMessage("システムアプリ"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("システムプロキシ"),
    "tab": MessageLookupByLibrary.simpleMessage("タブ"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("タブアニメーション"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP同時接続"),
    "testUrl": MessageLookupByLibrary.simpleMessage("テストURL"),
    "textScale": MessageLookupByLibrary.simpleMessage("テキストの拡大縮小"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "themeColor": MessageLookupByLibrary.simpleMessage("テーマカラー"),
    "themeMode": MessageLookupByLibrary.simpleMessage("テーマモード"),
    "tight": MessageLookupByLibrary.simpleMessage("コンパクト"),
    "time": MessageLookupByLibrary.simpleMessage("時刻"),
    "timeout": MessageLookupByLibrary.simpleMessage("タイムアウト"),
    "tip": MessageLookupByLibrary.simpleMessage("ヒント"),
    "toggle": MessageLookupByLibrary.simpleMessage("切り替え"),
    "tolerance": MessageLookupByLibrary.simpleMessage("許容値"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("トーナルスポット"),
    "tools": MessageLookupByLibrary.simpleMessage("ツール"),
    "torch": MessageLookupByLibrary.simpleMessage("ライト"),
    "total": MessageLookupByLibrary.simpleMessage("合計"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("合計トラフィック"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("TProxyポート"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("トラフィック統計"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage("管理者モードでのみ有効"),
    "turnOff": MessageLookupByLibrary.simpleMessage("オフにする"),
    "turnOn": MessageLookupByLibrary.simpleMessage("オンにする"),
    "undo": MessageLookupByLibrary.simpleMessage("元に戻す"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("統一遅延"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage("不明なネットワークエラー"),
    "unmaximize": MessageLookupByLibrary.simpleMessage("元に戻す"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("固定を解除"),
    "update": MessageLookupByLibrary.simpleMessage("更新"),
    "upload": MessageLookupByLibrary.simpleMessage("アップロード"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("URLからプロファイルを取得します"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("Hostsを使用"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage("システムのHostsを使用"),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("使用済みトラフィック"),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("値"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("ビブラント"),
    "view": MessageLookupByLibrary.simpleMessage("表示"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "VPN関連の設定変更を検出しました",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage("変更はVPNの再起動後に有効になります"),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("ホワイトリストモード"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("システムに書き込む"),
    "yearsAgo": m45,
  };
}
