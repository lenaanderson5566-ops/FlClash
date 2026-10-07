// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(count, skipped) => "${count}개 추가 예정, 기존 ${skipped}개 건너뜀";

  static String m1(code) =>
      "Windows 정책이 FastAICore.exe 실행을 차단했습니다(오류 ${code}). 공식 설치 파일을 사용하거나 관리자에게 허용을 요청하세요.";

  static String m2(name) =>
      "앱 시작이 연속 두 번 실패하여 ${name} 설정을 해제하고 자동 연결을 건너뛰었습니다. 홈에서 다시 연결해 주세요.";

  static String m3(url) => "${url}에서 설정 파일을 만들까요?";

  static String m4(count) => "${count}일 전";

  static String m5(label) => "선택한 ${label} 항목을 삭제할까요?";

  static String m6(label) => "이 ${label} 항목을 삭제할까요?";

  static String m7(label) => "${label} 상세 정보";

  static String m8(label) => "${label} 항목은 비워 둘 수 없습니다";

  static String m9(label) => "${label} 항목이 이미 있습니다";

  static String m10(name) => "${name}은 최신 상태입니다";

  static String m11(name) => "${name} 업데이트됨";

  static String m12(count) => "${count}시간 전";

  static String m13(count) => "${count}시간";

  static String m14(target) => "${target}은 올바르지 않은 정책입니다";

  static String m15(ruleSet) => "${ruleSet}은 올바르지 않은 규칙 집합입니다";

  static String m16(subRule) => "${subRule}은 올바르지 않은 SUB_RULE입니다";

  static String m17(line, message) => "${line}행: ${message}";

  static String m18(label, max) => "${label} 항목은 최대 ${max}자입니다";

  static String m19(size) => "${size} 정리됨";

  static String m20(count) => "${count}분 전";

  static String m21(count) => "${count}개월 전";

  static String m22(code) =>
      "접근이 거부되었습니다(HTTP ${code}). 링크 만료 또는 인증 정보를 확인하세요.";

  static String m23(code) => "서버가 요청을 거부했습니다(HTTP ${code})";

  static String m24(code) => "주소에 항목이 없습니다(HTTP ${code}). URL을 확인하세요.";

  static String m25(detail) => "네트워크 요청 실패: ${detail}";

  static String m26(code) => "서버 오류입니다(HTTP ${code}). 나중에 다시 시도하세요.";

  static String m27(label) => "아직 ${label} 항목이 없습니다";

  static String m28(message) => "코어가 프록시를 해석할 수 없습니다: ${message}";

  static String m29(name) => "${name} 이름을 다른 프록시나 그룹에서 사용 중입니다";

  static String m30(path) => "프록시 그룹이 순환 참조합니다: ${path}";

  static String m31(names) => "존재하지 않는 프록시 공급자: ${names}";

  static String m32(names) => "존재하지 않는 프록시 또는 정책: ${names}";

  static String m33(name) => "${name}은 기본 정책 이름이므로 사용할 수 없습니다";

  static String m34(names) => "설정 파일의 그룹이 사용자 프록시에 없는 노드를 참조합니다: ${names}";

  static String m35(label, profiles) =>
      "${profiles}의 사용자 그룹이나 규칙에서 ${label}을 사용 중입니다. 먼저 참조를 제거하세요.";

  static String m36(profiles, label) =>
      "${profiles} 구독에 ${label}이 이미 있습니다. 다른 이름을 선택하세요.";

  static String m37(count) => "노드 ${count}개";

  static String m38(count) => "규칙 ${count}개";

  static String m39(appName) => "${appName} (안전 모드)";

  static String m40(count) => "${count}초";

  static String m41(count) => "${count}개 선택됨";

  static String m42(time) => "확인 시간: ${time}";

  static String m43(label) => "${label} 항목은 하나의 값이어야 합니다";

  static String m44(label) => "${label} 항목은 URL이어야 합니다";

  static String m45(count) => "${count}년 전";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("정보"),
    "accessControl": MessageLookupByLibrary.simpleMessage("프록시를 사용할 앱"),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "선택한 앱만 VPN 사용",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "VPN에 포함하거나 제외할 앱 선택",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "앱 접근 제어 꺼짐",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "선택한 앱은 VPN에서 제외",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage("접근 제어 설정"),
    "account": MessageLookupByLibrary.simpleMessage("계정"),
    "action": MessageLookupByLibrary.simpleMessage("작업"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage("모든 지연 시간 확인"),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("직접 연결 모드"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage("전체 모드"),
    "actionMode": MessageLookupByLibrary.simpleMessage("모드 전환"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("시스템 프록시"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("규칙 모드"),
    "actionStart": MessageLookupByLibrary.simpleMessage("시작/중지"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage("설정 파일 업데이트"),
    "actionView": MessageLookupByLibrary.simpleMessage("표시/숨기기"),
    "add": MessageLookupByLibrary.simpleMessage("추가"),
    "addProfile": MessageLookupByLibrary.simpleMessage("설정 파일 추가"),
    "addRule": MessageLookupByLibrary.simpleMessage("규칙 추가"),
    "addedRules": MessageLookupByLibrary.simpleMessage("추가된 규칙"),
    "address": MessageLookupByLibrary.simpleMessage("주소"),
    "agree": MessageLookupByLibrary.simpleMessage("동의"),
    "allowBypass": MessageLookupByLibrary.simpleMessage("앱의 VPN 우회 허용"),
    "allowLan": MessageLookupByLibrary.simpleMessage("LAN 접속 허용"),
    "answers": MessageLookupByLibrary.simpleMessage("응답"),
    "app": MessageLookupByLibrary.simpleMessage("앱"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage("앱 접근 제어"),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage("시스템 DNS 추가"),
    "authentication": MessageLookupByLibrary.simpleMessage("인증"),
    "authorize": MessageLookupByLibrary.simpleMessage("권한 승인"),
    "authorized": MessageLookupByLibrary.simpleMessage("권한 승인됨"),
    "auto": MessageLookupByLibrary.simpleMessage("자동"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage("업데이트 자동 확인"),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("자동 시작"),
    "autoRun": MessageLookupByLibrary.simpleMessage("시작 시 자동 연결"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage("시스템 DNS 자동 설정"),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("자동 업데이트"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage("자동 업데이트 간격(분)"),
    "back": MessageLookupByLibrary.simpleMessage("뒤로"),
    "backup": MessageLookupByLibrary.simpleMessage("백업"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "더 최신 버전에서 만든 백업입니다. 복원 전에 앱을 업데이트하세요.",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("기본 정보"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("일괄 추가"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "한 줄에 하나씩 입력하거나 쉼표로 구분하세요",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "한 줄에 키, 공백, 값 순서로 입력하세요",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("동작"),
    "bind": MessageLookupByLibrary.simpleMessage("연결"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage("제외 목록 모드"),
    "blockConnection": MessageLookupByLibrary.simpleMessage("연결 차단"),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("프록시 우회 도메인"),
    "cache": MessageLookupByLibrary.simpleMessage("캐시"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("캐시 알고리즘"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage("캐시가 손상되었습니다. 삭제할까요?"),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("캐시 크기"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "QR 스캔을 위해 시스템 설정에서 카메라를 허용하거나 앨범에서 QR 이미지를 선택하세요.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "카메라 권한 필요",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage("카메라 사용 불가"),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("선택 해제"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "프록시 전환 실패. 이전 선택을 복원했습니다.",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage("호환성 변경"),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("새 기능"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("오류 수정"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage("성능"),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("변경 되돌림"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage("TLS 인증서 확인"),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("업데이트 확인"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage("최신 버전입니다"),
    "clearSearch": MessageLookupByLibrary.simpleMessage("검색 지우기"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage("클립보드로 내보내기"),
    "clipboardImport": MessageLookupByLibrary.simpleMessage("클립보드에서 가져오기"),
    "close": MessageLookupByLibrary.simpleMessage("닫기"),
    "closeConnections": MessageLookupByLibrary.simpleMessage("연결 닫기"),
    "color": MessageLookupByLibrary.simpleMessage("색상"),
    "columns": MessageLookupByLibrary.simpleMessage("열"),
    "compatible": MessageLookupByLibrary.simpleMessage("호환 모드"),
    "confirm": MessageLookupByLibrary.simpleMessage("확인"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage("현재 창을 종료할까요?"),
    "connected": MessageLookupByLibrary.simpleMessage("연결됨"),
    "connecting": MessageLookupByLibrary.simpleMessage("연결 중…"),
    "connection": MessageLookupByLibrary.simpleMessage("연결"),
    "connections": MessageLookupByLibrary.simpleMessage("연결"),
    "connectivity": MessageLookupByLibrary.simpleMessage("연결 상태: "),
    "content": MessageLookupByLibrary.simpleMessage("내용"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("콘텐츠"),
    "copy": MessageLookupByLibrary.simpleMessage("복사"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage("환경 변수 복사"),
    "copyLink": MessageLookupByLibrary.simpleMessage("링크 복사"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("복사됨"),
    "core": MessageLookupByLibrary.simpleMessage("코어"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Windows Smart App Control이 서명되지 않은 FastAICore.exe를 차단했습니다. 공식 설치 파일을 사용하거나 고객 지원에 문의하세요.",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("코어 상태"),
    "country": MessageLookupByLibrary.simpleMessage("지역"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("시작 오류 감지"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("오류 분석"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "켜면 앱 오류 발생 시 민감 정보가 없는 오류 로그를 자동 전송합니다",
    ),
    "create": MessageLookupByLibrary.simpleMessage("만들기"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("생성 시간"),
    "custom": MessageLookupByLibrary.simpleMessage("사용자 지정"),
    "cut": MessageLookupByLibrary.simpleMessage("잘라내기"),
    "dark": MessageLookupByLibrary.simpleMessage("어둡게"),
    "dashboard": MessageLookupByLibrary.simpleMessage("대시보드"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "데이터가 변경되었습니다. 저장할까요?",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "앱 안정성을 개선하기 위해 Firebase Crashlytics로 기기 정보와 오류 정보를 수집합니다. 개인 민감 정보는 포함하지 않으며 설정에서 끌 수 있습니다.",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage("데이터 수집 안내"),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "변경사항 저장 실패. 이전 상태로 복원했습니다.",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("기본값"),
    "delay": MessageLookupByLibrary.simpleMessage("지연 시간"),
    "delayTest": MessageLookupByLibrary.simpleMessage("지연 시간 확인"),
    "delete": MessageLookupByLibrary.simpleMessage("삭제"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage("간편한 멀티플랫폼 프록시 클라이언트"),
    "destination": MessageLookupByLibrary.simpleMessage("목적지"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage("목적지 GeoIP"),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage("목적지 IP ASN"),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage("타사 API 결과이며 참고용입니다"),
    "dialerProxy": MessageLookupByLibrary.simpleMessage("연결 프록시"),
    "direct": MessageLookupByLibrary.simpleMessage("직접 연결"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("UDP 사용 안 함"),
    "disabled": MessageLookupByLibrary.simpleMessage("꺼짐"),
    "disconnected": MessageLookupByLibrary.simpleMessage("연결 끊김"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage("새 버전이 있습니다"),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("DNS 가로채기"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("DNS 모드"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNS 쿼리"),
    "docked": MessageLookupByLibrary.simpleMessage("고정"),
    "domain": MessageLookupByLibrary.simpleMessage("도메인"),
    "download": MessageLookupByLibrary.simpleMessage("다운로드"),
    "edit": MessageLookupByLibrary.simpleMessage("편집"),
    "editRule": MessageLookupByLibrary.simpleMessage("규칙 편집"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("켜짐"),
    "entries": MessageLookupByLibrary.simpleMessage("개 항목"),
    "error": MessageLookupByLibrary.simpleMessage("오류"),
    "exclude": MessageLookupByLibrary.simpleMessage("최근 앱에서 숨기기"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "백그라운드 실행 중 최근 앱에서 숨깁니다",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("제외 유형"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("종료"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage("전체 화면 종료"),
    "expand": MessageLookupByLibrary.simpleMessage("기본"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("예상 상태"),
    "expireTime": MessageLookupByLibrary.simpleMessage("만료 시간"),
    "exportFile": MessageLookupByLibrary.simpleMessage("파일 내보내기"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("로그 내보내기"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("내보내기 완료"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("풍부"),
    "externalController": MessageLookupByLibrary.simpleMessage("외부 컨트롤러"),
    "externalLink": MessageLookupByLibrary.simpleMessage("외부 링크"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("아주 크게"),
    "fade": MessageLookupByLibrary.simpleMessage("페이드"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("대체 필터"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "계정 정보를 새로고칠 수 없습니다. 연결 시 다시 확인합니다.",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "백그라운드에서 새 버전을 확인합니다. 다운로드와 설치는 직접 진행해야 합니다.",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("자동 선택"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "백그라운드 및 알림",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage("계정 사용 중지"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "서버 인증서를 확인할 수 없습니다. 시스템 시간 확인 또는 고객 지원 문의가 필요합니다.",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage("시스템 연결"),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("TCP 연결"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("보안 연결"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("경로 선택"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("앱 설정"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI를 일시적으로 사용할 수 없습니다. 웹사이트에서 고객 지원에 문의하세요.",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "두 경로 모두 이 서버에 연결하지 못했습니다. 공통 네트워크 문제 또는 서버 제한일 수 있으므로 단계별 결과를 확인하세요.",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "이번 점검에서 두 경로 모두 테스트 서버에 연결되었습니다.",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage("연결 비교"),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "시스템 경로는 성공했지만 선택한 경로는 실패했습니다. 경로부터 확인하세요. 원인은 아직 확정되지 않았습니다.",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "선택한 경로는 성공했지만 시스템 경로는 실패했습니다. 시스템 DNS, 라우팅, 로컬 네트워크 제한을 확인하세요.",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("연결"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("연결됨"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("연결"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "연결 실패. 다시 시도하거나 다른 경로를 선택하세요.",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage("기술 보고서 복사"),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage("남은 독립 데이터"),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "독립 데이터는 기간 데이터와 별도로 관리되며 기간 초기화 시 삭제되지 않습니다. 사용 범위와 만료일은 계정 권한에 따릅니다.",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("현재 경로"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "점검 중 연결 설정이 변경되었습니다. 최신 결과를 얻으려면 다시 점검하세요.",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "코어 또는 경로 목록이 준비되지 않았습니다. 경로를 새로고침하고 다시 연결하세요.",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "연결되지 않았습니다. 먼저 연결하여 프록시 경로를 확인하세요.",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("시스템 DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "DNS 조회가 실패했거나 시간이 초과되었습니다. 네트워크를 확인하거나 다른 네트워크를 사용하세요.",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "공용 테스트 도메인을 확인했습니다.",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage(
      "연결 문제를 찾고 복구 안내를 따르세요",
    ),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Windows 프록시/PAC가 선택한 모드와 다릅니다. 다른 VPN/프록시 앱과 Windows 프록시 설정을 확인한 후 다시 연결하세요.",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "로컬 프록시 포트가 응답하지 않습니다. 연결을 끊고 다시 연결한 후 재시도하세요.",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "로컬 포트에 연결할 수 있습니다. 원격 경로까지 확인된 것은 아닙니다.",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Windows 수동 프록시와 PAC 설정이 현재 모드와 일치합니다.",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage("다시 점검"),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage("선택한 경로"),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "선택한 경로로 테스트 서버에 연결하지 못했습니다. 다른 경로를 시도하고 모두 실패하면 DNS와 로컬 네트워크를 확인하세요.",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "선택한 경로가 HTTPS 테스트 서버에 연결되었습니다. 다른 서비스의 결과는 다를 수 있습니다.",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage("연결 확인 중…"),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "안전 모드에서 건너뜁니다. 프록시 코어와 시스템 설정을 사용하지 않습니다.",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "코어, 경로, 연결 권한이 준비되었습니다. 모든 시스템 설정을 확인한 것은 아닙니다.",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "현재 연결 상태 또는 기기에는 이 점검이 적용되지 않습니다.",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "TUN 권한이 필요합니다. 다시 연결하고 권한을 허용하거나 시스템 프록시를 선택하세요.",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "점검을 완료하지 못했습니다. 다시 시도하거나 아래 안내를 따르세요.",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "공용 테스트 서버를 확인하지 못했습니다. 이것만으로 모든 인터넷 연결이 끊겼다고 볼 수는 없습니다.",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "공용 테스트 서버가 예상한 응답을 반환했습니다.",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("연결 끊기"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("연결되지 않음"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("연결 끊는 중…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("이메일"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "데이터가 소진되었습니다. 갱신하거나 데이터를 구매하세요.",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("이용 기간 만료"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("이용 기간 만료일"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("전체 모드"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage(
      "점검 완료, 일부 항목은 확인되지 않았습니다",
    ),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage("확인이 필요한 항목이 있습니다"),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage("완료된 점검을 통과했습니다"),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "아래 결과를 확인하세요. 복구 작업은 직접 선택할 때만 실행됩니다.",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "경로를 선택하고 한 번에 연결하세요.",
    ),
    "fdHome": MessageLookupByLibrary.simpleMessage("홈"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "서버 설정에 문제가 있습니다. 다시 동기화하거나 고객 지원에 문의하세요.",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "이메일 또는 비밀번호가 올바르지 않습니다",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage("최신 버전입니다"),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("로컬 프록시"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · 연결한 후 이 주소를 사용하세요.",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("로그인"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage("네트워크 연결"),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage("네트워크 점검"),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "서비스에 연결할 수 없습니다. 네트워크를 확인하고 다시 시도하세요.",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage("다음 자동 초기화(현지 시간)"),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("기간 만료 없음"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage("요금제를 선택해 시작하세요"),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "사용 가능한 경로가 없습니다. 웹사이트에서 계정 권한을 확인하세요.",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage("공식 웹사이트"),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage("사용한 기간 데이터"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage("인터넷 연결"),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "요청이 너무 많습니다. 나중에 다시 시도하세요.",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "선택한 경로와 동일한 HTTPS URL을 앱 프록시 지정 없이 사용합니다. TUN이나 운영체제 라우팅의 영향을 받을 수 있으므로 VPN 우회를 보장하지 않습니다.",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("문의 번호"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("새로고침"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage(
      "웹사이트에서 가입 또는 비밀번호 재설정",
    ),
    "fdRemaining": MessageLookupByLibrary.simpleMessage("남은 기간 데이터"),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage("설정 새로고침 후 연결"),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "작업을 완료하지 못했습니다. 아래 새 결과를 확인하고 필요하면 로그인과 계정 권한을 확인하세요.",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "연결이 잠시 끊기거나 선택한 경로가 바뀔 수 있습니다. 작업 후 다시 점검합니다. 경로 복구 시 최대 5개 대안을 시험합니다.",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage("다시 연결"),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage("사용 가능한 경로 찾기 및 전환"),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "작업은 완료되었지만 복구는 확인되지 않았습니다. 아래 남은 안내를 따르세요.",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "프록시 경로 확인에 성공했습니다. 아래 남은 경고를 확인하세요.",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage("복구 및 연결 확인 중…"),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("보고서 복사"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("판정 기준"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "두 테스트 도메인이 각각 8초 이내에 주소를 하나 이상 반환해야 합니다. 시스템 이름 확인을 점검하며 DNS 유출이나 설정된 상위 DNS 서버는 확인하지 않습니다.",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Wi-Fi/이더넷과 네트워크 로그인을 확인하세요.\n2. 다른 네트워크에서 로컬 DNS 문제인지 확인하세요.\n3. 지속되면 보고서를 지원팀 또는 네트워크 관리자에게 보내세요.",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("문제 발견"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage("수집된 측정값이 없습니다."),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "이 항목은 복구가 필요하지 않습니다. 현재 상태의 결과이며 모든 서비스의 접속을 보장하지 않습니다.",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "기술 매개변수 (ms = 밀리초)",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("통과"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "설정된 루프백 포트에 TCP 연결이 8초 이내 완료되어야 합니다. 수신 프로세스의 신원이나 원격 경로는 확인하지 않습니다.",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. FastAI 연결을 끊고 다시 연결하세요.\n2. 다시 실패하면 FastAI를 재시작하세요.\n3. 보고서를 지원팀에 보내세요. 포트 점검 실패만으로 다른 앱이 포트를 점유한다고 단정할 수 없습니다.",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "복사한 보고서에는 테스트 대상과 DNS 응답이 포함되지만 계정, 토큰, 구독 또는 PAC URL은 포함되지 않습니다.",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "Windows 사용자 수준의 수동 HTTP/HTTPS 프록시가 선택한 모드와 일치해야 합니다. 활성 PAC는 충돌 가능성으로 표시합니다. 방화벽, WinHTTP, 조직 정책은 검사하지 않습니다.",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. Windows 설정 → 네트워크 및 인터넷 → 프록시를 확인하세요.\n2. 다른 프록시/VPN 앱을 종료하고 개인 프록시/PAC 설정을 확인하세요. 조직 관리 설정은 삭제하지 마세요.\n3. FastAI에 다시 연결하고 점검하세요.",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("다음 조치"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "선택한 경로가 프록시 오류 없이 8초 이내에 HTTP 204를 반환해야 합니다.",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. 다른 경로를 선택하여 재시도하세요.\n2. 모두 실패하면 DNS와 로컬 프록시 결과를 확인하세요.\n3. 테스트 서버만 실패하면 필요한 서비스 접속을 확인하고 보고서를 지원팀에 보내세요.",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "일반 버전 앱에서 연결한 후 다시 점검하세요. 모바일에서는 데스크톱 포트 점검을 실행하지 않습니다.",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. 로그인 상태와 계정의 연결 권한을 확인하세요.\n2. 경로를 새로고침하고 다시 연결하세요.\n3. TUN 권한을 허용하거나 시스템 프록시를 선택하세요.",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("실행 안 함"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("점검 시작"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("확인되지 않음"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "인증서 검증을 사용합니다. 공용 테스트 서버가 8초 이내에 HTTP 204를 반환해야 하며 리디렉션은 따르지 않습니다.",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. 시스템 날짜와 시간을 확인하세요.\n2. Wi-Fi 로그인을 완료하고 다른 네트워크를 시도하세요.\n3. 다른 테스트 서버와 프록시 경로를 비교하세요. 인증서 검증을 끄지 마세요.",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "작업에 실패했습니다. 다시 시도하세요.",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "요청 시간이 초과되었습니다. 네트워크를 확인하고 다시 시도하세요.",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage("필수 항목입니다"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "초기화 1회로 현재 기간 사용량을 지울까요? 독립 데이터, 요금제 및 만료일은 유지됩니다.",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage("사용 가능한 초기화 횟수"),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage("초기화할 기간 사용량이 없습니다."),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "초기화 1회를 사용해 기간 사용량을 지웁니다. 독립 데이터와 이용 만료일은 유지됩니다.",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "유효한 기간 데이터 요금제가 필요합니다.",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "사용 가능한 초기화 횟수가 없습니다.",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "기간 데이터를 초기화하고 계정 정보를 새로고쳤습니다.",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage("기간 데이터 초기화"),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "초기화 가능 횟수를 확인할 수 없습니다. 계정 정보를 새로고치고 다시 시도하세요.",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage("초기화 결과 확인"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("확인 실패"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("마지막 확인"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage("낮은 지연 시간"),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("높은 지연 시간"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("미확인"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "로그인이 만료되었습니다. 다시 로그인하세요.",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("요금제"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("스마트 모드"),
    "fdSync": MessageLookupByLibrary.simpleMessage("연결 경로 새로고침"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "경로를 새로고칠 수 없습니다. 다시 시도한 뒤 연결하세요.",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage("경로 동기화 중…"),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "공용 테스트 서버에 8초 이내 연결해야 합니다. DNS 확인 시간도 포함됩니다.",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "TCP 연결에 실패했습니다. DNS, 네트워크 접속과 필터링을 확인하세요. 이것만으로 방화벽 문제라고 단정할 수 없습니다.",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "테스트 서버가 TCP 연결을 수락했습니다.",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. 먼저 DNS 결과를 확인하세요.\n2. 다른 네트워크를 사용하거나 네트워크 로그인을 완료하세요.\n3. 관리자와 방화벽/VPN 규칙을 확인하세요. 해결책으로 방화벽 전체를 끄지 마세요.",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "시스템 신뢰 저장소를 사용하여 8초 이내 TLS를 완료해야 합니다. DNS와 TCP 시간이 포함되며 가능하면 인증서 유효기간을 기록합니다.",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "TLS를 완료하지 못했습니다. 인증서 검증을 유지한 채 시간, 네트워크 가로채기, 인증서 신뢰를 확인하세요.",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "TLS 핸드셰이크와 인증서 검증이 성공했습니다.",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "계속 연결하려면 업데이트하세요",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage("초기화 1회 사용"),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "이메일과 비밀번호를 확인하거나 웹사이트에서 인증을 완료하세요.",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("웹사이트에서 계정 관리"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "갱신, 주문, 계정 설정 및 고객 지원은 웹사이트에서 이용하세요.",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage("로그인하고 연결 경로를 선택하세요"),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("원색 유지"),
    "file": MessageLookupByLibrary.simpleMessage("파일"),
    "fileDesc": MessageLookupByLibrary.simpleMessage("설정 파일 직접 업로드"),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage("파일이 변경되었습니다. 저장할까요?"),
    "filter": MessageLookupByLibrary.simpleMessage("필터"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("프로세스 검색"),
    "floating": MessageLookupByLibrary.simpleMessage("떠 있는 형태"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("글꼴"),
    "fontSize": MessageLookupByLibrary.simpleMessage("크기"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "코어를 강제로 다시 시작할까요?",
    ),
    "format": MessageLookupByLibrary.simpleMessage("형식"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("과일 샐러드"),
    "general": MessageLookupByLibrary.simpleMessage("일반"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("자동 업데이트"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage("Geo 저메모리 모드"),
    "global": MessageLookupByLibrary.simpleMessage("전체 프록시"),
    "go": MessageLookupByLibrary.simpleMessage("이동"),
    "goDownload": MessageLookupByLibrary.simpleMessage("다운로드"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "도우미 서비스가 없어 TUN을 사용할 수 없습니다. FastAI를 다시 설치하세요.",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("IP 숨기기"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage("시간 초과 노드 숨기기"),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "마지막 지연 확인에서 시간 초과된 노드를 숨깁니다",
    ),
    "host": MessageLookupByLibrary.simpleMessage("호스트"),
    "hours": MessageLookupByLibrary.simpleMessage("시간"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("아이콘"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("아이콘 기록"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("아이콘 스타일"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("아이콘 URL"),
    "import": MessageLookupByLibrary.simpleMessage("가져오기"),
    "importFile": MessageLookupByLibrary.simpleMessage("파일에서 가져오기"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("URL에서 가져오기"),
    "inbound": MessageLookupByLibrary.simpleMessage("인바운드"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage("모든 프록시 포함"),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("만료 없음"),
    "init": MessageLookupByLibrary.simpleMessage("초기화"),
    "initiator": MessageLookupByLibrary.simpleMessage("요청자"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "앱 목록 권한이 거부되었습니다. 시스템 설정에서 직접 허용하세요.",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "권한을 승인해야 설치된 앱 목록을 확인할 수 있습니다. 앱별 프록시 설정을 위해 권한을 승인하세요.",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "앱 목록 권한 필요",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage("스마트 선택"),
    "interfaceName": MessageLookupByLibrary.simpleMessage("인터페이스 이름"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage("출력 인터페이스"),
    "internet": MessageLookupByLibrary.simpleMessage("인터넷"),
    "interval": MessageLookupByLibrary.simpleMessage("간격"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("내부 IP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage("올바르지 않은 백업 파일"),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "DSCP 마크는 63을 초과할 수 없습니다",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "tcp 또는 udp만 지원합니다",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "QR 코드에 설정 파일 링크가 없습니다",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "80 또는 8000-9000 같은 숫자나 범위를 /로 구분해 입력하세요",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP 주소"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("악용 기록"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("프록시"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("표시"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("기관"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage(
      "IP 유형을 확인할 수 없습니다",
    ),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("좋음"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("등급"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("보통"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("다시 확인"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("위험"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("응답 제공"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("출처"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage("출구 IP 불일치"),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("유형 없음"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage("요청 제한"),
    "ipType": MessageLookupByLibrary.simpleMessage("유형"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("기업용"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("데이터 센터"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("모바일 네트워크"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("가정용"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("IPv6 시간 제한(ms)"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("방금"),
    "key": MessageLookupByLibrary.simpleMessage("키"),
    "language": MessageLookupByLibrary.simpleMessage("언어"),
    "large": MessageLookupByLibrary.simpleMessage("크게"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("마지막 업데이트"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage("시작이 완료되지 않았습니다"),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "이전 시작 중 앱이 예기치 않게 종료되어 자동 연결을 건너뛰었습니다. 수동으로 다시 연결해 주세요.",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("레이아웃"),
    "light": MessageLookupByLibrary.simpleMessage("밝게"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("자동 줄 바꿈"),
    "list": MessageLookupByLibrary.simpleMessage("목록"),
    "listen": MessageLookupByLibrary.simpleMessage("수신"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage("수신 라우팅 마크"),
    "liveConnections": MessageLookupByLibrary.simpleMessage("실시간 연결"),
    "loading": MessageLookupByLibrary.simpleMessage("불러오는 중…"),
    "local": MessageLookupByLibrary.simpleMessage("로컬"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "로컬 네트워크 권한이 없어 gvisor를 사용합니다. LAN에 접근할 수 없습니다.",
    ),
    "log": MessageLookupByLibrary.simpleMessage("로그"),
    "logLevel": MessageLookupByLibrary.simpleMessage("로그 수준"),
    "logs": MessageLookupByLibrary.simpleMessage("로그"),
    "loopback": MessageLookupByLibrary.simpleMessage("UWP 루프백 예외"),
    "loose": MessageLookupByLibrary.simpleMessage("넓게"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage("최대 실패 횟수"),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("최대화"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage("상주 메모리"),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage("앱 및 공유 메모리"),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage("유휴 힙"),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage("사용 중인 힙"),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "코어가 실행 중이 아닙니다",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage("런타임 오버헤드"),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("고루틴 스택"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 상주 메모리 추정값으로 시스템 표시와 다를 수 있습니다.",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "코어는 앱 프로세스 내에서 실행됩니다. 런타임 통계로 코어 비중을 추정하고 나머지는 앱 및 공유 메모리로 계산합니다.",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("메모리 정보"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage("메모리 정리 완료"),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("최소"),
    "minimize": MessageLookupByLibrary.simpleMessage("최소화"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage("창을 닫아도 계속 실행"),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("혼합 포트"),
    "mode": MessageLookupByLibrary.simpleMessage("모드"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("단색"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("더 보기"),
    "name": MessageLookupByLibrary.simpleMessage("이름"),
    "network": MessageLookupByLibrary.simpleMessage("네트워크"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "요청이 취소되었습니다",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "서버에 연결할 수 없습니다. 네트워크나 프록시 설정을 확인하세요.",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("네트워크 확인"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "서버 주소를 확인할 수 없습니다. URL과 DNS를 확인하세요.",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "요청이 너무 많습니다(HTTP 429). 잠시 후 다시 시도하세요.",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("네트워크 속도"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "요청 시간이 초과되었습니다. 네트워크나 프록시를 확인하고 다시 시도하세요.",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "보안 연결 실패. 인증서가 유효하지 않거나 연결이 가로채졌을 수 있습니다.",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("네트워크 종류"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("중립"),
    "no": MessageLookupByLibrary.simpleMessage("아니요"),
    "noData": MessageLookupByLibrary.simpleMessage("데이터 없음"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage("다시 알리지 않기"),
    "noNetwork": MessageLookupByLibrary.simpleMessage("네트워크 없음"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("네트워크를 사용하지 않는 앱"),
    "noResolve": MessageLookupByLibrary.simpleMessage("IP 해석 안 함"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage("일치하는 결과 없음"),
    "none": MessageLookupByLibrary.simpleMessage("없음"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "현재 프록시 그룹은 선택할 수 없습니다",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "설정 파일을 추가하여 시작하세요",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage("프록시 데이터만 집계"),
    "optional": MessageLookupByLibrary.simpleMessage("선택 사항"),
    "options": MessageLookupByLibrary.simpleMessage("옵션"),
    "other": MessageLookupByLibrary.simpleMessage("기타"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("출구 IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage("연결 모드"),
    "override": MessageLookupByLibrary.simpleMessage("덮어쓰기"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("DNS 덮어쓰기"),
    "overrideMode": MessageLookupByLibrary.simpleMessage("덮어쓰기 모드"),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("NTP 덮어쓰기"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage(
      "이름이 비어 있습니다",
    ),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "프록시나 공급자가 선택되지 않아 코어가 그룹을 거부합니다",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage("사용자 지정"),
    "palette": MessageLookupByLibrary.simpleMessage("팔레트"),
    "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
    "paste": MessageLookupByLibrary.simpleMessage("붙여넣기"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("앨범에서 선택"),
    "pinWindow": MessageLookupByLibrary.simpleMessage("창 고정"),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "올바른 QR 코드를 업로드하세요",
    ),
    "port": MessageLookupByLibrary.simpleMessage("포트"),
    "preview": MessageLookupByLibrary.simpleMessage("미리 보기"),
    "process": MessageLookupByLibrary.simpleMessage("프로세스"),
    "profile": MessageLookupByLibrary.simpleMessage("설정 파일"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("올바른 간격을 입력하세요"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("업데이트 간격을 입력하세요"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "설정 파일이 변경되었습니다. 자동 업데이트를 끌까요?",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "설정 파일 이름을 입력하세요",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "올바른 설정 파일 URL을 입력하세요",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "설정 파일 URL을 입력하세요",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("설정 파일"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("설정 파일 정렬"),
    "project": MessageLookupByLibrary.simpleMessage("프로젝트"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage("구독"),
    "providers": MessageLookupByLibrary.simpleMessage("외부 리소스"),
    "proxies": MessageLookupByLibrary.simpleMessage("프록시"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("프록시 체인"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("프록시 그룹"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("프록시 노드"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("프록시 공급자"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("완전 검정"),
    "qrcode": MessageLookupByLibrary.simpleMessage("QR 코드"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage("QR 코드로 설정 파일 가져오기"),
    "quickAdd": MessageLookupByLibrary.simpleMessage("빠른 추가"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("무지개"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("최근 요청"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Redir 포트"),
    "redo": MessageLookupByLibrary.simpleMessage("다시 실행"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("메모리 정리"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage("메모리 정리 실패"),
    "remote": MessageLookupByLibrary.simpleMessage("원격"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage("원격 목적지"),
    "remove": MessageLookupByLibrary.simpleMessage("제거"),
    "replace": MessageLookupByLibrary.simpleMessage("바꾸기"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("모두 바꾸기"),
    "request": MessageLookupByLibrary.simpleMessage("요청"),
    "requests": MessageLookupByLibrary.simpleMessage("요청"),
    "reset": MessageLookupByLibrary.simpleMessage("초기화"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "이 페이지에 변경사항이 있습니다. 초기화할까요?",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("리소스"),
    "respectRules": MessageLookupByLibrary.simpleMessage("규칙 따르기"),
    "restart": MessageLookupByLibrary.simpleMessage("다시 시작"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage("코어를 다시 시작할까요?"),
    "restore": MessageLookupByLibrary.simpleMessage("복원"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage("복원 방식"),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage("호환"),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage("덮어쓰기"),
    "retry": MessageLookupByLibrary.simpleMessage("다시 시도"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("라우팅 주소"),
    "routeMode": MessageLookupByLibrary.simpleMessage("라우팅 모드"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage("사설 주소 우회"),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage("설정 사용"),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("규칙"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage("논리 규칙 AND"),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage("전체 도메인 일치"),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "도메인 키워드 일치",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "도메인 정규식 일치",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "도메인 접미사 일치",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "와일드카드 일치: * 및 ?만 지원",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "DSCP 마크 일치(tproxy UDP 인바운드만)",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "목적지 포트 범위 일치",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage("IP 국가 코드 일치"),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "Geosite 도메인 일치",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage("인바운드 이름 일치"),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage("인바운드 포트 일치"),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage("인바운드 유형 일치"),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "인바운드 사용자 이름 일치: 여러 이름은 /로 구분",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage("IP의 ASN 일치"),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "IP 주소 범위 일치: IP-CIDR6은 별칭입니다",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage("IP 주소 범위 일치"),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "IP 접미사 범위 일치",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "조건 없이 모든 요청 일치",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "TCP 또는 UDP 일치",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage("논리 규칙 NOT"),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage("논리 규칙 OR"),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 이름 일치: Android에서는 패키지 이름",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 이름 정규식 일치: Android에서는 패키지 이름",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 이름 와일드카드 일치: * 및 ?만 지원",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 전체 경로 일치",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 경로 정규식 일치",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "프로세스 경로 와일드카드 일치: * 및 ?만 지원",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "재매칭 이름 일치: 여러 이름은 /로 구분",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "규칙 집합 참조: rule-providers 필요",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "출발지 IP 국가 코드 일치",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "출발지 IP ASN 일치",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "출발지 IP 범위 일치",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "출발지 IP 접미사 범위 일치",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "출발지 포트 범위 일치",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "하위 규칙 일치: 괄호에 주의하세요",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "Linux 사용자 ID 일치",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("규칙 이름"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BitTorrent 직접 연결",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "DNS over TLS 차단",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage("QUIC 차단"),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage("STUN 차단"),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage("LAN 직접 연결"),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple 및 Microsoft 직접 연결",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("규칙 공급자"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("규칙 집합"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("규칙 대상"),
    "rules": MessageLookupByLibrary.simpleMessage("규칙"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("실행 시간"),
    "safeMode": MessageLookupByLibrary.simpleMessage("안전 모드"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("저장"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("변경사항을 저장할까요?"),
    "script": MessageLookupByLibrary.simpleMessage("스크립트"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage("선택 항목으로 이동"),
    "search": MessageLookupByLibrary.simpleMessage("검색"),
    "seconds": MessageLookupByLibrary.simpleMessage("초"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("모두 선택"),
    "selected": MessageLookupByLibrary.simpleMessage("선택됨"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("서버"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("사용 가능"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("차단됨"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("확인"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("모두 확인"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("출시 예정"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage("허용되지 않는 통신사"),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("확인 실패"),
    "serviceManage": MessageLookupByLibrary.simpleMessage("서비스 관리"),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage("오리지널 콘텐츠만"),
    "servicePending": MessageLookupByLibrary.simpleMessage("미확인"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage("접근 제한"),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("서비스 상태"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("사용 불가"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage(
      "지원하지 않는 지역",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "show": MessageLookupByLibrary.simpleMessage("표시"),
    "showLess": MessageLookupByLibrary.simpleMessage("접기"),
    "showMore": MessageLookupByLibrary.simpleMessage("펼치기"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "알림에 중지 버튼 표시",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("간결"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage("사이드바 흐림"),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("최소화 상태로 시작"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("하나 추가"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("크기"),
    "slide": MessageLookupByLibrary.simpleMessage("슬라이드"),
    "socksPort": MessageLookupByLibrary.simpleMessage("SOCKS 포트"),
    "sort": MessageLookupByLibrary.simpleMessage("정렬"),
    "source": MessageLookupByLibrary.simpleMessage("출처"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("출발지 IP"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("지정 프록시"),
    "specialRules": MessageLookupByLibrary.simpleMessage("지정 규칙"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage("속도 통계"),
    "standard": MessageLookupByLibrary.simpleMessage("기본"),
    "start": MessageLookupByLibrary.simpleMessage("시작"),
    "startVpn": MessageLookupByLibrary.simpleMessage("VPN 시작 중…"),
    "status": MessageLookupByLibrary.simpleMessage("상태"),
    "stop": MessageLookupByLibrary.simpleMessage("중지"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("VPN 중지 중…"),
    "strategy": MessageLookupByLibrary.simpleMessage("전략"),
    "style": MessageLookupByLibrary.simpleMessage("스타일"),
    "subRule": MessageLookupByLibrary.simpleMessage("하위 규칙"),
    "submit": MessageLookupByLibrary.simpleMessage("제출"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage("구독 정보"),
    "suspended": MessageLookupByLibrary.simpleMessage("일시 중지됨…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("설정 파일 전환"),
    "sync": MessageLookupByLibrary.simpleMessage("동기화"),
    "system": MessageLookupByLibrary.simpleMessage("시스템"),
    "systemApp": MessageLookupByLibrary.simpleMessage("시스템 앱"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("시스템 프록시"),
    "tab": MessageLookupByLibrary.simpleMessage("탭"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("탭 애니메이션"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("TCP 동시 연결"),
    "testUrl": MessageLookupByLibrary.simpleMessage("검사 URL"),
    "textScale": MessageLookupByLibrary.simpleMessage("글자 크기"),
    "theme": MessageLookupByLibrary.simpleMessage("테마"),
    "themeColor": MessageLookupByLibrary.simpleMessage("테마 색상"),
    "themeMode": MessageLookupByLibrary.simpleMessage("테마 모드"),
    "tight": MessageLookupByLibrary.simpleMessage("좁게"),
    "time": MessageLookupByLibrary.simpleMessage("시간"),
    "timeout": MessageLookupByLibrary.simpleMessage("시간 초과"),
    "tip": MessageLookupByLibrary.simpleMessage("안내"),
    "toggle": MessageLookupByLibrary.simpleMessage("전환"),
    "tolerance": MessageLookupByLibrary.simpleMessage("허용 오차"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("톤 강조"),
    "tools": MessageLookupByLibrary.simpleMessage("도구"),
    "torch": MessageLookupByLibrary.simpleMessage("손전등"),
    "total": MessageLookupByLibrary.simpleMessage("합계"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("전체 데이터"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("TProxy 포트"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("데이터 사용량"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage("관리자 권한에서만 사용 가능"),
    "turnOff": MessageLookupByLibrary.simpleMessage("끄기"),
    "turnOn": MessageLookupByLibrary.simpleMessage("켜기"),
    "undo": MessageLookupByLibrary.simpleMessage("실행 취소"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("통합 지연 시간"),
    "unknown": MessageLookupByLibrary.simpleMessage("알 수 없음"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage(
      "알 수 없는 네트워크 오류",
    ),
    "unmaximize": MessageLookupByLibrary.simpleMessage("이전 크기로"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("창 고정 해제"),
    "update": MessageLookupByLibrary.simpleMessage("업데이트"),
    "upload": MessageLookupByLibrary.simpleMessage("업로드"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("URL에서 설정 파일 가져오기"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("hosts 사용"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage("시스템 hosts 사용"),
    "usedTraffic": MessageLookupByLibrary.simpleMessage("사용한 데이터"),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("값"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("선명"),
    "view": MessageLookupByLibrary.simpleMessage("보기"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "VPN 설정 변경 감지",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage("VPN을 다시 시작하면 적용됩니다"),
    "whitelistMode": MessageLookupByLibrary.simpleMessage("허용 목록 모드"),
    "writeToSystem": MessageLookupByLibrary.simpleMessage("시스템에 기록"),
    "yearsAgo": m45,
  };
}
