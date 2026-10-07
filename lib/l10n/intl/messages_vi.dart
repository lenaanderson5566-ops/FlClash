// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(count, skipped) =>
      "Sẽ thêm ${count}, bỏ qua ${skipped} mục đã có";

  static String m1(code) =>
      "Chính sách Windows đã chặn FastAICore.exe (lỗi ${code}). Dùng bộ cài chính thức hoặc nhờ quản trị viên cấp phép.";

  static String m2(name) =>
      "Ứng dụng không khởi động được hai lần liên tiếp. Cấu hình ${name} đã được bỏ chọn và kết nối tự động đã bỏ qua. Hãy kết nối lại từ trang chủ.";

  static String m3(url) => "Tạo cấu hình từ ${url}?";

  static String m4(count) => "${count} ngày trước";

  static String m5(label) => "Xóa ${label} đã chọn?";

  static String m6(label) => "Xóa ${label} này?";

  static String m7(label) => "Chi tiết ${label}";

  static String m8(label) => "${label} không được để trống";

  static String m9(label) => "${label} đã tồn tại";

  static String m10(name) => "${name} đã được cập nhật";

  static String m11(name) => "Đã cập nhật ${name}";

  static String m12(count) => "${count} giờ trước";

  static String m13(count) => "${count} giờ";

  static String m14(target) => "${target} là chính sách không hợp lệ";

  static String m15(ruleSet) => "${ruleSet} là bộ quy tắc không hợp lệ";

  static String m16(subRule) => "${subRule} là SUB_RULE không hợp lệ";

  static String m17(line, message) => "Dòng ${line}: ${message}";

  static String m18(label, max) => "${label} tối đa ${max} ký tự";

  static String m19(size) => "Đã giải phóng ${size}";

  static String m20(count) => "${count} phút trước";

  static String m21(count) => "${count} tháng trước";

  static String m22(code) =>
      "Máy chủ từ chối truy cập (HTTP ${code}). Liên kết có thể đã hết hạn hoặc thông tin xác thực sai.";

  static String m23(code) => "Máy chủ từ chối yêu cầu (HTTP ${code})";

  static String m24(code) =>
      "Không tìm thấy tại địa chỉ này (HTTP ${code}). Kiểm tra URL.";

  static String m25(detail) => "Yêu cầu mạng thất bại: ${detail}";

  static String m26(code) => "Máy chủ gặp lỗi (HTTP ${code}). Thử lại sau.";

  static String m27(label) => "Chưa có ${label}";

  static String m28(message) => "Lõi không thể đọc proxy này: ${message}";

  static String m29(name) => "${name} đã được proxy hoặc nhóm khác sử dụng";

  static String m30(path) => "Nhóm proxy tham chiếu vòng lặp: ${path}";

  static String m31(names) => "Nguồn proxy không tồn tại: ${names}";

  static String m32(names) => "Proxy hoặc chính sách không tồn tại: ${names}";

  static String m33(name) =>
      "${name} là tên chính sách tích hợp, không thể dùng ở đây";

  static String m34(names) =>
      "Nhóm trong cấu hình tham chiếu proxy không còn trong danh sách tùy chỉnh: ${names}";

  static String m35(label, profiles) =>
      "${label} vẫn được nhóm hoặc quy tắc tùy chỉnh của ${profiles} sử dụng. Hãy gỡ tham chiếu trước.";

  static String m36(profiles, label) =>
      "Đăng ký của ${profiles} đã có ${label}; hãy chọn tên khác để tránh đổi nguồn.";

  static String m37(count) => "${count} nút";

  static String m38(count) => "${count} quy tắc";

  static String m39(appName) => "${appName} (Chế độ an toàn)";

  static String m40(count) => "${count} giây";

  static String m41(count) => "Đã chọn ${count}";

  static String m42(time) => "Kiểm tra lúc ${time}";

  static String m43(label) => "${label} phải là một mục duy nhất";

  static String m44(label) => "${label} phải là URL";

  static String m45(count) => "${count} năm trước";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Giới thiệu"),
    "accessControl": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng dùng proxy",
    ),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Chỉ ứng dụng đã chọn dùng VPN",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "Chọn ứng dụng dùng hoặc không dùng VPN",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "Kiểm soát ứng dụng đã tắt",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng đã chọn không dùng VPN",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage(
      "Cài đặt kiểm soát truy cập",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Tài khoản"),
    "action": MessageLookupByLibrary.simpleMessage("Thao tác"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra mọi độ trễ",
    ),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage(
      "Chế độ trực tiếp",
    ),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("Chế độ toàn cục"),
    "actionMode": MessageLookupByLibrary.simpleMessage("Đổi chế độ"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("Proxy hệ thống"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("Chế độ quy tắc"),
    "actionStart": MessageLookupByLibrary.simpleMessage("Bắt đầu/Dừng"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage(
      "Cập nhật cấu hình",
    ),
    "actionView": MessageLookupByLibrary.simpleMessage("Hiện/Ẩn"),
    "add": MessageLookupByLibrary.simpleMessage("Thêm"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Thêm cấu hình"),
    "addRule": MessageLookupByLibrary.simpleMessage("Thêm quy tắc"),
    "addedRules": MessageLookupByLibrary.simpleMessage("Quy tắc đã thêm"),
    "address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
    "agree": MessageLookupByLibrary.simpleMessage("Đồng ý"),
    "allowBypass": MessageLookupByLibrary.simpleMessage(
      "Cho phép ứng dụng bỏ qua VPN",
    ),
    "allowLan": MessageLookupByLibrary.simpleMessage("Cho phép mạng LAN"),
    "answers": MessageLookupByLibrary.simpleMessage("Câu trả lời"),
    "app": MessageLookupByLibrary.simpleMessage("Ứng dụng"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage(
      "Kiểm soát ứng dụng",
    ),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage(
      "Thêm DNS hệ thống",
    ),
    "authentication": MessageLookupByLibrary.simpleMessage("Xác thực"),
    "authorize": MessageLookupByLibrary.simpleMessage("Cấp quyền"),
    "authorized": MessageLookupByLibrary.simpleMessage("Đã cấp quyền"),
    "auto": MessageLookupByLibrary.simpleMessage("Tự động"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage(
      "Tự động kiểm tra cập nhật",
    ),
    "autoLaunch": MessageLookupByLibrary.simpleMessage(
      "Khởi động cùng hệ thống",
    ),
    "autoRun": MessageLookupByLibrary.simpleMessage(
      "Tự động kết nối khi khởi động",
    ),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage(
      "Tự động đặt DNS hệ thống",
    ),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("Tự động cập nhật"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage(
      "Chu kỳ tự động cập nhật (phút)",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Quay lại"),
    "backup": MessageLookupByLibrary.simpleMessage("Sao lưu"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "Bản sao lưu được tạo từ phiên bản mới hơn. Cập nhật ứng dụng trước khi khôi phục.",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("Thông tin cơ bản"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("Thêm hàng loạt"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "Mỗi dòng một mục hoặc ngăn cách bằng dấu phẩy",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "Mỗi dòng: khóa, dấu cách, rồi giá trị",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("Hành vi"),
    "bind": MessageLookupByLibrary.simpleMessage("Liên kết"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage(
      "Chế độ danh sách loại trừ",
    ),
    "blockConnection": MessageLookupByLibrary.simpleMessage("Chặn kết nối"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage(
      "Tên miền bỏ qua proxy",
    ),
    "cache": MessageLookupByLibrary.simpleMessage("Bộ nhớ đệm"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage(
      "Thuật toán bộ nhớ đệm",
    ),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage(
      "Bộ nhớ đệm bị hỏng. Xóa bộ nhớ đệm?",
    ),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage(
      "Kích thước bộ nhớ đệm",
    ),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "Cho phép máy ảnh trong cài đặt để quét QR hoặc chọn ảnh QR từ thư viện.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Cần quyền máy ảnh",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage(
      "Máy ảnh không khả dụng",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("Bỏ chọn tất cả"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "Không thể đổi proxy; đã khôi phục lựa chọn trước.",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage(
      "Thay đổi không tương thích",
    ),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("Tính năng mới"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("Sửa lỗi"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("Hiệu năng"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("Hoàn nguyên"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage(
      "Xác minh chứng chỉ TLS",
    ),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("Kiểm tra cập nhật"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng đã được cập nhật",
    ),
    "clearSearch": MessageLookupByLibrary.simpleMessage("Xóa tìm kiếm"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage(
      "Xuất vào bộ nhớ tạm",
    ),
    "clipboardImport": MessageLookupByLibrary.simpleMessage(
      "Nhập từ bộ nhớ tạm",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("Đóng kết nối"),
    "color": MessageLookupByLibrary.simpleMessage("Màu"),
    "columns": MessageLookupByLibrary.simpleMessage("Cột"),
    "compatible": MessageLookupByLibrary.simpleMessage("Chế độ tương thích"),
    "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage(
      "Thoát cửa sổ hiện tại?",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("Đã kết nối"),
    "connecting": MessageLookupByLibrary.simpleMessage("Đang kết nối…"),
    "connection": MessageLookupByLibrary.simpleMessage("Kết nối"),
    "connections": MessageLookupByLibrary.simpleMessage("Kết nối"),
    "connectivity": MessageLookupByLibrary.simpleMessage("Kết nối: "),
    "content": MessageLookupByLibrary.simpleMessage("Nội dung"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("Nội dung"),
    "copy": MessageLookupByLibrary.simpleMessage("Sao chép"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage(
      "Sao chép biến môi trường",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Sao chép liên kết"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("Đã sao chép"),
    "core": MessageLookupByLibrary.simpleMessage("Lõi"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows Smart App Control đã chặn FastAICore.exe chưa ký. Hãy dùng bộ cài chính thức hoặc liên hệ hỗ trợ.",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("Trạng thái lõi"),
    "country": MessageLookupByLibrary.simpleMessage("Khu vực"),
    "crashDetected": MessageLookupByLibrary.simpleMessage(
      "Phát hiện lỗi khởi động",
    ),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("Phân tích lỗi"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "Khi bật, tự động gửi nhật ký lỗi không chứa dữ liệu nhạy cảm khi ứng dụng gặp sự cố",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Tạo"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("Thời gian tạo"),
    "custom": MessageLookupByLibrary.simpleMessage("Tùy chỉnh"),
    "cut": MessageLookupByLibrary.simpleMessage("Cắt"),
    "dark": MessageLookupByLibrary.simpleMessage("Tối"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Tổng quan"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "Dữ liệu đã thay đổi. Lưu lại?",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng dùng Firebase Crashlytics để thu thập thông tin thiết bị và lỗi nhằm cải thiện độ ổn định. Không bao gồm dữ liệu cá nhân nhạy cảm; có thể tắt trong cài đặt.",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage(
      "Thông báo thu thập dữ liệu",
    ),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "Không thể lưu thay đổi; đã khôi phục trạng thái trước.",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("Mặc định"),
    "delay": MessageLookupByLibrary.simpleMessage("Độ trễ"),
    "delayTest": MessageLookupByLibrary.simpleMessage("Kiểm tra độ trễ"),
    "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng proxy đa nền tảng, đơn giản và dễ dùng",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("Đích"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("GeoIP đích"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("ASN của IP đích"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage(
      "Dựa trên API bên thứ ba; chỉ để tham khảo",
    ),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("Proxy quay số"),
    "direct": MessageLookupByLibrary.simpleMessage("Trực tiếp"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("Tắt UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("Tắt"),
    "disconnected": MessageLookupByLibrary.simpleMessage("Đã ngắt kết nối"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage(
      "Có phiên bản mới",
    ),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("Chuyển hướng DNS"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("Chế độ DNS"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("Truy vấn DNS"),
    "docked": MessageLookupByLibrary.simpleMessage("Gắn cố định"),
    "domain": MessageLookupByLibrary.simpleMessage("Tên miền"),
    "download": MessageLookupByLibrary.simpleMessage("Tải xuống"),
    "edit": MessageLookupByLibrary.simpleMessage("Sửa"),
    "editRule": MessageLookupByLibrary.simpleMessage("Sửa quy tắc"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("Bật"),
    "entries": MessageLookupByLibrary.simpleMessage(" mục"),
    "error": MessageLookupByLibrary.simpleMessage("Lỗi"),
    "exclude": MessageLookupByLibrary.simpleMessage("Ẩn khỏi ứng dụng gần đây"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "Ẩn khỏi danh sách ứng dụng gần đây khi chạy nền",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("Loại cần loại trừ"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("Thoát"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage(
      "Thoát toàn màn hình",
    ),
    "expand": MessageLookupByLibrary.simpleMessage("Tiêu chuẩn"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage(
      "Trạng thái mong đợi",
    ),
    "expireTime": MessageLookupByLibrary.simpleMessage("Thời gian hết hạn"),
    "exportFile": MessageLookupByLibrary.simpleMessage("Xuất tệp"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("Xuất nhật ký"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Xuất thành công"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("Biểu cảm"),
    "externalController": MessageLookupByLibrary.simpleMessage(
      "Bộ điều khiển bên ngoài",
    ),
    "externalLink": MessageLookupByLibrary.simpleMessage("Liên kết ngoài"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("Rất lớn"),
    "fade": MessageLookupByLibrary.simpleMessage("Mờ dần"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("Bộ lọc dự phòng"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "Không thể làm mới tài khoản. Sẽ kiểm tra lại khi kết nối.",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra phiên bản mới trong nền. Bạn cần chủ động tải và cài đặt.",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("Tự động chọn"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "Chạy nền và thông báo",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage(
      "Tài khoản bị vô hiệu hóa",
    ),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "Không thể xác minh chứng chỉ máy chủ. Kiểm tra giờ hệ thống hoặc liên hệ hỗ trợ.",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage(
      "Kết nối hệ thống",
    ),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("Kết nối TCP"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("Kết nối bảo mật"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("Chọn tuyến"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("Cấu hình ứng dụng"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI tạm thời không khả dụng. Liên hệ hỗ trợ trên website.",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "Cả hai đường đều thất bại với máy chủ này. Có thể do mạng chung hoặc hạn chế máy chủ; xem kiểm tra từng lớp trước khi kết luận.",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "Cả hai đường đều truy cập được máy chủ kiểm tra lần này.",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("So sánh kết nối"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "Đường hệ thống đạt nhưng tuyến đã chọn thất bại. Kiểm tra tuyến trước; chưa xác định nguyên nhân.",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "Tuyến đã chọn đạt nhưng đường hệ thống thất bại. Kiểm tra DNS hệ thống, định tuyến và hạn chế mạng cục bộ.",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("Kết nối"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("Đã kết nối"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("Kết nối"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "Kết nối thất bại. Thử lại hoặc chọn tuyến khác.",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage(
      "Sao chép báo cáo kỹ thuật",
    ),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage(
      "Lưu lượng độc lập còn lại",
    ),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "Lưu lượng độc lập được tính riêng và không mất khi đặt lại chu kỳ. Quyền sử dụng và hạn dùng tùy theo tài khoản.",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("Tuyến hiện tại"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "Cài đặt kết nối đã thay đổi khi kiểm tra. Kiểm tra lại để có kết quả mới.",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "Lõi hoặc danh sách tuyến chưa sẵn sàng. Làm mới tuyến và kết nối lại.",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "Chưa kết nối. Hãy kết nối trước để xác minh tuyến proxy.",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("DNS hệ thống"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "Tra cứu DNS thất bại hoặc hết thời gian. Kiểm tra mạng hoặc thử mạng khác.",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "Đã phân giải thành công các miền kiểm tra công cộng.",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage(
      "Tìm lỗi kết nối và làm theo hướng dẫn khắc phục",
    ),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Proxy/PAC Windows khác chế độ đã chọn. Kiểm tra ứng dụng VPN/proxy khác và cài đặt proxy Windows, rồi kết nối lại.",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "Cổng proxy cục bộ không phản hồi. Ngắt rồi kết nối lại và thử lại.",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "Cổng cục bộ có thể truy cập; chưa xác minh tuyến từ xa.",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Cài đặt proxy thủ công và PAC của Windows khớp chế độ hiện tại.",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("Kiểm tra lại"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("Tuyến đã chọn"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "Tuyến đã chọn không truy cập được máy chủ kiểm tra. Thử tuyến khác; nếu tất cả thất bại, kiểm tra DNS và mạng cục bộ.",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "Tuyến đã chọn truy cập được máy chủ kiểm tra HTTPS. Các dịch vụ khác có thể khác.",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage(
      "Đang kiểm tra kết nối…",
    ),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "Bỏ qua trong chế độ an toàn: không dùng lõi proxy và cài đặt hệ thống.",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "Lõi, tuyến và quyền kết nối đã sẵn sàng. Chưa kiểm tra mọi cài đặt hệ thống.",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra này không áp dụng cho trạng thái kết nối hoặc thiết bị hiện tại.",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "Chưa có quyền TUN. Kết nối lại và cấp quyền hoặc chọn proxy hệ thống.",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "Không thể hoàn tất kiểm tra. Thử lại hoặc làm theo hướng dẫn bên dưới.",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "Không xác minh được máy chủ kiểm tra. Điều này không có nghĩa là toàn bộ Internet không truy cập được.",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "Máy chủ kiểm tra công cộng trả về phản hồi mong đợi.",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("Ngắt kết nối"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("Chưa kết nối"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage(
      "Đang ngắt kết nối…",
    ),
    "fdEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "Đã hết lưu lượng. Hãy gia hạn hoặc mua thêm.",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("Gói đã hết hạn"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("Hạn chu kỳ"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("Chế độ toàn cục"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage(
      "Đã kiểm tra; một số mục chưa xác minh được",
    ),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage(
      "Một số mục cần chú ý",
    ),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage(
      "Các mục đã kiểm tra đều đạt",
    ),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "Xem kết quả bên dưới. Chỉ thực hiện khắc phục khi bạn chọn.",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Chọn tuyến. Kết nối chỉ với một chạm.",
    ),
    "fdHome": MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "Cấu hình từ máy chủ không hợp lệ. Đồng bộ lại hoặc liên hệ hỗ trợ.",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Email hoặc mật khẩu không đúng",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng đã được cập nhật",
    ),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("Proxy cục bộ"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · Kết nối trước khi dùng địa chỉ này.",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("Kết nối mạng"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra mạng",
    ),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "Không thể kết nối dịch vụ. Kiểm tra mạng rồi thử lại.",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage(
      "Lần đặt lại tự động tiếp theo (giờ địa phương)",
    ),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("Không hết hạn chu kỳ"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage("Chọn gói để bắt đầu"),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "Không có tuyến khả dụng. Kiểm tra tài khoản trên website.",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage(
      "Website chính thức",
    ),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage(
      "Lưu lượng chu kỳ đã dùng",
    ),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage(
      "Kết nối Internet",
    ),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "Quá nhiều yêu cầu. Thử lại sau.",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "Dùng cùng URL HTTPS với tuyến đã chọn, không chỉ định proxy ứng dụng. TUN hoặc định tuyến hệ điều hành vẫn có thể ảnh hưởng; không đảm bảo bỏ qua VPN.",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("Mã tham chiếu"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("Làm mới"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage(
      "Đăng ký hoặc đặt lại mật khẩu trên website",
    ),
    "fdRemaining": MessageLookupByLibrary.simpleMessage(
      "Lưu lượng chu kỳ còn lại",
    ),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage(
      "Làm mới cấu hình và kết nối",
    ),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "Không hoàn tất thao tác. Xem kết quả mới bên dưới; đăng nhập và kiểm tra quyền tài khoản nếu cần.",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "Thao tác có thể ngắt kết nối hoặc đổi tuyến. Sẽ kiểm tra lại sau đó. Khôi phục tuyến thử tối đa 5 tuyến thay thế.",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("Kết nối lại"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage(
      "Tìm và chuyển sang tuyến hoạt động",
    ),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "Thao tác đã xong nhưng chưa xác minh được khôi phục. Làm theo hướng dẫn còn lại bên dưới.",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "Tuyến proxy đã được xác minh. Xem các cảnh báo còn lại bên dưới.",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage(
      "Đang khắc phục và kiểm tra kết nối…",
    ),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("Sao chép báo cáo"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage(
      "Tiêu chí đánh giá",
    ),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "Cả hai miền phải trả về ít nhất một địa chỉ trong 8 giây. Chỉ kiểm tra bộ phân giải hệ thống, không kiểm tra rò rỉ DNS hay máy chủ DNS thượng nguồn đã cấu hình.",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Kiểm tra Wi-Fi/Ethernet và đăng nhập mạng nếu cần.\n2. Thử mạng khác để xác định lỗi DNS cục bộ.\n3. Nếu vẫn lỗi, gửi báo cáo cho hỗ trợ hoặc quản trị viên mạng.",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("Phát hiện vấn đề"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage(
      "Chưa thu thập được số đo.",
    ),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "Mục này không cần khắc phục. Đây là kết quả tại thời điểm kiểm tra, không đảm bảo truy cập mọi dịch vụ.",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "Thông số kỹ thuật (ms = mili giây)",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("Đạt"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "Kết nối TCP tới cổng loopback đã cấu hình phải hoàn tất trong 8 giây. Không xác định tiến trình lắng nghe hay xác minh tuyến từ xa.",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. Ngắt và kết nối lại FastAI.\n2. Nếu vẫn lỗi, khởi động lại FastAI.\n3. Gửi báo cáo cho hỗ trợ; lỗi kiểm tra cổng không chứng minh ứng dụng khác chiếm cổng.",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "Báo cáo sao chép có đích kiểm tra và phản hồi DNS, không có tài khoản, token, URL đăng ký hay PAC.",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "Proxy HTTP/HTTPS thủ công cấp người dùng Windows phải khớp chế độ đã chọn; PAC đang hoạt động được báo là có thể xung đột. Không kiểm tra tường lửa, WinHTTP hay chính sách tổ chức.",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. Mở Cài đặt Windows → Mạng và Internet → Proxy.\n2. Thoát ứng dụng proxy/VPN khác và kiểm tra proxy/PAC cá nhân. Không xóa cài đặt do tổ chức quản lý.\n3. Kết nối lại FastAI và kiểm tra.",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("Bước tiếp theo"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "Tuyến đã chọn phải trả HTTP 204 trong 8 giây, không có lỗi proxy.",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. Chọn tuyến khác và thử lại.\n2. Nếu mọi tuyến thất bại, xem kết quả DNS và proxy cục bộ.\n3. Nếu chỉ máy chủ kiểm tra lỗi, thử dịch vụ cần dùng và gửi báo cáo cho hỗ trợ.",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "Dùng bản ứng dụng thông thường, kết nối rồi kiểm tra lại. Thiết bị di động không chạy kiểm tra cổng máy tính.",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Đảm bảo đã đăng nhập và tài khoản được phép kết nối.\n2. Làm mới tuyến và kết nối lại.\n3. Cấp quyền TUN hoặc chọn proxy hệ thống.",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("Chưa chạy"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("Bắt đầu kiểm tra"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("Chưa xác minh"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "Bật xác minh chứng chỉ. Máy chủ kiểm tra phải trả HTTP 204 trong 8 giây; không theo chuyển hướng.",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. Kiểm tra ngày giờ hệ thống.\n2. Đăng nhập Wi-Fi và thử mạng khác.\n3. So sánh máy chủ kiểm tra khác và đường proxy. Không tắt xác minh chứng chỉ.",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Thao tác thất bại. Vui lòng thử lại.",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu hết thời gian chờ. Kiểm tra mạng rồi thử lại.",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage(
      "Trường này là bắt buộc",
    ),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "Dùng một lượt để xóa lưu lượng chu kỳ hiện tại? Lưu lượng độc lập, gói và hạn dùng không đổi.",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage(
      "Lượt đặt lại khả dụng",
    ),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage(
      "Không có lưu lượng chu kỳ cần đặt lại.",
    ),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "Dùng một lượt để xóa lưu lượng đã dùng trong chu kỳ. Lưu lượng độc lập và hạn gói không đổi.",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "Cần gói còn hiệu lực có lưu lượng chu kỳ.",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "Không còn lượt đặt lại.",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Đã đặt lại lưu lượng chu kỳ và làm mới tài khoản.",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage(
      "Đặt lại lưu lượng chu kỳ",
    ),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "Không thể kiểm tra lượt đặt lại. Làm mới tài khoản rồi thử lại.",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra kết quả đặt lại",
    ),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("Kiểm tra thất bại"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("Lần đo gần nhất"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("Độ trễ thấp"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("Độ trễ cao"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("Chưa kiểm tra"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Phiên đã hết hạn. Vui lòng đăng nhập lại.",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("Gói dịch vụ"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("Chế độ thông minh"),
    "fdSync": MessageLookupByLibrary.simpleMessage("Làm mới tuyến"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "Không thể làm mới tuyến. Thử lại trước khi kết nối.",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage(
      "Đang đồng bộ tuyến…",
    ),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "Kết nối máy chủ kiểm tra công cộng trong 8 giây. Thời gian bao gồm phân giải DNS.",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "Kết nối TCP thất bại. Kiểm tra DNS, truy cập mạng và bộ lọc; chưa thể kết luận lỗi tường lửa.",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "Máy chủ kiểm tra đã chấp nhận kết nối TCP.",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. Xem kết quả DNS trước.\n2. Thử mạng khác hoặc hoàn tất đăng nhập mạng.\n3. Kiểm tra quy tắc tường lửa/VPN với quản trị viên; không tắt toàn bộ tường lửa.",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "Hoàn tất TLS bằng kho tin cậy hệ thống trong 8 giây, gồm DNS và TCP. Ghi thời hạn chứng chỉ nếu có.",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "Không hoàn tất TLS. Kiểm tra đồng hồ, can thiệp mạng và độ tin cậy chứng chỉ; không tắt xác minh.",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "Bắt tay TLS và xác minh chứng chỉ thành công.",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "Cần cập nhật để tiếp tục kết nối",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("Dùng một lượt đặt lại"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "Kiểm tra email và mật khẩu hoặc hoàn tất xác minh trên website.",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage(
      "Quản lý trên website",
    ),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "Gia hạn, đơn hàng, cài đặt tài khoản và hỗ trợ có trên website.",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage(
      "Đăng nhập để kết nối và chọn vị trí",
    ),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("Trung thực màu"),
    "file": MessageLookupByLibrary.simpleMessage("Tệp"),
    "fileDesc": MessageLookupByLibrary.simpleMessage(
      "Tải trực tiếp tệp cấu hình",
    ),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage(
      "Tệp đã thay đổi. Lưu thay đổi?",
    ),
    "filter": MessageLookupByLibrary.simpleMessage("Lọc"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("Tìm tiến trình"),
    "floating": MessageLookupByLibrary.simpleMessage("Nổi"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("Phông chữ"),
    "fontSize": MessageLookupByLibrary.simpleMessage("Cỡ"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Buộc khởi động lại lõi?",
    ),
    "format": MessageLookupByLibrary.simpleMessage("Định dạng"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("Salad trái cây"),
    "general": MessageLookupByLibrary.simpleMessage("Chung"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("Tự động cập nhật"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage(
      "Chế độ Geo tiết kiệm bộ nhớ",
    ),
    "global": MessageLookupByLibrary.simpleMessage("Toàn cục"),
    "go": MessageLookupByLibrary.simpleMessage("Đi"),
    "goDownload": MessageLookupByLibrary.simpleMessage("Tải xuống"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Dịch vụ hỗ trợ không khả dụng nên không thể bật TUN. Cài lại FastAI.",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("Ẩn IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage(
      "Ẩn nút hết thời gian chờ",
    ),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "Ẩn các nút hết thời gian chờ ở lần kiểm tra độ trễ gần nhất",
    ),
    "host": MessageLookupByLibrary.simpleMessage("Máy chủ"),
    "hours": MessageLookupByLibrary.simpleMessage("giờ"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("Biểu tượng"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("Bản ghi biểu tượng"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("Kiểu biểu tượng"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("URL biểu tượng"),
    "import": MessageLookupByLibrary.simpleMessage("Nhập"),
    "importFile": MessageLookupByLibrary.simpleMessage("Nhập từ tệp"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("Nhập từ URL"),
    "inbound": MessageLookupByLibrary.simpleMessage("Kết nối vào"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage(
      "Bao gồm mọi proxy",
    ),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("Không hết hạn"),
    "init": MessageLookupByLibrary.simpleMessage("Khởi tạo"),
    "initiator": MessageLookupByLibrary.simpleMessage("Bên khởi tạo"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "Quyền danh sách ứng dụng bị từ chối. Vui lòng cấp quyền trong cài đặt hệ thống.",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "Hệ thống ẩn danh sách ứng dụng cho đến khi được cấp quyền. Cấp quyền để cấu hình proxy cho từng ứng dụng.",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Cần quyền danh sách ứng dụng",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage(
      "Chọn thông minh",
    ),
    "interfaceName": MessageLookupByLibrary.simpleMessage("Tên giao diện"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage(
      "Giao diện đầu ra",
    ),
    "internet": MessageLookupByLibrary.simpleMessage("Internet"),
    "interval": MessageLookupByLibrary.simpleMessage("Khoảng thời gian"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("IP nội bộ"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage(
      "Tệp sao lưu không hợp lệ",
    ),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "Dấu DSCP không được vượt quá 63",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "Chỉ hỗ trợ tcp hoặc udp",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "Mã QR không chứa liên kết cấu hình",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "Nhập số hoặc dải như 80 hay 8000-9000, ngăn cách bằng /",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("Địa chỉ IP"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("Lịch sử lạm dụng"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("Proxy"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("Dấu hiệu"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("Tổ chức"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage(
      "Không thể xác định loại IP",
    ),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("Tốt"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("Mức"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("Bình thường"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("Kiểm tra lại"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("Rủi ro"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("Phản hồi bởi"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("Nguồn"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage(
      "IP đầu ra khác nhau",
    ),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("Không có loại"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage(
      "Bị giới hạn yêu cầu",
    ),
    "ipType": MessageLookupByLibrary.simpleMessage("Loại"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("Doanh nghiệp"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("Trung tâm dữ liệu"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("Mạng di động"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("Dân cư"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage(
      "Thời gian chờ IPv6 (ms)",
    ),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("Vừa xong"),
    "key": MessageLookupByLibrary.simpleMessage("Khóa"),
    "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "large": MessageLookupByLibrary.simpleMessage("Lớn"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("Cập nhật gần nhất"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage(
      "Khởi động chưa hoàn tất",
    ),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng đã thoát bất ngờ khi khởi động lần trước. Đã bỏ qua kết nối tự động; hãy kết nối lại thủ công.",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("Bố cục"),
    "light": MessageLookupByLibrary.simpleMessage("Sáng"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("Ngắt dòng"),
    "list": MessageLookupByLibrary.simpleMessage("Danh sách"),
    "listen": MessageLookupByLibrary.simpleMessage("Lắng nghe"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage(
      "Dấu định tuyến lắng nghe",
    ),
    "liveConnections": MessageLookupByLibrary.simpleMessage(
      "Kết nối đang hoạt động",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Đang tải…"),
    "local": MessageLookupByLibrary.simpleMessage("Cục bộ"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "Quyền mạng cục bộ bị từ chối; đang dùng gvisor và không thể truy cập LAN.",
    ),
    "log": MessageLookupByLibrary.simpleMessage("Nhật ký"),
    "logLevel": MessageLookupByLibrary.simpleMessage("Mức nhật ký"),
    "logs": MessageLookupByLibrary.simpleMessage("Nhật ký"),
    "loopback": MessageLookupByLibrary.simpleMessage("Miễn trừ vòng lặp UWP"),
    "loose": MessageLookupByLibrary.simpleMessage("Thoáng"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("Số lần lỗi tối đa"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("Phóng to"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage(
      "Bộ nhớ thường trú",
    ),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng và bộ nhớ chung",
    ),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("Heap nhàn rỗi"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage(
      "Heap đang dùng",
    ),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "Lõi chưa chạy",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage(
      "Chi phí bộ nhớ thời gian chạy",
    ),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage(
      "Ngăn xếp goroutine",
    ),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "Ước tính từ bộ nhớ thường trú của tiến trình; có thể khác báo cáo của hệ thống.",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "Lõi chạy trong tiến trình ứng dụng. Phần bộ nhớ của lõi được ước tính từ thống kê thời gian chạy; phần còn lại tính cho ứng dụng và bộ nhớ chung.",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("Thông tin bộ nhớ"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage(
      "Đã giải phóng bộ nhớ",
    ),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("Tối giản"),
    "minimize": MessageLookupByLibrary.simpleMessage("Thu nhỏ"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage(
      "Tiếp tục chạy khi đóng cửa sổ",
    ),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("Cổng hỗn hợp"),
    "mode": MessageLookupByLibrary.simpleMessage("Chế độ"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("Đơn sắc"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("Thêm"),
    "name": MessageLookupByLibrary.simpleMessage("Tên"),
    "network": MessageLookupByLibrary.simpleMessage("Mạng"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu đã bị hủy",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "Không thể kết nối máy chủ. Kiểm tra mạng hoặc cài đặt proxy.",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("Kiểm tra mạng"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "Không thể phân giải địa chỉ máy chủ. Kiểm tra URL và DNS.",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "Quá nhiều yêu cầu (HTTP 429). Đợi một lát rồi thử lại.",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("Tốc độ mạng"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Yêu cầu hết thời gian chờ. Kiểm tra mạng hoặc proxy rồi thử lại.",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "Kết nối bảo mật thất bại. Chứng chỉ có thể không hợp lệ hoặc kết nối bị can thiệp.",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("Loại mạng"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("Trung tính"),
    "no": MessageLookupByLibrary.simpleMessage("Không"),
    "noData": MessageLookupByLibrary.simpleMessage("Không có dữ liệu"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("Không nhắc lại"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("Không có mạng"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage(
      "Ứng dụng không dùng mạng",
    ),
    "noResolve": MessageLookupByLibrary.simpleMessage("Không phân giải IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "Không có kết quả phù hợp",
    ),
    "none": MessageLookupByLibrary.simpleMessage("Không có"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "Không thể chọn nhóm proxy hiện tại",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "Thêm cấu hình để bắt đầu",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage(
      "Chỉ tính lưu lượng proxy",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("Không bắt buộc"),
    "options": MessageLookupByLibrary.simpleMessage("Tùy chọn"),
    "other": MessageLookupByLibrary.simpleMessage("Khác"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("IP đầu ra"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("Chế độ kết nối"),
    "override": MessageLookupByLibrary.simpleMessage("Ghi đè"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("Ghi đè DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("Chế độ ghi đè"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("Ghi đè NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage(
      "Tên trống",
    ),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "Chưa chọn proxy hoặc nguồn proxy nên lõi từ chối nhóm",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("Tùy chỉnh"),
    "palette": MessageLookupByLibrary.simpleMessage("Bảng màu"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "paste": MessageLookupByLibrary.simpleMessage("Dán"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage(
      "Chọn từ thư viện ảnh",
    ),
    "pinWindow": MessageLookupByLibrary.simpleMessage("Ghim cửa sổ"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "Vui lòng tải mã QR hợp lệ",
    ),
    "port": MessageLookupByLibrary.simpleMessage("Cổng"),
    "preview": MessageLookupByLibrary.simpleMessage("Xem trước"),
    "process": MessageLookupByLibrary.simpleMessage("Tiến trình"),
    "profile": MessageLookupByLibrary.simpleMessage("Cấu hình"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("Nhập chu kỳ hợp lệ"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("Nhập chu kỳ cập nhật"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "Cấu hình đã thay đổi. Tắt tự động cập nhật?",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Nhập tên cấu hình",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Nhập URL cấu hình hợp lệ",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Nhập URL cấu hình",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("Cấu hình"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("Sắp xếp cấu hình"),
    "project": MessageLookupByLibrary.simpleMessage("Dự án"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage(
      "Đăng ký",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("Tài nguyên ngoài"),
    "proxies": MessageLookupByLibrary.simpleMessage("Proxy"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("Chuỗi proxy"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("Nhóm proxy"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("Nút proxy"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("Nguồn proxy"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("Đen thuần"),
    "qrcode": MessageLookupByLibrary.simpleMessage("Mã QR"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage(
      "Quét mã QR để lấy cấu hình",
    ),
    "quickAdd": MessageLookupByLibrary.simpleMessage("Thêm nhanh"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("Cầu vồng"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("Yêu cầu gần đây"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Cổng Redir"),
    "redo": MessageLookupByLibrary.simpleMessage("Làm lại"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("Giải phóng bộ nhớ"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage(
      "Không thể giải phóng bộ nhớ",
    ),
    "remote": MessageLookupByLibrary.simpleMessage("Từ xa"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("Đích từ xa"),
    "remove": MessageLookupByLibrary.simpleMessage("Gỡ bỏ"),
    "replace": MessageLookupByLibrary.simpleMessage("Thay thế"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("Thay thế tất cả"),
    "request": MessageLookupByLibrary.simpleMessage("Yêu cầu"),
    "requests": MessageLookupByLibrary.simpleMessage("Yêu cầu"),
    "reset": MessageLookupByLibrary.simpleMessage("Đặt lại"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "Trang có thay đổi. Đặt lại?",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("Tài nguyên"),
    "respectRules": MessageLookupByLibrary.simpleMessage("Tuân theo quy tắc"),
    "restart": MessageLookupByLibrary.simpleMessage("Khởi động lại"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Khởi động lại lõi?",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("Khôi phục"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("Cách khôi phục"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage(
      "Tương thích",
    ),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("Ghi đè"),
    "retry": MessageLookupByLibrary.simpleMessage("Thử lại"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("Địa chỉ định tuyến"),
    "routeMode": MessageLookupByLibrary.simpleMessage("Chế độ định tuyến"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage(
      "Bỏ qua địa chỉ riêng",
    ),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("Dùng cấu hình"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("Quy tắc"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage(
      "Quy tắc logic AND",
    ),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên miền đầy đủ",
    ),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp từ khóa tên miền",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp biểu thức chính quy tên miền",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp hậu tố tên miền",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ký tự đại diện; chỉ hỗ trợ * và ?",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dấu DSCP (chỉ đầu vào tproxy UDP)",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải cổng đích",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp mã quốc gia của IP",
    ),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên miền trong Geosite",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên kết nối vào",
    ),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp cổng vào",
    ),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp loại kết nối vào",
    ),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên người dùng vào; ngăn cách nhiều tên bằng /",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ASN của IP",
    ),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải IP; IP-CIDR6 chỉ là bí danh",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải địa chỉ IP",
    ),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải hậu tố IP",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp mọi yêu cầu, không cần điều kiện",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp TCP hoặc UDP",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage(
      "Quy tắc logic NOT",
    ),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage(
      "Quy tắc logic OR",
    ),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên tiến trình; dùng tên gói trên Android",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp biểu thức chính quy tên tiến trình; tên gói trên Android",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ký tự đại diện tên tiến trình; chỉ hỗ trợ * và ?",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp đường dẫn tiến trình đầy đủ",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp biểu thức chính quy đường dẫn tiến trình",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ký tự đại diện đường dẫn; chỉ hỗ trợ * và ?",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp tên đối chiếu lại; ngăn cách bằng /",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "Tham chiếu bộ quy tắc; cần rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp mã quốc gia IP nguồn",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ASN của IP nguồn",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải IP nguồn",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải hậu tố IP nguồn",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp dải cổng nguồn",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp vào quy tắc con; chú ý dấu ngoặc",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "Khớp ID người dùng Linux",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("Tên quy tắc"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BitTorrent trực tiếp",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "Chặn DNS qua TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("Chặn QUIC"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("Chặn STUN"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage(
      "LAN trực tiếp",
    ),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple và Microsoft kết nối trực tiếp",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("Nguồn quy tắc"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("Bộ quy tắc"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("Đích quy tắc"),
    "rules": MessageLookupByLibrary.simpleMessage("Quy tắc"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("Thời gian chạy"),
    "safeMode": MessageLookupByLibrary.simpleMessage("Chế độ an toàn"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("Lưu"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Lưu thay đổi?"),
    "script": MessageLookupByLibrary.simpleMessage("Tập lệnh"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage(
      "Cuộn đến mục đã chọn",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
    "seconds": MessageLookupByLibrary.simpleMessage("giây"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("Chọn tất cả"),
    "selected": MessageLookupByLibrary.simpleMessage("Đã chọn"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("Máy chủ"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("Khả dụng"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("Bị chặn"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("Kiểm tra"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("Kiểm tra tất cả"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("Sắp ra mắt"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage(
      "Nhà mạng không được phép",
    ),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("Kiểm tra thất bại"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("Quản lý dịch vụ"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage(
      "Chỉ nội dung gốc",
    ),
    "servicePending": MessageLookupByLibrary.simpleMessage("Chưa kiểm tra"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage(
      "Truy cập bị hạn chế",
    ),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("Trạng thái dịch vụ"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage(
      "Không khả dụng",
    ),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage(
      "Khu vực không được hỗ trợ",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "show": MessageLookupByLibrary.simpleMessage("Hiện"),
    "showLess": MessageLookupByLibrary.simpleMessage("Thu gọn"),
    "showMore": MessageLookupByLibrary.simpleMessage("Mở rộng"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "Nút dừng trong thông báo",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("Gọn"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("Làm mờ thanh bên"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("Khởi động thu nhỏ"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("Thêm một mục"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("Kích thước"),
    "slide": MessageLookupByLibrary.simpleMessage("Trượt"),
    "socksPort": MessageLookupByLibrary.simpleMessage("Cổng SOCKS"),
    "sort": MessageLookupByLibrary.simpleMessage("Sắp xếp"),
    "source": MessageLookupByLibrary.simpleMessage("Nguồn"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("IP nguồn"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("Proxy riêng"),
    "specialRules": MessageLookupByLibrary.simpleMessage("Quy tắc riêng"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("Thống kê tốc độ"),
    "standard": MessageLookupByLibrary.simpleMessage("Tiêu chuẩn"),
    "start": MessageLookupByLibrary.simpleMessage("Bắt đầu"),
    "startVpn": MessageLookupByLibrary.simpleMessage("Đang khởi động VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("Trạng thái"),
    "stop": MessageLookupByLibrary.simpleMessage("Dừng"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("Đang dừng VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("Chiến lược"),
    "style": MessageLookupByLibrary.simpleMessage("Kiểu"),
    "subRule": MessageLookupByLibrary.simpleMessage("Quy tắc con"),
    "submit": MessageLookupByLibrary.simpleMessage("Gửi"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage(
      "Thông tin đăng ký",
    ),
    "suspended": MessageLookupByLibrary.simpleMessage("Đang tạm ngưng…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Đổi cấu hình"),
    "sync": MessageLookupByLibrary.simpleMessage("Đồng bộ"),
    "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
    "systemApp": MessageLookupByLibrary.simpleMessage("Ứng dụng hệ thống"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("Proxy hệ thống"),
    "tab": MessageLookupByLibrary.simpleMessage("Thẻ"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("Hiệu ứng thẻ"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP đồng thời"),
    "testUrl": MessageLookupByLibrary.simpleMessage("URL kiểm tra"),
    "textScale": MessageLookupByLibrary.simpleMessage("Cỡ chữ"),
    "theme": MessageLookupByLibrary.simpleMessage("Giao diện"),
    "themeColor": MessageLookupByLibrary.simpleMessage("Màu giao diện"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Chế độ giao diện"),
    "tight": MessageLookupByLibrary.simpleMessage("Sát"),
    "time": MessageLookupByLibrary.simpleMessage("Thời gian"),
    "timeout": MessageLookupByLibrary.simpleMessage("Hết thời gian chờ"),
    "tip": MessageLookupByLibrary.simpleMessage("Gợi ý"),
    "toggle": MessageLookupByLibrary.simpleMessage("Chuyển đổi"),
    "tolerance": MessageLookupByLibrary.simpleMessage("Dung sai"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage(
      "Điểm nhấn tông màu",
    ),
    "tools": MessageLookupByLibrary.simpleMessage("Công cụ"),
    "torch": MessageLookupByLibrary.simpleMessage("Đèn pin"),
    "total": MessageLookupByLibrary.simpleMessage("Tổng"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("Tổng lưu lượng"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("Cổng TProxy"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("Lưu lượng sử dụng"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage(
      "Chỉ hoạt động với quyền quản trị",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("Tắt"),
    "turnOn": MessageLookupByLibrary.simpleMessage("Bật"),
    "undo": MessageLookupByLibrary.simpleMessage("Hoàn tác"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("Độ trễ thống nhất"),
    "unknown": MessageLookupByLibrary.simpleMessage("Không rõ"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage(
      "Lỗi mạng không xác định",
    ),
    "unmaximize": MessageLookupByLibrary.simpleMessage("Khôi phục kích thước"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("Bỏ ghim cửa sổ"),
    "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
    "upload": MessageLookupByLibrary.simpleMessage("Tải lên"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("Lấy cấu hình từ URL"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("Dùng hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage(
      "Dùng hosts hệ thống",
    ),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("Lưu lượng đã dùng"),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("Giá trị"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("Rực rỡ"),
    "view": MessageLookupByLibrary.simpleMessage("Xem"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "Phát hiện thay đổi cấu hình VPN",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage(
      "Thay đổi có hiệu lực sau khi khởi động lại VPN",
    ),
    "whitelistMode": MessageLookupByLibrary.simpleMessage(
      "Chế độ danh sách cho phép",
    ),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("Ghi vào hệ thống"),
    "yearsAgo": m45,
  };
}
