// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fa locale. All the
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
  String get localeName => 'fa';

  static String m0(count, skipped) =>
      "${count} مورد افزوده می‌شود؛ ${skipped} مورد موجود رد شد";

  static String m1(code) =>
      "سیاست Windows اجرای FastAICore.exe را مسدود کرد (خطای ${code}). از نصب‌کننده رسمی استفاده کنید یا از مدیر درخواست مجوز کنید.";

  static String m2(name) =>
      "برنامه دو بار پیاپی راه‌اندازی نشد. پیکربندی ${name} از انتخاب خارج و اتصال خودکار رد شد. از صفحه اصلی دوباره متصل شوید.";

  static String m3(url) => "پیکربندی از ${url} ایجاد شود؟";

  static String m4(count) => "${count} روز پیش";

  static String m5(label) => "${label} انتخاب‌شده حذف شود؟";

  static String m6(label) => "این ${label} حذف شود؟";

  static String m7(label) => "جزئیات ${label}";

  static String m8(label) => "${label} نباید خالی باشد";

  static String m9(label) => "${label} از قبل موجود است";

  static String m10(name) => "${name} به‌روز است";

  static String m11(name) => "${name} به‌روز شد";

  static String m12(count) => "${count} ساعت پیش";

  static String m13(count) => "${count} ساعت";

  static String m14(target) => "${target} یک سیاست نامعتبر است";

  static String m15(ruleSet) => "${ruleSet} مجموعه قوانین نامعتبر است";

  static String m16(subRule) => "${subRule} یک SUB_RULE نامعتبر است";

  static String m17(line, message) => "خط ${line}: ${message}";

  static String m18(label, max) => "${label} باید حداکثر ${max} نویسه باشد";

  static String m19(size) => "${size} آزاد شد";

  static String m20(count) => "${count} دقیقه پیش";

  static String m21(count) => "${count} ماه پیش";

  static String m22(code) =>
      "دسترسی رد شد (HTTP ${code}). پیوند ممکن است منقضی یا اطلاعات ورود نادرست باشد.";

  static String m23(code) => "سرور درخواست را رد کرد (HTTP ${code})";

  static String m24(code) =>
      "در این نشانی چیزی یافت نشد (HTTP ${code}). نشانی را بررسی کنید.";

  static String m25(detail) => "درخواست شبکه ناموفق بود: ${detail}";

  static String m26(code) =>
      "سرور با خطا مواجه شد (HTTP ${code}). بعداً تلاش کنید.";

  static String m27(label) => "هنوز ${label} وجود ندارد";

  static String m28(message) =>
      "هسته نمی‌تواند این پروکسی را پردازش کند: ${message}";

  static String m29(name) =>
      "نام ${name} توسط پروکسی یا گروه دیگری استفاده شده است";

  static String m30(path) => "گروه‌های پروکسی ارجاع حلقوی دارند: ${path}";

  static String m31(names) => "تأمین‌کنندگان پروکسی ناموجود: ${names}";

  static String m32(names) => "پروکسی‌ها یا سیاست‌های ناموجود: ${names}";

  static String m33(name) =>
      "${name} نام سیاست داخلی است و اینجا قابل استفاده نیست";

  static String m34(names) =>
      "گروه‌های پیکربندی به پروکسی‌هایی ارجاع می‌دهند که دیگر در فهرست سفارشی نیستند: ${names}";

  static String m35(label, profiles) =>
      "${label} هنوز در گروه‌ها یا قوانین سفارشی ${profiles} استفاده می‌شود. ابتدا ارجاع را حذف کنید.";

  static String m36(profiles, label) =>
      "اشتراک‌های ${profiles} از قبل ${label} دارند؛ برای جلوگیری از تغییر منبع نام دیگری انتخاب کنید.";

  static String m37(count) => "${count} گره";

  static String m38(count) => "${count} قانون";

  static String m39(appName) => "${appName} (حالت ایمن)";

  static String m40(count) => "${count} ثانیه";

  static String m41(count) => "${count} مورد انتخاب شد";

  static String m42(time) => "زمان بررسی: ${time}";

  static String m43(label) => "${label} باید یک مورد باشد";

  static String m44(label) => "${label} باید نشانی باشد";

  static String m45(count) => "${count} سال پیش";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("درباره"),
    "accessControl": MessageLookupByLibrary.simpleMessage(
      "برنامه‌های استفاده‌کننده از پروکسی",
    ),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "فقط برنامه‌های انتخاب‌شده از VPN استفاده می‌کنند",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "برنامه‌های مشمول یا مستثنا از VPN را انتخاب کنید",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "کنترل دسترسی برنامه‌ها غیرفعال است",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "برنامه‌های انتخاب‌شده از VPN مستثنا هستند",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage(
      "تنظیمات کنترل دسترسی",
    ),
    "account": MessageLookupByLibrary.simpleMessage("حساب"),
    "action": MessageLookupByLibrary.simpleMessage("عملیات"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("بررسی تأخیر همه"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("حالت مستقیم"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("حالت سراسری"),
    "actionMode": MessageLookupByLibrary.simpleMessage("تغییر حالت"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("پروکسی سیستم"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("حالت قانون"),
    "actionStart": MessageLookupByLibrary.simpleMessage("شروع/توقف"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage(
      "به‌روزرسانی پیکربندی‌ها",
    ),
    "actionView": MessageLookupByLibrary.simpleMessage("نمایش/پنهان"),
    "add": MessageLookupByLibrary.simpleMessage("افزودن"),
    "addProfile": MessageLookupByLibrary.simpleMessage("افزودن پیکربندی"),
    "addRule": MessageLookupByLibrary.simpleMessage("افزودن قانون"),
    "addedRules": MessageLookupByLibrary.simpleMessage("قوانین افزوده‌شده"),
    "address": MessageLookupByLibrary.simpleMessage("نشانی"),
    "agree": MessageLookupByLibrary.simpleMessage("موافقم"),
    "allowBypass": MessageLookupByLibrary.simpleMessage(
      "اجازه عبور برنامه‌ها از کنار VPN",
    ),
    "allowLan": MessageLookupByLibrary.simpleMessage("اجازه دسترسی شبکه محلی"),
    "answers": MessageLookupByLibrary.simpleMessage("پاسخ‌ها"),
    "app": MessageLookupByLibrary.simpleMessage("برنامه"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage(
      "کنترل دسترسی برنامه‌ها",
    ),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage("افزودن DNS سیستم"),
    "authentication": MessageLookupByLibrary.simpleMessage("احراز هویت"),
    "authorize": MessageLookupByLibrary.simpleMessage("دادن مجوز"),
    "authorized": MessageLookupByLibrary.simpleMessage("مجوز داده شد"),
    "auto": MessageLookupByLibrary.simpleMessage("خودکار"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage(
      "بررسی خودکار به‌روزرسانی",
    ),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("اجرای خودکار"),
    "autoRun": MessageLookupByLibrary.simpleMessage("اتصال خودکار هنگام شروع"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage(
      "تنظیم خودکار DNS سیستم",
    ),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("به‌روزرسانی خودکار"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage(
      "فاصله به‌روزرسانی خودکار (دقیقه)",
    ),
    "back": MessageLookupByLibrary.simpleMessage("بازگشت"),
    "backup": MessageLookupByLibrary.simpleMessage("پشتیبان‌گیری"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "نسخه پشتیبان مربوط به نسخه جدیدتر است. پیش از بازیابی، برنامه را به‌روز کنید.",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("اطلاعات پایه"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("افزودن گروهی"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "هر مورد در یک خط یا با ویرگول جدا شود",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "در هر خط: کلید، فاصله و سپس مقدار",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("رفتار"),
    "bind": MessageLookupByLibrary.simpleMessage("پیوند"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("حالت فهرست استثنا"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("مسدود کردن اتصال"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage(
      "دامنه‌های مستثنا از پروکسی",
    ),
    "cache": MessageLookupByLibrary.simpleMessage("حافظه نهان"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage(
      "الگوریتم حافظه نهان",
    ),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage(
      "حافظه نهان خراب است. پاک شود؟",
    ),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("اندازه حافظه نهان"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "برای اسکن QR در تنظیمات سیستم مجوز دوربین بدهید یا تصویر QR را از آلبوم انتخاب کنید.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "نیاز به مجوز دوربین",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage(
      "دوربین در دسترس نیست",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("لغو"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("لغو انتخاب همه"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "تعویض پروکسی ناموفق بود؛ انتخاب قبلی بازگردانده شد.",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage(
      "تغییرات ناسازگار",
    ),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("ویژگی‌های جدید"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("رفع اشکال"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("کارایی"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("بازگردانی"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage(
      "اعتبارسنجی گواهی TLS",
    ),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("بررسی به‌روزرسانی"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage(
      "برنامه به‌روز است",
    ),
    "clearSearch": MessageLookupByLibrary.simpleMessage("پاک کردن جستجو"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage(
      "خروجی به حافظه موقت",
    ),
    "clipboardImport": MessageLookupByLibrary.simpleMessage(
      "ورود از حافظه موقت",
    ),
    "close": MessageLookupByLibrary.simpleMessage("بستن"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("بستن اتصال‌ها"),
    "color": MessageLookupByLibrary.simpleMessage("رنگ"),
    "columns": MessageLookupByLibrary.simpleMessage("ستون‌ها"),
    "compatible": MessageLookupByLibrary.simpleMessage("حالت سازگاری"),
    "confirm": MessageLookupByLibrary.simpleMessage("تأیید"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage(
      "از پنجره فعلی خارج شوید؟",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("متصل"),
    "connecting": MessageLookupByLibrary.simpleMessage("در حال اتصال…"),
    "connection": MessageLookupByLibrary.simpleMessage("اتصال"),
    "connections": MessageLookupByLibrary.simpleMessage("اتصال‌ها"),
    "connectivity": MessageLookupByLibrary.simpleMessage("اتصال: "),
    "content": MessageLookupByLibrary.simpleMessage("محتوا"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("محتوا"),
    "copy": MessageLookupByLibrary.simpleMessage("کپی"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage("کپی متغیرهای محیطی"),
    "copyLink": MessageLookupByLibrary.simpleMessage("کپی پیوند"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("کپی شد"),
    "core": MessageLookupByLibrary.simpleMessage("هسته"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows Smart App Control فایل بدون امضای FastAICore.exe را مسدود کرد. از نصب‌کننده رسمی استفاده کنید یا با پشتیبانی تماس بگیرید.",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("وضعیت هسته"),
    "country": MessageLookupByLibrary.simpleMessage("منطقه"),
    "crashDetected": MessageLookupByLibrary.simpleMessage(
      "خطای راه‌اندازی شناسایی شد",
    ),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("تحلیل خرابی"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "با فعال‌سازی، هنگام خرابی برنامه گزارش‌های بدون اطلاعات حساس خودکار ارسال می‌شوند",
    ),
    "create": MessageLookupByLibrary.simpleMessage("ایجاد"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("زمان ایجاد"),
    "custom": MessageLookupByLibrary.simpleMessage("سفارشی"),
    "cut": MessageLookupByLibrary.simpleMessage("برش"),
    "dark": MessageLookupByLibrary.simpleMessage("تیره"),
    "dashboard": MessageLookupByLibrary.simpleMessage("نمای کلی"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "داده تغییر کرده است. ذخیره شود؟",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "برنامه برای بهبود پایداری از Firebase Crashlytics برای گردآوری اطلاعات دستگاه و خطا استفاده می‌کند. اطلاعات حساس شخصی شامل نمی‌شود و می‌توانید آن را در تنظیمات خاموش کنید.",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage(
      "اطلاعیه گردآوری داده",
    ),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "ذخیره تغییر ناموفق بود؛ تغییر بازگردانده شد.",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("پیش‌فرض"),
    "delay": MessageLookupByLibrary.simpleMessage("تأخیر"),
    "delayTest": MessageLookupByLibrary.simpleMessage("بررسی تأخیر"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "کارخواه پروکسی چندسکویی، ساده و آسان",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("مقصد"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("GeoIP مقصد"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("ASN نشانی مقصد"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage(
      "بر اساس API شخص ثالث؛ فقط جهت اطلاع",
    ),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("پروکسی شماره‌گیر"),
    "direct": MessageLookupByLibrary.simpleMessage("مستقیم"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("غیرفعال کردن UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("غیرفعال"),
    "disconnected": MessageLookupByLibrary.simpleMessage("قطع اتصال"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage(
      "نسخه جدید موجود است",
    ),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("هدایت DNS"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("حالت DNS"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("پرس‌وجوهای DNS"),
    "docked": MessageLookupByLibrary.simpleMessage("ثابت"),
    "domain": MessageLookupByLibrary.simpleMessage("دامنه"),
    "download": MessageLookupByLibrary.simpleMessage("بارگیری"),
    "edit": MessageLookupByLibrary.simpleMessage("ویرایش"),
    "editRule": MessageLookupByLibrary.simpleMessage("ویرایش قانون"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("فعال"),
    "entries": MessageLookupByLibrary.simpleMessage(" مورد"),
    "error": MessageLookupByLibrary.simpleMessage("خطا"),
    "exclude": MessageLookupByLibrary.simpleMessage(
      "پنهان کردن از برنامه‌های اخیر",
    ),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "هنگام اجرای پس‌زمینه، از فهرست برنامه‌های اخیر پنهان شود",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("نوع استثنا"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("خروج"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("خروج از تمام‌صفحه"),
    "expand": MessageLookupByLibrary.simpleMessage("استاندارد"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("وضعیت مورد انتظار"),
    "expireTime": MessageLookupByLibrary.simpleMessage("زمان انقضا"),
    "exportFile": MessageLookupByLibrary.simpleMessage("خروجی فایل"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("خروجی گزارش‌ها"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "خروجی با موفقیت انجام شد",
    ),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("بیانگر"),
    "externalController": MessageLookupByLibrary.simpleMessage(
      "کنترل‌کننده خارجی",
    ),
    "externalLink": MessageLookupByLibrary.simpleMessage("پیوند خارجی"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("بسیار بزرگ"),
    "fade": MessageLookupByLibrary.simpleMessage("محو شدن"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("فیلتر جایگزین"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "اطلاعات حساب تازه نشد. هنگام اتصال دوباره بررسی می‌شود.",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "نسخه جدید در پس‌زمینه بررسی می‌شود. بارگیری و نصب با اقدام شما انجام می‌شود.",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("انتخاب خودکار"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "پس‌زمینه و اعلان‌ها",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage("حساب غیرفعال شده"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "گواهی سرور تأیید نشد. ساعت سیستم را بررسی کنید یا با پشتیبانی تماس بگیرید.",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage("اتصال سیستم"),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("اتصال TCP"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("اتصال امن"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("انتخاب مسیر"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("پیکربندی برنامه"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI موقتاً در دسترس نیست. از وب‌سایت با پشتیبانی تماس بگیرید.",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "هر دو مسیر برای این مقصد ناموفق بودند. ممکن است مشکل مشترک شبکه یا محدودیت مقصد باشد؛ پیش از نتیجه‌گیری بررسی‌های لایه‌ای را ببینید.",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "در این بررسی هر دو مسیر به سرور آزمایشی دسترسی داشتند.",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("مقایسه اتصال"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "مسیر سیستم موفق و مسیر انتخاب‌شده ناموفق بود. ابتدا مسیر را بررسی کنید؛ علت هنوز مشخص نیست.",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "مسیر انتخاب‌شده موفق و مسیر سیستم ناموفق بود. DNS سیستم، مسیریابی و محدودیت‌های شبکه محلی را بررسی کنید.",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("اتصال"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("متصل"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("اتصال"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "اتصال ناموفق بود. دوباره تلاش یا مسیر دیگری انتخاب کنید.",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("کپی گزارش فنی"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage(
      "داده مستقل باقی‌مانده",
    ),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "داده مستقل جدا از سهمیه دوره است و با بازنشانی دوره پاک نمی‌شود. دسترسی و انقضا به حساب شما بستگی دارد.",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("مسیر فعلی"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "تنظیمات اتصال هنگام بررسی تغییر کرد. برای نتیجه فعلی دوباره بررسی کنید.",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "هسته یا فهرست مسیرها آماده نیست. مسیرها را تازه‌سازی کنید و دوباره متصل شوید.",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "متصل نیست. برای بررسی مسیر پروکسی ابتدا متصل شوید.",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("DNS سیستم"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "جستجوی DNS ناموفق بود یا مهلت آن پایان یافت. شبکه را بررسی کنید یا شبکه دیگری را امتحان کنید.",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "دامنه‌های آزمایشی عمومی با موفقیت ترجمه شدند.",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage(
      "مشکلات اتصال را پیدا کنید و مراحل رفع مشکل را دنبال کنید",
    ),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "پروکسی/PAC ویندوز با حالت انتخاب‌شده متفاوت است. برنامه‌های VPN یا پروکسی دیگر و تنظیمات ویندوز را بررسی و دوباره متصل شوید.",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "درگاه پروکسی محلی پاسخ نداد. اتصال را قطع و دوباره برقرار کنید، سپس مجدداً امتحان کنید.",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "درگاه محلی در دسترس است؛ مسیر راه دور هنوز تأیید نشده است.",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "تنظیمات پروکسی دستی و PAC ویندوز با حالت فعلی مطابقت دارند.",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("بررسی دوباره"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage(
      "مسیر انتخاب‌شده",
    ),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "مسیر انتخاب‌شده به سرور آزمایشی دسترسی نداشت. مسیر دیگری را امتحان کنید؛ اگر همه ناموفق بودند، DNS و شبکه محلی را بررسی کنید.",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "مسیر انتخاب‌شده به سرور آزمایشی HTTPS دسترسی داشت. نتیجه سرویس‌های دیگر ممکن است متفاوت باشد.",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage(
      "در حال بررسی اتصال…",
    ),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "در حالت امن رد شد؛ هسته پروکسی و تنظیمات سیستم استفاده نمی‌شوند.",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "هسته، مسیرها و مجوز اتصال آماده‌اند. همه تنظیمات سیستم بررسی نشده‌اند.",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "این بررسی برای وضعیت اتصال یا دستگاه فعلی کاربرد ندارد.",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "مجوز TUN آماده نیست. دوباره متصل شوید و مجوز بدهید یا پروکسی سیستم را انتخاب کنید.",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "این بررسی کامل نشد. دوباره امتحان کنید یا راهنمای زیر را دنبال کنید.",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "سرور آزمایشی تأیید نشد. این به‌تنهایی به معنی قطع کامل اینترنت نیست.",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "سرور آزمایشی عمومی پاسخ مورد انتظار را برگرداند.",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("قطع اتصال"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("متصل نیست"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage(
      "در حال قطع اتصال…",
    ),
    "fdEmail": MessageLookupByLibrary.simpleMessage("ایمیل"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "داده تمام شده است. تمدید کنید یا داده بخرید.",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("اشتراک منقضی شده"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("انقضای دوره"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("حالت سراسری"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage(
      "بررسی تمام شد؛ برخی موارد تأیید نشدند",
    ),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage(
      "برخی موارد نیاز به توجه دارند",
    ),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage(
      "بررسی‌های تکمیل‌شده موفق بودند",
    ),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "نتایج زیر را بررسی کنید. اصلاحات فقط با انتخاب شما اجرا می‌شوند.",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "مسیر را انتخاب کنید و با یک کلیک متصل شوید.",
    ),
    "fdHome": MessageLookupByLibrary.simpleMessage("خانه"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "پیکربندی سرور نامعتبر است. دوباره همگام‌سازی کنید یا با پشتیبانی تماس بگیرید.",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "ایمیل یا گذرواژه نادرست است",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage(
      "برنامه به‌روز است",
    ),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("پروکسی محلی"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · پیش از استفاده از این نشانی متصل شوید.",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("ورود"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("خروج از حساب"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("اتصال شبکه"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage(
      "عیب‌یابی شبکه",
    ),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "اتصال به سرویس ممکن نیست. شبکه را بررسی و دوباره تلاش کنید.",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage(
      "بازنشانی خودکار بعدی (زمان محلی)",
    ),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("بدون انقضای دوره"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage(
      "برای شروع طرحی انتخاب کنید",
    ),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "مسیری در دسترس نیست. حساب را در وب‌سایت بررسی کنید.",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage("وب‌سایت رسمی"),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("داده مصرف‌شده دوره"),
    "fdPlan": MessageLookupByLibrary.simpleMessage("طرح"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage(
      "اتصال اینترنت",
    ),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "درخواست‌ها بیش از حد است. بعداً تلاش کنید.",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "از همان نشانی HTTPS مسیر انتخاب‌شده، بدون تعیین پروکسی برنامه استفاده می‌شود. TUN یا مسیریابی سیستم می‌تواند مؤثر باشد؛ عبور نکردن از VPN تضمین نمی‌شود.",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("شناسه پیگیری"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("تازه‌سازی"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage(
      "ثبت‌نام یا بازنشانی گذرواژه در وب‌سایت",
    ),
    "fdRemaining": MessageLookupByLibrary.simpleMessage("داده دوره باقی‌مانده"),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage(
      "تازه‌سازی پیکربندی و اتصال",
    ),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "عملیات کامل نشد. نتایج جدید زیر را ببینید؛ در صورت نیاز وارد شوید و دسترسی حساب را بررسی کنید.",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "این کار ممکن است اتصال را قطع یا مسیر را تغییر دهد. پس از آن بررسی تکرار می‌شود. بازیابی مسیر حداکثر پنج مسیر جایگزین را آزمایش می‌کند.",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("اتصال دوباره"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage(
      "یافتن و انتخاب مسیر سالم",
    ),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "عملیات پایان یافت، اما بازیابی تأیید نشد. راهنمای باقی‌مانده زیر را دنبال کنید.",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "مسیر پروکسی تأیید شد. هشدارهای باقی‌مانده را در زیر بررسی کنید.",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage(
      "در حال اصلاح و بررسی اتصال…",
    ),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("کپی گزارش"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("معیار ارزیابی"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "هر دو دامنه باید ظرف ۸ ثانیه حداقل یک نشانی برگردانند. این بررسی مربوط به حل‌کننده سیستم است، نه نشت DNS یا سرور بالادستی تنظیم‌شده.",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "۱. Wi-Fi یا اترنت را بررسی و ورود به شبکه را کامل کنید.\n۲. شبکه دیگری را امتحان کنید تا مشکل DNS محلی مشخص شود.\n۳. اگر ادامه داشت، گزارش را برای پشتیبانی یا مدیر شبکه بفرستید.",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("مشکل یافت شد"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage(
      "داده‌ای اندازه‌گیری نشد.",
    ),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "این مورد به اصلاح نیاز ندارد. نتیجه مربوط به همین لحظه است و دسترسی به همه سرویس‌ها را تضمین نمی‌کند.",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "پارامترهای فنی (ms = میلی‌ثانیه)",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("موفق"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "اتصال TCP به درگاه loopback تنظیم‌شده باید ظرف ۸ ثانیه کامل شود. فرایند شنونده یا مسیر راه دور تأیید نمی‌شود.",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "۱. اتصال FastAI را قطع و دوباره برقرار کنید.\n۲. در صورت تکرار خطا، FastAI را دوباره اجرا کنید.\n۳. گزارش را برای پشتیبانی بفرستید؛ خطای درگاه به‌تنهایی اشغال آن توسط برنامه دیگر را ثابت نمی‌کند.",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "گزارش کپی‌شده شامل مقصدهای آزمایش و پاسخ‌های DNS است، اما حساب، توکن، نشانی اشتراک یا PAC را ندارد.",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "پروکسی دستی HTTP/HTTPS کاربر ویندوز باید با حالت انتخاب‌شده مطابقت داشته باشد؛ PAC فعال به‌عنوان تداخل احتمالی گزارش می‌شود. فایروال، WinHTTP و سیاست‌های سازمان بررسی نمی‌شوند.",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "۱. تنظیمات ویندوز ← شبکه و اینترنت ← پروکسی را بررسی کنید.\n۲. برنامه‌های پروکسی/VPN دیگر را ببندید و تنظیمات شخصی پروکسی یا PAC را بررسی کنید. تنظیمات سازمانی را حذف نکنید.\n۳. FastAI را دوباره متصل و بررسی کنید.",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("اقدام بعدی"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "مسیر انتخاب‌شده باید ظرف ۸ ثانیه و بدون خطای پروکسی، HTTP 204 برگرداند.",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "۱. مسیر دیگری را انتخاب و دوباره امتحان کنید.\n۲. اگر همه ناموفق بودند، نتیجه DNS و پروکسی محلی را بررسی کنید.\n۳. اگر فقط مقصد آزمایشی خطا داشت، سرویس موردنیاز را بررسی و گزارش را برای پشتیبانی ارسال کنید.",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "از نسخه عادی برنامه استفاده کنید، متصل شوید و دوباره بررسی کنید. بررسی درگاه دسکتاپ روی موبایل اجرا نمی‌شود.",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "۱. ورود به حساب و مجاز بودن اتصال را بررسی کنید.\n۲. مسیرها را تازه‌سازی و دوباره متصل شوید.\n۳. مجوز TUN را بدهید یا پروکسی سیستم را انتخاب کنید.",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("اجرا نشده"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("شروع بررسی"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("تأیید نشده"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "اعتبارسنجی گواهی فعال است. سرور آزمایشی باید ظرف ۸ ثانیه HTTP 204 برگرداند؛ تغییر مسیر دنبال نمی‌شود.",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "۱. تاریخ و ساعت سیستم را بررسی کنید.\n۲. ورود Wi-Fi را کامل و شبکه دیگری را امتحان کنید.\n۳. مقصد آزمایشی دیگر و مسیر پروکسی را مقایسه کنید. اعتبارسنجی گواهی را غیرفعال نکنید.",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "عملیات ناموفق بود. دوباره تلاش کنید.",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "مهلت درخواست تمام شد. شبکه را بررسی و دوباره تلاش کنید.",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage("این فیلد الزامی است"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "یک نوبت برای پاک کردن مصرف دوره استفاده شود؟ داده مستقل، طرح و انقضا تغییر نمی‌کنند.",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage(
      "دفعات بازنشانی موجود",
    ),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage(
      "مصرف دوره‌ای برای بازنشانی وجود ندارد.",
    ),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "یک نوبت بازنشانی مصرف شده و مصرف دوره پاک می‌شود. داده مستقل و انقضای اشتراک تغییر نمی‌کند.",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "اشتراک معتبر دارای داده دوره لازم است.",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "نوبت بازنشانی موجود نیست.",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "داده دوره بازنشانی و اطلاعات حساب تازه شد.",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage(
      "بازنشانی داده دوره",
    ),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "دفعات بازنشانی بررسی نشد. اطلاعات حساب را تازه و دوباره تلاش کنید.",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage(
      "بررسی نتیجه بازنشانی",
    ),
    "fdRouteChecking": MessageLookupByLibrary.simpleMessage("در حال بررسی…"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("بررسی ناموفق"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage(
      "آخرین اندازه‌گیری",
    ),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("تأخیر کم"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("تأخیر بیشتر"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("بررسی نشده"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "نشست منقضی شده است. دوباره وارد شوید.",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("طرح‌ها"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("حالت هوشمند"),
    "fdSync": MessageLookupByLibrary.simpleMessage("تازه‌سازی مسیرها"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "تازه‌سازی مسیرها ممکن نیست. پیش از اتصال دوباره تلاش کنید.",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage(
      "در حال همگام‌سازی مسیرها…",
    ),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "اتصال به سرور آزمایشی عمومی باید ظرف ۸ ثانیه انجام شود. زمان DNS نیز محاسبه می‌شود.",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "اتصال TCP ناموفق بود. DNS، دسترسی شبکه و فیلترها را بررسی کنید؛ این به‌تنهایی مشکل فایروال را ثابت نمی‌کند.",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "سرور آزمایشی اتصال TCP را پذیرفت.",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "۱. ابتدا نتیجه DNS را بررسی کنید.\n۲. شبکه دیگری را امتحان یا ورود شبکه را کامل کنید.\n۳. قواعد فایروال/VPN را با مدیر شبکه بررسی کنید؛ فایروال را به‌طور کلی غیرفعال نکنید.",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "TLS با مخزن اعتماد سیستم باید ظرف ۸ ثانیه کامل شود؛ شامل زمان DNS و TCP. تاریخ اعتبار گواهی در صورت دسترسی ثبت می‌شود.",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS کامل نشد. ساعت، رهگیری شبکه و اعتماد گواهی را بررسی کنید و اعتبارسنجی را غیرفعال نکنید.",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "دست‌دهی TLS و اعتبارسنجی گواهی موفق بود.",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "برای ادامه اتصال به‌روزرسانی لازم است",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage(
      "استفاده از یک بازنشانی",
    ),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "ایمیل و گذرواژه را بررسی یا تأیید را در وب‌سایت تکمیل کنید.",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("مدیریت در وب‌سایت"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "تمدید، سفارش‌ها، تنظیمات حساب و پشتیبانی در وب‌سایت در دسترس است.",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage(
      "برای اتصال و انتخاب مکان وارد شوید",
    ),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("وفادار به رنگ"),
    "file": MessageLookupByLibrary.simpleMessage("فایل"),
    "fileDesc": MessageLookupByLibrary.simpleMessage(
      "بارگذاری مستقیم فایل پیکربندی",
    ),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage(
      "فایل تغییر کرده است. تغییرات ذخیره شود؟",
    ),
    "filter": MessageLookupByLibrary.simpleMessage("فیلتر"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("یافتن فرایند"),
    "floating": MessageLookupByLibrary.simpleMessage("شناور"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("قلم"),
    "fontSize": MessageLookupByLibrary.simpleMessage("اندازه"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "هسته به‌اجبار راه‌اندازی مجدد شود؟",
    ),
    "format": MessageLookupByLibrary.simpleMessage("قالب"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("سالاد میوه"),
    "general": MessageLookupByLibrary.simpleMessage("عمومی"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("به‌روزرسانی خودکار"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage("حالت کم‌حافظه Geo"),
    "global": MessageLookupByLibrary.simpleMessage("سراسری"),
    "go": MessageLookupByLibrary.simpleMessage("رفتن"),
    "goDownload": MessageLookupByLibrary.simpleMessage("بارگیری"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "سرویس کمکی در دسترس نیست و TUN فعال نمی‌شود. FastAI را دوباره نصب کنید.",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("پنهان کردن IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage(
      "پنهان کردن گره‌های بی‌پاسخ",
    ),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "گره‌هایی که آخرین بررسی تأخیرشان بی‌پاسخ مانده پنهان می‌شوند",
    ),
    "host": MessageLookupByLibrary.simpleMessage("میزبان"),
    "hours": MessageLookupByLibrary.simpleMessage("ساعت"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("نماد"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("سوابق نماد"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("سبک نماد"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("نشانی نماد"),
    "import": MessageLookupByLibrary.simpleMessage("ورود"),
    "importFile": MessageLookupByLibrary.simpleMessage("ورود از فایل"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("ورود از نشانی"),
    "inbound": MessageLookupByLibrary.simpleMessage("ورودی"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage(
      "شامل همه پروکسی‌ها",
    ),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("بدون انقضا"),
    "init": MessageLookupByLibrary.simpleMessage("راه‌اندازی"),
    "initiator": MessageLookupByLibrary.simpleMessage("آغازکننده"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "مجوز فهرست برنامه‌ها رد شد. آن را در تنظیمات سیستم فعال کنید.",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "سیستم تا زمان دریافت مجوز فهرست برنامه‌ها را پنهان می‌کند. برای تنظیم پروکسی هر برنامه مجوز بدهید.",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "نیاز به مجوز فهرست برنامه‌ها",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage(
      "انتخاب هوشمند",
    ),
    "interfaceName": MessageLookupByLibrary.simpleMessage("نام رابط"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage("رابط خروجی"),
    "internet": MessageLookupByLibrary.simpleMessage("اینترنت"),
    "interval": MessageLookupByLibrary.simpleMessage("فاصله"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("IP داخلی"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage(
      "فایل پشتیبان نامعتبر",
    ),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "نشان DSCP نباید بیش از 63 باشد",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "فقط tcp یا udp پشتیبانی می‌شود",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "این کد QR پیوند پیکربندی ندارد",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "عدد یا بازه مانند 80 یا 8000-9000 را با / جدا کنید",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("نشانی IP"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("سابقه سوءاستفاده"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("پروکسی"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("نشان‌ها"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("سازمان"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage("نوع IP مشخص نشد"),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("خوب"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("سطح"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("عادی"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("بررسی دوباره"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("پرخطر"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("پاسخ از"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("منابع"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage(
      "IP خروجی متفاوت",
    ),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("بدون نوع"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage(
      "محدودیت درخواست",
    ),
    "ipType": MessageLookupByLibrary.simpleMessage("نوع"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("تجاری"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("مرکز داده"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("شبکه همراه"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("خانگی"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage(
      "مهلت IPv6 (میلی‌ثانیه)",
    ),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("همین حالا"),
    "key": MessageLookupByLibrary.simpleMessage("کلید"),
    "language": MessageLookupByLibrary.simpleMessage("زبان"),
    "large": MessageLookupByLibrary.simpleMessage("بزرگ"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("آخرین به‌روزرسانی"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage(
      "راه‌اندازی کامل نشد",
    ),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "برنامه هنگام راه‌اندازی قبلی ناگهان بسته شد. اتصال خودکار انجام نشد؛ دستی دوباره متصل شوید.",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("چیدمان"),
    "light": MessageLookupByLibrary.simpleMessage("روشن"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("شکستن خط"),
    "list": MessageLookupByLibrary.simpleMessage("فهرست"),
    "listen": MessageLookupByLibrary.simpleMessage("گوش دادن"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage(
      "نشان مسیریابی ورودی",
    ),
    "liveConnections": MessageLookupByLibrary.simpleMessage("اتصال‌های فعال"),
    "loading": MessageLookupByLibrary.simpleMessage("در حال بارگذاری…"),
    "local": MessageLookupByLibrary.simpleMessage("محلی"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "دسترسی شبکه محلی رد شد؛ با استفاده از gvisor، شبکه محلی در دسترس نیست.",
    ),
    "log": MessageLookupByLibrary.simpleMessage("گزارش"),
    "logLevel": MessageLookupByLibrary.simpleMessage("سطح گزارش"),
    "logs": MessageLookupByLibrary.simpleMessage("گزارش‌ها"),
    "loopback": MessageLookupByLibrary.simpleMessage("استثنای حلقه برگشتی UWP"),
    "loose": MessageLookupByLibrary.simpleMessage("باز"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("حداکثر تعداد خطا"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("بزرگ کردن"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage("حافظه مقیم"),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage(
      "برنامه و حافظه مشترک",
    ),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("هیپ آزاد"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage(
      "هیپ در حال استفاده",
    ),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "هسته در حال اجرا نیست",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage(
      "سربار زمان اجرا",
    ),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("پشته‌های گوروتین"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "برآورد بر اساس حافظه مقیم فرایند است و ممکن است با گزارش سیستم متفاوت باشد.",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "هسته در فرایند برنامه اجرا می‌شود. سهم آن از آمار زمان اجرا برآورد شده و باقی به برنامه و حافظه مشترک اختصاص می‌یابد.",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("اطلاعات حافظه"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("حافظه آزاد شد"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("حداقلی"),
    "minimize": MessageLookupByLibrary.simpleMessage("کوچک کردن"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage(
      "ادامه اجرا پس از بستن پنجره",
    ),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("درگاه ترکیبی"),
    "mode": MessageLookupByLibrary.simpleMessage("حالت"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("تک‌رنگ"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("بیشتر"),
    "name": MessageLookupByLibrary.simpleMessage("نام"),
    "network": MessageLookupByLibrary.simpleMessage("شبکه"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "درخواست لغو شد",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "اتصال به سرور ممکن نیست. شبکه یا تنظیمات پروکسی را بررسی کنید.",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("بررسی شبکه"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "نشانی سرور قابل تفکیک نیست. نشانی و DNS را بررسی کنید.",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "درخواست‌ها بیش از حد است (HTTP 429). کمی صبر و دوباره تلاش کنید.",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("سرعت شبکه"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "مهلت درخواست تمام شد. شبکه یا پروکسی را بررسی و دوباره تلاش کنید.",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "اتصال امن ناموفق بود. گواهی ممکن است نامعتبر باشد یا اتصال رهگیری شده باشد.",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("نوع شبکه"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("خنثی"),
    "no": MessageLookupByLibrary.simpleMessage("خیر"),
    "noData": MessageLookupByLibrary.simpleMessage("داده‌ای نیست"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("دیگر یادآوری نشود"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("بدون شبکه"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage(
      "برنامه‌های بدون شبکه",
    ),
    "noResolve": MessageLookupByLibrary.simpleMessage("بدون تفکیک IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "نتیجه‌ای یافت نشد",
    ),
    "none": MessageLookupByLibrary.simpleMessage("هیچ‌کدام"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "گروه پروکسی فعلی قابل انتخاب نیست",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "برای شروع یک پیکربندی اضافه کنید",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage(
      "فقط شمارش ترافیک پروکسی",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("اختیاری"),
    "options": MessageLookupByLibrary.simpleMessage("گزینه‌ها"),
    "other": MessageLookupByLibrary.simpleMessage("سایر"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("IP خروجی"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("حالت اتصال"),
    "override": MessageLookupByLibrary.simpleMessage("بازنویسی"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("بازنویسی DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("حالت بازنویسی"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("بازنویسی NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage(
      "نام خالی است",
    ),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "پروکسی یا تأمین‌کننده‌ای انتخاب نشده و هسته این گروه را رد می‌کند",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("سفارشی"),
    "palette": MessageLookupByLibrary.simpleMessage("پالت"),
    "password": MessageLookupByLibrary.simpleMessage("گذرواژه"),
    "paste": MessageLookupByLibrary.simpleMessage("چسباندن"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("انتخاب از آلبوم"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("سنجاق کردن پنجره"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "لطفاً کد QR معتبر بارگذاری کنید",
    ),
    "port": MessageLookupByLibrary.simpleMessage("درگاه"),
    "preview": MessageLookupByLibrary.simpleMessage("پیش‌نمایش"),
    "process": MessageLookupByLibrary.simpleMessage("فرایند"),
    "profile": MessageLookupByLibrary.simpleMessage("پیکربندی"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("فاصله معتبر وارد کنید"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("فاصله به‌روزرسانی را وارد کنید"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "پیکربندی تغییر کرده است. به‌روزرسانی خودکار خاموش شود؟",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "نام پیکربندی را وارد کنید",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "نشانی معتبر پیکربندی را وارد کنید",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "نشانی پیکربندی را وارد کنید",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("پیکربندی‌ها"),
    "profilesSort": MessageLookupByLibrary.simpleMessage(
      "مرتب‌سازی پیکربندی‌ها",
    ),
    "project": MessageLookupByLibrary.simpleMessage("پروژه"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage(
      "اشتراک",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("منابع خارجی"),
    "proxies": MessageLookupByLibrary.simpleMessage("پروکسی‌ها"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("زنجیره پروکسی"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("گروه پروکسی"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("گره پروکسی"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage(
      "تأمین‌کنندگان پروکسی",
    ),
    "pureBlack": MessageLookupByLibrary.simpleMessage("سیاه خالص"),
    "qrcode": MessageLookupByLibrary.simpleMessage("کد QR"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage(
      "دریافت پیکربندی با اسکن کد QR",
    ),
    "quickAdd": MessageLookupByLibrary.simpleMessage("افزودن سریع"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("رنگین‌کمان"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("درخواست‌های اخیر"),
    "redirPort": MessageLookupByLibrary.simpleMessage("درگاه Redir"),
    "redo": MessageLookupByLibrary.simpleMessage("ازنو"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("آزادسازی حافظه"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage(
      "آزادسازی حافظه ناموفق بود",
    ),
    "remote": MessageLookupByLibrary.simpleMessage("راه دور"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("مقصد راه دور"),
    "remove": MessageLookupByLibrary.simpleMessage("حذف"),
    "replace": MessageLookupByLibrary.simpleMessage("جایگزینی"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("جایگزینی همه"),
    "request": MessageLookupByLibrary.simpleMessage("درخواست"),
    "requests": MessageLookupByLibrary.simpleMessage("درخواست‌ها"),
    "reset": MessageLookupByLibrary.simpleMessage("بازنشانی"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "این صفحه تغییر کرده است. بازنشانی شود؟",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("منابع"),
    "respectRules": MessageLookupByLibrary.simpleMessage("رعایت قوانین"),
    "restart": MessageLookupByLibrary.simpleMessage("راه‌اندازی مجدد"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage(
      "هسته راه‌اندازی مجدد شود؟",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("بازیابی"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("روش بازیابی"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage("سازگار"),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("بازنویسی"),
    "retry": MessageLookupByLibrary.simpleMessage("تلاش دوباره"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("نشانی‌های مسیریابی"),
    "routeMode": MessageLookupByLibrary.simpleMessage("حالت مسیریابی"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage(
      "عبور مستقیم نشانی‌های خصوصی",
    ),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage(
      "استفاده از پیکربندی",
    ),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("قانون"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage(
      "قانون منطقی AND",
    ),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق دامنه کامل",
    ),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق کلیدواژه دامنه",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق عبارت منظم دامنه",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق پسوند دامنه",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نویسه عام؛ فقط * و ? پشتیبانی می‌شود",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نشان DSCP (فقط ورودی tproxy UDP)",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه درگاه مقصد",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق کد کشور IP",
    ),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق دامنه‌های Geosite",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نام ورودی",
    ),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق درگاه ورودی",
    ),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نوع ورودی",
    ),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نام کاربر ورودی؛ چند نام را با / جدا کنید",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق ASN نشانی IP",
    ),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه IP؛ IP-CIDR6 نام مستعار است",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه نشانی IP",
    ),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه پسوند IP",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق همه درخواست‌ها بدون شرط",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق TCP یا UDP",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage(
      "قانون منطقی NOT",
    ),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("قانون منطقی OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نام فرایند؛ در Android نام بسته",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق عبارت منظم نام فرایند؛ نام بسته در Android",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نویسه عام نام فرایند؛ فقط * و ?",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق مسیر کامل فرایند",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق عبارت منظم مسیر فرایند",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نویسه عام مسیر فرایند؛ فقط * و ?",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق نام تطبیق مجدد؛ نام‌ها را با / جدا کنید",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "ارجاع به مجموعه قوانین؛ نیازمند rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق کد کشور IP مبدأ",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق ASN نشانی مبدأ",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه IP مبدأ",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه پسوند IP مبدأ",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق بازه درگاه مبدأ",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق با زیرقانون؛ به پرانتزها توجه کنید",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "تطبیق شناسه کاربر Linux",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("نام قانون"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "اتصال مستقیم BitTorrent",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "مسدود کردن DNS روی TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage(
      "مسدود کردن QUIC",
    ),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage(
      "مسدود کردن STUN",
    ),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage(
      "اتصال مستقیم شبکه محلی",
    ),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "اتصال مستقیم Apple و Microsoft",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage(
      "تأمین‌کنندگان قانون",
    ),
    "ruleSet": MessageLookupByLibrary.simpleMessage("مجموعه قوانین"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("مقصد قانون"),
    "rules": MessageLookupByLibrary.simpleMessage("قوانین"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("مدت اجرا"),
    "safeMode": MessageLookupByLibrary.simpleMessage("حالت ایمن"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("ذخیره"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("تغییرات ذخیره شود؟"),
    "script": MessageLookupByLibrary.simpleMessage("اسکریپت"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage(
      "رفتن به مورد انتخاب‌شده",
    ),
    "search": MessageLookupByLibrary.simpleMessage("جستجو"),
    "seconds": MessageLookupByLibrary.simpleMessage("ثانیه"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("انتخاب همه"),
    "selected": MessageLookupByLibrary.simpleMessage("انتخاب‌شده"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("سرور"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("در دسترس"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("مسدود شده"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("بررسی"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("بررسی همه"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("به‌زودی"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage(
      "ارائه‌دهنده اینترنت مجاز نیست",
    ),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("بررسی ناموفق"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("مدیریت سرویس‌ها"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage(
      "فقط محتوای اصلی",
    ),
    "servicePending": MessageLookupByLibrary.simpleMessage("بررسی نشده"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage("دسترسی محدود"),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("وضعیت سرویس"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("در دسترس نیست"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage(
      "منطقه پشتیبانی نمی‌شود",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("تنظیمات"),
    "show": MessageLookupByLibrary.simpleMessage("نمایش"),
    "showLess": MessageLookupByLibrary.simpleMessage("جمع کردن"),
    "showMore": MessageLookupByLibrary.simpleMessage("باز کردن"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "دکمه توقف در اعلان",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("فشرده"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("تاری نوار کناری"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage(
      "شروع به‌صورت کوچک‌شده",
    ),
    "singleAdd": MessageLookupByLibrary.simpleMessage("افزودن تکی"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("اندازه"),
    "slide": MessageLookupByLibrary.simpleMessage("لغزش"),
    "socksPort": MessageLookupByLibrary.simpleMessage("درگاه SOCKS"),
    "sort": MessageLookupByLibrary.simpleMessage("مرتب‌سازی"),
    "source": MessageLookupByLibrary.simpleMessage("منبع"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("IP مبدأ"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("پروکسی ویژه"),
    "specialRules": MessageLookupByLibrary.simpleMessage("قوانین ویژه"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("آمار سرعت"),
    "standard": MessageLookupByLibrary.simpleMessage("استاندارد"),
    "start": MessageLookupByLibrary.simpleMessage("شروع"),
    "startVpn": MessageLookupByLibrary.simpleMessage("در حال شروع VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("وضعیت"),
    "stop": MessageLookupByLibrary.simpleMessage("توقف"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("در حال توقف VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("راهبرد"),
    "style": MessageLookupByLibrary.simpleMessage("سبک"),
    "subRule": MessageLookupByLibrary.simpleMessage("زیرقانون"),
    "submit": MessageLookupByLibrary.simpleMessage("ارسال"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage("اطلاعات اشتراک"),
    "suspended": MessageLookupByLibrary.simpleMessage("معلق…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("تغییر پیکربندی"),
    "sync": MessageLookupByLibrary.simpleMessage("همگام‌سازی"),
    "system": MessageLookupByLibrary.simpleMessage("سیستم"),
    "systemApp": MessageLookupByLibrary.simpleMessage("برنامه‌های سیستم"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("پروکسی سیستم"),
    "tab": MessageLookupByLibrary.simpleMessage("زبانه"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("پویانمایی زبانه"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("اتصال هم‌زمان TCP"),
    "testUrl": MessageLookupByLibrary.simpleMessage("نشانی بررسی"),
    "textScale": MessageLookupByLibrary.simpleMessage("اندازه متن"),
    "theme": MessageLookupByLibrary.simpleMessage("پوسته"),
    "themeColor": MessageLookupByLibrary.simpleMessage("رنگ پوسته"),
    "themeMode": MessageLookupByLibrary.simpleMessage("حالت پوسته"),
    "tight": MessageLookupByLibrary.simpleMessage("فشرده"),
    "time": MessageLookupByLibrary.simpleMessage("زمان"),
    "timeout": MessageLookupByLibrary.simpleMessage("پایان مهلت"),
    "tip": MessageLookupByLibrary.simpleMessage("راهنما"),
    "toggle": MessageLookupByLibrary.simpleMessage("تغییر"),
    "tolerance": MessageLookupByLibrary.simpleMessage("آستانه تحمل"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("تأکید رنگی"),
    "tools": MessageLookupByLibrary.simpleMessage("ابزارها"),
    "torch": MessageLookupByLibrary.simpleMessage("چراغ‌قوه"),
    "total": MessageLookupByLibrary.simpleMessage("مجموع"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("کل داده"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("درگاه TProxy"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("مصرف داده"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage(
      "فقط با دسترسی مدیر کار می‌کند",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("خاموش کردن"),
    "turnOn": MessageLookupByLibrary.simpleMessage("روشن کردن"),
    "undo": MessageLookupByLibrary.simpleMessage("واگرد"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("تأخیر یکپارچه"),
    "unknown": MessageLookupByLibrary.simpleMessage("نامشخص"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage(
      "خطای نامشخص شبکه",
    ),
    "unmaximize": MessageLookupByLibrary.simpleMessage("بازگرداندن اندازه"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("برداشتن سنجاق پنجره"),
    "update": MessageLookupByLibrary.simpleMessage("به‌روزرسانی"),
    "upload": MessageLookupByLibrary.simpleMessage("بارگذاری"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("دریافت پیکربندی از نشانی"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("استفاده از hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage(
      "استفاده از hosts سیستم",
    ),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("داده مصرف‌شده"),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("مقدار"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("زنده"),
    "view": MessageLookupByLibrary.simpleMessage("مشاهده"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "تغییر تنظیمات VPN شناسایی شد",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage(
      "تغییرات پس از راه‌اندازی مجدد VPN اعمال می‌شوند",
    ),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("حالت فهرست مجاز"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("نوشتن در سیستم"),
    "yearsAgo": m45,
  };
}
