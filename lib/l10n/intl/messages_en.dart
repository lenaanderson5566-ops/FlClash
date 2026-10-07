// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count, skipped) =>
      "${count} to add, ${skipped} skipped as existing";

  static String m1(code) =>
      "Windows blocked FastAICore.exe (error ${code}). Install an official signed release or ask your administrator to review the application policy.";

  static String m2(name) =>
      "FastAI could not finish launching twice in a row. Configuration ${name} was paused to prevent repeated crashes. Reconnect from Home to try again.";

  static String m3(url) => "Do you want to create a profile from ${url}?";

  static String m4(count) =>
      "${Intl.plural(count, one: '1 day ago', other: '${count} days ago')}";

  static String m5(label) =>
      "Are you sure you want to delete the selected ${label}?";

  static String m6(label) => "Are you sure you want to delete this ${label}?";

  static String m7(label) => "${label} details";

  static String m8(label) => "${label} cannot be empty";

  static String m9(label) => "${label} already exists";

  static String m10(name) => "${name} is already up to date";

  static String m11(name) => "${name} updated";

  static String m12(count) =>
      "${Intl.plural(count, one: '1 hour ago', other: '${count} hours ago')}";

  static String m13(count) =>
      "${Intl.plural(count, one: '1 hour', other: '${count} hours')}";

  static String m14(target) => "${target} is an invalid policy";

  static String m15(ruleSet) => "${ruleSet} is an invalid rule set";

  static String m16(subRule) => "${subRule} is an invalid SUB_RULE";

  static String m17(line, message) => "Line ${line}: ${message}";

  static String m18(label, max) => "${label} must be at most ${max} characters";

  static String m19(size) => "Released ${size}";

  static String m20(count) =>
      "${Intl.plural(count, one: '1 minute ago', other: '${count} minutes ago')}";

  static String m21(count) =>
      "${Intl.plural(count, one: '1 month ago', other: '${count} months ago')}";

  static String m22(code) =>
      "The server denied access (HTTP ${code}). The link may have expired, or the credentials are wrong";

  static String m23(code) => "The server rejected the request (HTTP ${code})";

  static String m24(code) =>
      "Nothing was found at this address (HTTP ${code}). Check that the URL is correct";

  static String m25(detail) => "Network request failed: ${detail}";

  static String m26(code) =>
      "The server ran into a problem (HTTP ${code}). Try again later";

  static String m27(label) => "No ${label} yet";

  static String m28(message) => "The core cannot parse this proxy: ${message}";

  static String m29(name) =>
      "The name ${name} is already used by another proxy or proxy group";

  static String m30(path) =>
      "Proxy groups reference each other in a loop: ${path}";

  static String m31(names) => "These proxy providers do not exist: ${names}";

  static String m32(names) =>
      "These proxies or policies do not exist: ${names}";

  static String m33(name) =>
      "${name} is a built-in policy name and cannot be used here";

  static String m34(names) =>
      "The profile\'s own proxy groups name proxies that the custom proxies no longer include: ${names}";

  static String m35(label, profiles) =>
      "${label} is still used by the custom proxy groups or rules of ${profiles}. Remove it there first";

  static String m36(profiles, label) =>
      "The subscriptions of ${profiles} already have ${label}, so those profiles would switch to theirs. Choose another name";

  static String m37(count) =>
      "${Intl.plural(count, one: '1 proxy', other: '${count} proxies')}";

  static String m38(count) =>
      "${Intl.plural(count, one: '1 rule', other: '${count} rules')}";

  static String m39(appName) => "${appName} (Safe mode)";

  static String m40(count) =>
      "${Intl.plural(count, one: '1 second', other: '${count} seconds')}";

  static String m41(count) => "${count} selected";

  static String m42(time) => "Checked at ${time}";

  static String m43(label) => "${label} must be a single item";

  static String m44(label) => "${label} must be a URL";

  static String m45(count) =>
      "${Intl.plural(count, one: '1 year ago', other: '${count} years ago')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "accessControl": MessageLookupByLibrary.simpleMessage(
      "Which apps use the proxy",
    ),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Only selected apps go through the VPN",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "Choose apps to include in or exclude from the VPN",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "App access control is disabled",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Selected apps are excluded from the VPN",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage(
      "Access control settings",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "action": MessageLookupByLibrary.simpleMessage("Action"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("Test all delays"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("Direct mode"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("Global mode"),
    "actionMode": MessageLookupByLibrary.simpleMessage("Switch mode"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("System proxy"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("Rule mode"),
    "actionStart": MessageLookupByLibrary.simpleMessage("Start/Stop"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage(
      "Update profiles",
    ),
    "actionView": MessageLookupByLibrary.simpleMessage("Show/Hide"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Add profile"),
    "addRule": MessageLookupByLibrary.simpleMessage("Add rule"),
    "addedRules": MessageLookupByLibrary.simpleMessage("Added rules"),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "agree": MessageLookupByLibrary.simpleMessage("Agree"),
    "allowBypass": MessageLookupByLibrary.simpleMessage(
      "Allow apps to bypass VPN",
    ),
    "allowLan": MessageLookupByLibrary.simpleMessage("Allow LAN"),
    "answers": MessageLookupByLibrary.simpleMessage("Answers"),
    "app": MessageLookupByLibrary.simpleMessage("App"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage(
      "App access control",
    ),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage(
      "Append system DNS",
    ),
    "authentication": MessageLookupByLibrary.simpleMessage("Authentication"),
    "authorize": MessageLookupByLibrary.simpleMessage("Authorize"),
    "authorized": MessageLookupByLibrary.simpleMessage("Authorized"),
    "auto": MessageLookupByLibrary.simpleMessage("Auto"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage(
      "Auto check for updates",
    ),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("Auto launch"),
    "autoRun": MessageLookupByLibrary.simpleMessage(
      "Connect automatically on startup",
    ),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage(
      "Auto-set system DNS",
    ),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("Auto update"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage(
      "Auto-update interval (minutes)",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backup": MessageLookupByLibrary.simpleMessage("Backup"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "This backup comes from a newer version of the app. Update the app before restoring it",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("Basic info"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("Batch add"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "One item per line, or separated by commas",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "One entry per line: key, a space, then value",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("Behavior"),
    "bind": MessageLookupByLibrary.simpleMessage("Bind"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("Blacklist mode"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("Block connection"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("Bypass domains"),
    "cache": MessageLookupByLibrary.simpleMessage("Cache"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("Cache algorithm"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage(
      "The cache is corrupted. Clear it?",
    ),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("Cache size"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "Allow camera access in system settings to scan QR codes, or choose a QR code image from the album.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera permission required",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage(
      "Camera unavailable",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("Deselect all"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "Failed to switch proxy; the previous selection has been restored",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage(
      "Breaking changes",
    ),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("New features"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("Bug fixes"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("Performance"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("Reverts"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage(
      "Verify TLS certificates",
    ),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("Check for updates"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage(
      "The app is already up to date",
    ),
    "clearSearch": MessageLookupByLibrary.simpleMessage("Clear search"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage(
      "Export to clipboard",
    ),
    "clipboardImport": MessageLookupByLibrary.simpleMessage(
      "Import from clipboard",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "closeConnections": MessageLookupByLibrary.simpleMessage(
      "Close connections",
    ),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "columns": MessageLookupByLibrary.simpleMessage("Columns"),
    "compatible": MessageLookupByLibrary.simpleMessage("Compatibility mode"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to exit the current window?",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("Connected"),
    "connecting": MessageLookupByLibrary.simpleMessage("Connecting…"),
    "connection": MessageLookupByLibrary.simpleMessage("Connection"),
    "connections": MessageLookupByLibrary.simpleMessage("Connections"),
    "connectivity": MessageLookupByLibrary.simpleMessage("Connectivity: "),
    "content": MessageLookupByLibrary.simpleMessage("Content"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("Content"),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage(
      "Copy environment variables",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Copy link"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("Copied successfully"),
    "core": MessageLookupByLibrary.simpleMessage("Core"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows Smart App Control blocked FastAICore.exe. Install an official signed release or contact support. Keep Windows security protections enabled.",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("Core status"),
    "country": MessageLookupByLibrary.simpleMessage("Region"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("Crash detected"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("Crash analytics"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "When enabled, crash logs without sensitive information are uploaded automatically when the app crashes",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("Creation time"),
    "custom": MessageLookupByLibrary.simpleMessage("Custom"),
    "cut": MessageLookupByLibrary.simpleMessage("Cut"),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "Data changes detected. Save them?",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "This app uses Firebase Crashlytics to collect crash information to improve stability.\nThe collected data includes device information and crash details, and contains no personally sensitive data.\nYou can turn this off in settings.",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage(
      "Data collection notice",
    ),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "Failed to save the change; it has been rolled back",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("Default"),
    "delay": MessageLookupByLibrary.simpleMessage("Delay"),
    "delayTest": MessageLookupByLibrary.simpleMessage("Delay test"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free.",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("Destination"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage(
      "Destination GeoIP",
    ),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage(
      "Destination IP ASN",
    ),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage(
      "Relies on a third-party API; for reference only",
    ),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("Dialer proxy"),
    "direct": MessageLookupByLibrary.simpleMessage("Direct"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("Disable UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
    "disconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage(
      "New version found",
    ),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("DNS hijacking"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("DNS mode"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNS queries"),
    "docked": MessageLookupByLibrary.simpleMessage("Docked"),
    "domain": MessageLookupByLibrary.simpleMessage("Domain"),
    "download": MessageLookupByLibrary.simpleMessage("Download"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editRule": MessageLookupByLibrary.simpleMessage("Edit rule"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("Enabled"),
    "entries": MessageLookupByLibrary.simpleMessage(" entries"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "exclude": MessageLookupByLibrary.simpleMessage("Hide from recent tasks"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "Hide the app from recent tasks while it is in the background",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("Exclude type"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("Exit"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("Exit full screen"),
    "expand": MessageLookupByLibrary.simpleMessage("Standard"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("Expected status"),
    "expireTime": MessageLookupByLibrary.simpleMessage("Expiration time"),
    "exportFile": MessageLookupByLibrary.simpleMessage("Export file"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("Export logs"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Export successful"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("Expressive"),
    "externalController": MessageLookupByLibrary.simpleMessage(
      "External controller",
    ),
    "externalLink": MessageLookupByLibrary.simpleMessage("External link"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("Extra large"),
    "fade": MessageLookupByLibrary.simpleMessage("Fade"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("Fallback filter"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "Account information could not be refreshed. Connect will check your account again.",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "Checks for new versions in the background. Download and installation require your action.",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("Automatic selection"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "Background and notifications",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage("Account disabled"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "Unable to verify the server certificate. Check your system clock or contact support.",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage(
      "System connection",
    ),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("TCP connectivity"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("Secure connection"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("Choose a route"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage(
      "Client configuration",
    ),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI is temporarily unavailable. Contact support on the website.",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "Both paths failed for this endpoint. This can be a shared network problem or an endpoint restriction; review the layer checks before deciding.",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "Both paths reached the test endpoint in this run.",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage(
      "Connection comparison",
    ),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "The system path passed while the selected route failed. Investigate the route first; the cause is not yet confirmed.",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "The selected route passed while the system path failed. Review system DNS, routing and local network restrictions.",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("Connect"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("Connected"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("Connection"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "Connection failed. Retry or choose another route.",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("Copy technical report"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage(
      "Independent traffic remaining",
    ),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "Independent traffic is separate from your period allowance and is not cleared by a period reset. Availability and expiry depend on your account.",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("Current route"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "Connection settings changed during the check. Run it again for current results.",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "The core or route list is not ready. Refresh routes and reconnect.",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "Not connected. Connect first to verify the proxy route.",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("System DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "DNS lookup failed or timed out. Check your network or try another network.",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "Public test domains resolved successfully.",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage(
      "Find connection problems and follow the recovery steps",
    ),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Windows proxy/PAC differs from the selected mode. Check other VPN or proxy apps and Windows proxy settings, then reconnect.",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "The local proxy port did not respond. Disconnect and reconnect, then retry.",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "Local port is reachable; this does not verify the remote route.",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Windows manual proxy and PAC settings match the current mode.",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("Check again"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("Selected route"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "The selected route could not reach the test endpoint. Try another route; check DNS and local network if all routes fail.",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "The selected route reached the HTTPS test endpoint. Other services may differ.",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage(
      "Checking your connection…",
    ),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "Skipped in safe mode: the proxy core and system settings are not used.",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "Core, routes and connection permissions are ready. This does not verify every system setting.",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "This check does not apply to the current connection state or device.",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "TUN permission is not ready. Reconnect and approve permission, or choose system proxy.",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "This check could not be completed. Try again or follow the guidance below.",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "The public test endpoint could not be verified. This alone does not mean all Internet access is unavailable.",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "The public test endpoint returned the expected response.",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("Disconnect"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("Disconnecting…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "Traffic exhausted. Renew or buy credits.",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("Subscription expired"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("Period expiry"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("Global mode"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage(
      "Checks finished; some items could not be verified",
    ),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage(
      "Some checks need attention",
    ),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage(
      "Completed checks passed",
    ),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "Check the results below. Available fixes run only when you choose them.",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Choose a route. Connect in one click.",
    ),
    "fdHome": MessageLookupByLibrary.simpleMessage("Home"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "The server returned an invalid configuration. Sync again or contact support.",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Email or password is incorrect",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage(
      "Your app is up to date",
    ),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("Local proxy"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · Connect before using this address.",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("Sign in"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("Sign out"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage(
      "Network connectivity",
    ),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Network diagnostics",
    ),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "Unable to reach the service. Check your network and try again.",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage(
      "Next automatic reset (local time)",
    ),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("No period expiry"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage(
      "Choose a plan to get started",
    ),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "No routes are available. Check your account on the website.",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage(
      "Official website",
    ),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("Period traffic used"),
    "fdPlan": MessageLookupByLibrary.simpleMessage("Plan"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage(
      "Internet connectivity",
    ),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Try again later.",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "Uses the same HTTPS test URL as the selected route without an explicit application proxy. TUN or OS routing may still affect this path; it is not guaranteed to bypass the VPN.",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("Reference ID"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage(
      "Register or reset password on the website",
    ),
    "fdRemaining": MessageLookupByLibrary.simpleMessage(
      "Period traffic remaining",
    ),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage(
      "Refresh configuration and connect",
    ),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "The action could not be completed. Review the new results below; sign in and check account access if needed.",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "This action may interrupt the connection or change the selected route. Checks run again afterwards. Route recovery tests up to five alternatives.",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("Reconnect"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage(
      "Find and switch to a working route",
    ),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "The action finished, but recovery is not verified. Follow the remaining guidance below.",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "The proxy route passed verification. Review any remaining warnings below.",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage(
      "Applying the fix and checking the connection…",
    ),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("Copy report"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage(
      "Assessment criteria",
    ),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "Both test domains must return at least one address within 8 seconds. This checks the system resolver, not DNS leaks or the configured upstream DNS server.",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Check Wi-Fi/Ethernet and complete any network sign-in.\n2. Retry on another network to isolate a local DNS problem.\n3. If it persists, send this report to support or your network administrator.",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("Issue found"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage(
      "No measurement was collected.",
    ),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "No repair is needed for this check. This is a snapshot, not a guarantee of access to every service.",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "Technical parameters (ms = milliseconds)",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("Passed"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "A TCP connection to the configured loopback port must complete within 8 seconds. It does not identify the listening process or verify the remote route.",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. Disconnect and reconnect in FastAI.\n2. If it fails again, restart FastAI and retry.\n3. Send the report to support; a failed port check alone does not prove another app occupies it.",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "The copied report includes test destinations and DNS answers, but no account, token, subscription or PAC URL.",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "Windows user-level manual HTTP/HTTPS proxy must match the selected mode; an active PAC is reported as a potential conflict. Firewall, WinHTTP and organization policies are not inspected.",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. Review Windows Settings → Network & Internet → Proxy.\n2. Exit other proxy/VPN apps and review your own manual proxy or PAC configuration. Do not remove organization-managed settings.\n3. Reconnect FastAI and repeat the check.",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("What to do next"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "The selected route must return HTTP 204 within 8 seconds, without a proxy error.",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. Select another route and retry.\n2. If every route fails, review the DNS and local proxy results.\n3. If only the test endpoint fails, check the service you need and send the report to support.",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "Use the normal app build, connect, then run the check again. Mobile devices do not run the desktop port check.",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Confirm that you are signed in and your account can connect.\n2. Refresh routes and reconnect.\n3. For TUN authorization problems, approve the permission request or choose system proxy.",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("Not run"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("Check started"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("Not verified"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "Certificate validation is enabled. The public test endpoint must return HTTP 204 within 8 seconds; redirects are not followed.",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. Check the system date and time.\n2. Complete any Wi-Fi sign-in and try another network.\n3. Compare the other test endpoint and proxy path. Do not disable certificate validation.",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "The operation failed. Please retry.",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "The request timed out. Check your network and retry.",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "Use one available reset to clear your current period usage? Independent traffic, your plan and subscription expiry will remain unchanged.",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage(
      "Available traffic resets",
    ),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage(
      "No period usage needs to be reset.",
    ),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "Uses one available reset to clear period usage. Independent traffic and the subscription expiry remain unchanged.",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "A valid subscription with period traffic is required.",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "No traffic resets are available.",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Period traffic reset. Account information refreshed.",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage(
      "Reset period traffic",
    ),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "Unable to check available resets. Refresh account information and retry.",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage("Check reset result"),
    "fdRouteChecking": MessageLookupByLibrary.simpleMessage("Checking…"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("Check failed"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage(
      "Last measurement",
    ),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("Low latency"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("Higher latency"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("Not checked"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Your session expired. Please sign in again.",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("Plans"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("Smart mode"),
    "fdSync": MessageLookupByLibrary.simpleMessage("Refresh routes"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "Unable to refresh routes. Try again before connecting.",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage("Syncing routes…"),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "Connect to the public test server within 8 seconds. The elapsed time includes DNS resolution.",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "TCP connection failed. Review DNS, network access and filtering; this alone does not prove a firewall issue.",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "The test server accepted a TCP connection.",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. Review the DNS result first.\n2. Try another network or complete network sign-in.\n3. Review firewall/VPN rules with your administrator; do not turn off the firewall as a blanket fix.",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "Complete TLS using the system trust store within 8 seconds. Time includes DNS and TCP. Certificate validity dates are recorded when available.",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS could not complete. Check the clock, network interception and certificate trust without disabling validation.",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "TLS handshake and certificate validation succeeded.",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "Update required to continue connecting",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("Use one reset"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "Check your email and password or complete verification on the website.",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("Manage on website"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "Renewals, orders, account settings and support are available on the website.",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage(
      "Sign in to connect and choose a location",
    ),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("Fidelity"),
    "file": MessageLookupByLibrary.simpleMessage("File"),
    "fileDesc": MessageLookupByLibrary.simpleMessage(
      "Upload a profile file directly",
    ),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage(
      "The file has been modified. Save the changes?",
    ),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("Find process"),
    "floating": MessageLookupByLibrary.simpleMessage("Floating"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("Font family"),
    "fontSize": MessageLookupByLibrary.simpleMessage("Size"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to force restart the core?",
    ),
    "format": MessageLookupByLibrary.simpleMessage("Format"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("Fruit salad"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("Auto update"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage(
      "Geo low-memory mode",
    ),
    "global": MessageLookupByLibrary.simpleMessage("Global"),
    "go": MessageLookupByLibrary.simpleMessage("Go"),
    "goDownload": MessageLookupByLibrary.simpleMessage("Download"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Helper service unavailable; TUN mode cannot be enabled. Reinstall FastAI to restore it.",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("Hide IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage(
      "Hide timed-out nodes",
    ),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "Leave out nodes whose last delay test timed out",
    ),
    "host": MessageLookupByLibrary.simpleMessage("Host"),
    "hours": MessageLookupByLibrary.simpleMessage("hours"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("Icon"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("Icon records"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("Icon style"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("Icon URL"),
    "import": MessageLookupByLibrary.simpleMessage("Import"),
    "importFile": MessageLookupByLibrary.simpleMessage("Import from file"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("Import from URL"),
    "inbound": MessageLookupByLibrary.simpleMessage("Inbound"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage(
      "Include all proxies",
    ),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("Never expires"),
    "init": MessageLookupByLibrary.simpleMessage("Init"),
    "initiator": MessageLookupByLibrary.simpleMessage("Initiator"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "The app list permission was denied, so installed apps cannot be listed. Please grant it manually in system settings.",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "This system hides the installed app list until the permission is granted. Authorize it to configure the per-app proxy.",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "App list permission required",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage(
      "Smart selection",
    ),
    "interfaceName": MessageLookupByLibrary.simpleMessage("Interface name"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage(
      "Outbound interface",
    ),
    "internet": MessageLookupByLibrary.simpleMessage("Internet"),
    "interval": MessageLookupByLibrary.simpleMessage("Interval"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("Intranet IP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage(
      "Invalid backup file",
    ),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "A DSCP mark cannot exceed 63",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "Only tcp or udp is supported",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "This QR code doesn\'t contain a profile link",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "Enter numbers or ranges such as 80 or 8000-9000, separated by /",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP address"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("Abuse history"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("Proxy"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("Flags"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("Organization"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t determine the IP type",
    ),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("Good"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("Level"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("Normal"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("Check again"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("Risky"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("Answered by"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("Sources"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage(
      "Different outbound IP",
    ),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("No type"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage("Rate limited"),
    "ipType": MessageLookupByLibrary.simpleMessage("Type"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("Business"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("Data center"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("Mobile network"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("Residential"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("IPv6 timeout (ms)"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "key": MessageLookupByLibrary.simpleMessage("Key"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "large": MessageLookupByLibrary.simpleMessage("Large"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("Last updated"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage(
      "Launch did not finish",
    ),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "The app exited unexpectedly while it was starting up last time. Automatic setup was skipped for this launch; you can start it manually to retry.",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("Layout"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("Word wrap"),
    "list": MessageLookupByLibrary.simpleMessage("List"),
    "listen": MessageLookupByLibrary.simpleMessage("Listen"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage(
      "Listen routing mark",
    ),
    "liveConnections": MessageLookupByLibrary.simpleMessage("Live connections"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading…"),
    "local": MessageLookupByLibrary.simpleMessage("Local"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "Local network permission denied: using the gvisor stack, LAN is unreachable.",
    ),
    "log": MessageLookupByLibrary.simpleMessage("Log"),
    "logLevel": MessageLookupByLibrary.simpleMessage("Log level"),
    "logs": MessageLookupByLibrary.simpleMessage("Logs"),
    "loopback": MessageLookupByLibrary.simpleMessage("UWP loopback exemption"),
    "loose": MessageLookupByLibrary.simpleMessage("Loose"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("Max failures"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("Maximize"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage(
      "Resident memory",
    ),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage("App & shared"),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("Heap idle"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage("Heap in use"),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "Core is not running",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage(
      "Runtime overhead",
    ),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("Goroutine stacks"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "Estimated from process resident memory; it may differ from what the system reports.",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "The Core runs inside the app process. Its share is estimated from runtime stats, and the rest counts as app and shared memory.",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("Memory info"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("Memory released"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("Minimal"),
    "minimize": MessageLookupByLibrary.simpleMessage("Minimize"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage(
      "Keep running when the window is closed",
    ),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("Mixed port"),
    "mode": MessageLookupByLibrary.simpleMessage("Mode"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("Monochrome"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "network": MessageLookupByLibrary.simpleMessage("Network"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "The request was cancelled",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t connect to the server. Check your network connection or proxy settings",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage(
      "Network detection",
    ),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "Couldn\'t resolve the server address. Check that the URL is correct and DNS is working",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "Too many requests (HTTP 429). Wait a moment and try again",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("Network speed"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "The request timed out. Check your network or proxy, then try again",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "Secure connection failed. The server\'s certificate may be invalid, or the connection is being intercepted",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("Network type"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("Neutral"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noData": MessageLookupByLibrary.simpleMessage("No data"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage(
      "Don\'t remind me again",
    ),
    "noNetwork": MessageLookupByLibrary.simpleMessage("No network"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("No-network apps"),
    "noResolve": MessageLookupByLibrary.simpleMessage("Don\'t resolve IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "No matching results",
    ),
    "none": MessageLookupByLibrary.simpleMessage("None"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "The current proxy group cannot be selected",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "Add a profile to get started",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage(
      "Only count proxy traffic",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("Optional"),
    "options": MessageLookupByLibrary.simpleMessage("Options"),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("Outbound IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("Outbound mode"),
    "override": MessageLookupByLibrary.simpleMessage("Override"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("Override DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("Override mode"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("Override NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage(
      "The name is empty",
    ),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "No proxies or proxy providers are selected, so the core rejects this group",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "palette": MessageLookupByLibrary.simpleMessage("Palette"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "paste": MessageLookupByLibrary.simpleMessage("Paste"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("Choose from album"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("Pin window"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "Please upload a valid QR code",
    ),
    "port": MessageLookupByLibrary.simpleMessage("Port"),
    "preview": MessageLookupByLibrary.simpleMessage("Preview"),
    "process": MessageLookupByLibrary.simpleMessage("Process"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("Please enter a valid interval"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage(
          "Please enter the auto-update interval",
        ),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "The profile has been modified. Turn off auto update?",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Please enter the profile name",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid profile URL",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Please enter the profile URL",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("Profiles"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("Sort profiles"),
    "project": MessageLookupByLibrary.simpleMessage("Project"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage(
      "Subscription",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("External resources"),
    "proxies": MessageLookupByLibrary.simpleMessage("Proxies"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("Proxy chain"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("Proxy group"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("Proxy node"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("Proxy providers"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("Pure black"),
    "qrcode": MessageLookupByLibrary.simpleMessage("QR code"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage(
      "Scan a QR code to obtain a profile",
    ),
    "quickAdd": MessageLookupByLibrary.simpleMessage("Quick add"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("Rainbow"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("Recent requests"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Redir port"),
    "redo": MessageLookupByLibrary.simpleMessage("Redo"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("Release memory"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to release memory",
    ),
    "remote": MessageLookupByLibrary.simpleMessage("Remote"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage(
      "Remote destination",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "replace": MessageLookupByLibrary.simpleMessage("Replace"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("Replace all"),
    "request": MessageLookupByLibrary.simpleMessage("Request"),
    "requests": MessageLookupByLibrary.simpleMessage("Requests"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "This page has changes. Are you sure you want to reset?",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("Resources"),
    "respectRules": MessageLookupByLibrary.simpleMessage("Respect rules"),
    "restart": MessageLookupByLibrary.simpleMessage("Restart"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to restart the core?",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("Restore"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("Restore strategy"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage(
      "Compatible",
    ),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("Override"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("Route addresses"),
    "routeMode": MessageLookupByLibrary.simpleMessage("Route mode"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage(
      "Bypass private addresses",
    ),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("Use config"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("Rule"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage(
      "Logical rule AND",
    ),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage(
      "Match the full domain",
    ),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "Match a domain keyword",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Match a domain regex",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Match a domain suffix",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Wildcard match; only * and ? are supported",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "Match the DSCP mark (tproxy UDP inbound only)",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "Match the destination port range",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Match the IP\'s country code",
    ),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "Match domains in Geosite",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage(
      "Match the inbound name",
    ),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage(
      "Match the inbound port",
    ),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage(
      "Match the inbound type",
    ),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "Match the inbound username; separate multiple usernames with /",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Match the IP\'s ASN",
    ),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "Match an IP address range; IP-CIDR6 is just an alias",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Match an IP address range",
    ),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Match an IP suffix range",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "Match all requests, no conditions needed",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "Match TCP or UDP",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage(
      "Logical rule NOT",
    ),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("Logical rule OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "Match by process name; matches the package name on Android",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Match by process name regex; matches the package name on Android",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Match by process name wildcard; only * and ? are supported",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "Match by the full process path",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Match by process path regex",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Match by process path wildcard; only * and ? are supported",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "Match the rematch name; separate multiple names with /",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "Reference a rule set; requires rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Match the source IP\'s country code",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Match the source IP\'s ASN",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Match a source IP address range",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Match a source IP suffix range",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "Match the source port range",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "Match into a sub-rule; mind the parentheses",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "Match the Linux user ID",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("Rule name"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BitTorrent direct",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "Block DNS over TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("Block QUIC"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("Block STUN"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage("LAN direct"),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple and Microsoft direct",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("Rule providers"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("Rule set"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("Rule target"),
    "rules": MessageLookupByLibrary.simpleMessage("Rules"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("Run time"),
    "safeMode": MessageLookupByLibrary.simpleMessage("Safe mode"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save the changes?"),
    "script": MessageLookupByLibrary.simpleMessage("Script"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage(
      "Scroll to selected",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
    "selected": MessageLookupByLibrary.simpleMessage("Selected"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("Server"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("Available"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("Blocked"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("Check"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("Check all"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage(
      "Disallowed ISP",
    ),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("Check failed"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("Manage services"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage(
      "Originals only",
    ),
    "servicePending": MessageLookupByLibrary.simpleMessage("Not checked"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage(
      "Access restricted",
    ),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("Service status"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("Unavailable"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage(
      "Region not supported",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "show": MessageLookupByLibrary.simpleMessage("Show"),
    "showLess": MessageLookupByLibrary.simpleMessage("Collapse"),
    "showMore": MessageLookupByLibrary.simpleMessage("Expand"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "Stop button in notification",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("Compact"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("Sidebar blur"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("Start minimized"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("Single add"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "slide": MessageLookupByLibrary.simpleMessage("Slide"),
    "socksPort": MessageLookupByLibrary.simpleMessage("SOCKS port"),
    "sort": MessageLookupByLibrary.simpleMessage("Sort"),
    "source": MessageLookupByLibrary.simpleMessage("Source"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("Source IP"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("Special proxy"),
    "specialRules": MessageLookupByLibrary.simpleMessage("Special rules"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("Speed statistics"),
    "standard": MessageLookupByLibrary.simpleMessage("Standard"),
    "start": MessageLookupByLibrary.simpleMessage("Start"),
    "startVpn": MessageLookupByLibrary.simpleMessage("Starting VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "stop": MessageLookupByLibrary.simpleMessage("Stop"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("Stopping VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("Strategy"),
    "style": MessageLookupByLibrary.simpleMessage("Style"),
    "subRule": MessageLookupByLibrary.simpleMessage("Sub-rule"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage(
      "Subscription info",
    ),
    "suspended": MessageLookupByLibrary.simpleMessage("Suspended…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Switch profile"),
    "sync": MessageLookupByLibrary.simpleMessage("Sync"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "systemApp": MessageLookupByLibrary.simpleMessage("System apps"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("System proxy"),
    "tab": MessageLookupByLibrary.simpleMessage("Tab"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("Tab animation"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP concurrent"),
    "testUrl": MessageLookupByLibrary.simpleMessage("Test URL"),
    "textScale": MessageLookupByLibrary.simpleMessage("Text scaling"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeColor": MessageLookupByLibrary.simpleMessage("Theme color"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Theme mode"),
    "tight": MessageLookupByLibrary.simpleMessage("Tight"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "timeout": MessageLookupByLibrary.simpleMessage("Timeout"),
    "tip": MessageLookupByLibrary.simpleMessage("Tip"),
    "toggle": MessageLookupByLibrary.simpleMessage("Toggle"),
    "tolerance": MessageLookupByLibrary.simpleMessage("Tolerance"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("Tonal spot"),
    "tools": MessageLookupByLibrary.simpleMessage("Tools"),
    "torch": MessageLookupByLibrary.simpleMessage("Flashlight"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("Total traffic"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("TProxy port"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("Traffic usage"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage(
      "Only effective in administrator mode",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("Turn off"),
    "turnOn": MessageLookupByLibrary.simpleMessage("Turn on"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("Unified delay"),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage(
      "Unknown network error",
    ),
    "unmaximize": MessageLookupByLibrary.simpleMessage("Restore down"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("Unpin window"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "upload": MessageLookupByLibrary.simpleMessage("Upload"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage(
      "Obtain a profile from a URL",
    ),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("Use hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage("Use system hosts"),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("Used traffic"),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("Value"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("Vibrant"),
    "view": MessageLookupByLibrary.simpleMessage("View"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "VPN-related configuration change detected",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage(
      "Changes take effect after restarting the VPN",
    ),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("Whitelist mode"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("Write to system"),
    "yearsAgo": m45,
  };
}
