// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(count, skipped) =>
      "Будет добавлено: ${count}, пропущено (уже есть): ${skipped}";

  static String m1(code) =>
      "Windows заблокировала FastAICore.exe (ошибка ${code}). Установите официальный подписанный выпуск или попросите администратора проверить политику управления приложениями.";

  static String m2(name) =>
      "FastAI дважды не завершил запуск. Конфигурация ${name} приостановлена, чтобы избежать повторных сбоев. Повторите подключение на главной странице.";

  static String m3(url) => "Создать профиль по ссылке ${url}?";

  static String m4(count) =>
      "${Intl.plural(count, one: '${count} день назад', few: '${count} дня назад', many: '${count} дней назад', other: '${count} дня назад')}";

  static String m5(label) =>
      "Вы уверены, что хотите удалить выбранные элементы (${label})?";

  static String m6(label) => "Вы уверены, что хотите удалить «${label}»?";

  static String m7(label) => "Сведения: ${label}";

  static String m8(label) => "Поле «${label}» не может быть пустым";

  static String m9(label) => "«${label}» уже существует";

  static String m10(name) => "${name}: уже последняя версия";

  static String m11(name) => "${name}: обновлено";

  static String m12(count) =>
      "${Intl.plural(count, one: '${count} час назад', few: '${count} часа назад', many: '${count} часов назад', other: '${count} часа назад')}";

  static String m13(count) =>
      "${Intl.plural(count, one: '${count} час', few: '${count} часа', many: '${count} часов', other: '${count} часа')}";

  static String m14(target) => "${target} — недопустимая политика";

  static String m15(ruleSet) => "${ruleSet} — недопустимый набор правил";

  static String m16(subRule) => "${subRule} — недопустимый SUB_RULE";

  static String m17(line, message) => "Строка ${line}: ${message}";

  static String m18(label, max) => "«${label}» — не более ${max} символов";

  static String m19(size) => "Освобождено ${size}";

  static String m20(count) =>
      "${Intl.plural(count, one: '${count} минуту назад', few: '${count} минуты назад', many: '${count} минут назад', other: '${count} минуты назад')}";

  static String m21(count) =>
      "${Intl.plural(count, one: '${count} месяц назад', few: '${count} месяца назад', many: '${count} месяцев назад', other: '${count} месяца назад')}";

  static String m22(code) =>
      "Сервер запретил доступ (HTTP ${code}). Возможно, ссылка устарела или учётные данные неверны";

  static String m23(code) => "Сервер отклонил запрос (HTTP ${code})";

  static String m24(code) =>
      "По этому адресу ничего не найдено (HTTP ${code}). Проверьте правильность URL";

  static String m25(detail) => "Сетевой запрос не выполнен: ${detail}";

  static String m26(code) =>
      "На сервере произошла ошибка (HTTP ${code}). Повторите попытку позже";

  static String m27(label) => "Пока нет: ${label}";

  static String m28(message) =>
      "Ядро не может разобрать этот прокси: ${message}";

  static String m29(name) =>
      "Имя ${name} уже занято другим прокси или группой прокси";

  static String m30(path) =>
      "Группы прокси ссылаются друг на друга по кругу: ${path}";

  static String m31(names) => "Эти провайдеры прокси не существуют: ${names}";

  static String m32(names) => "Эти прокси или политики не существуют: ${names}";

  static String m33(name) =>
      "${name} — встроенное имя политики, его нельзя использовать";

  static String m34(names) =>
      "Собственные группы прокси профиля ссылаются на прокси, которых больше нет среди пользовательских: ${names}";

  static String m35(label, profiles) =>
      "«${label}» всё ещё используется в пользовательских группах прокси или правилах профилей: ${profiles}. Сначала уберите его оттуда";

  static String m36(profiles, label) =>
      "В подписках профилей ${profiles} уже есть «${label}», и после переименования они будут использовать его. Выберите другое имя";

  static String m37(count) => "${count} прокси";

  static String m38(count) =>
      "${Intl.plural(count, one: '${count} правило', few: '${count} правила', many: '${count} правил', other: '${count} правила')}";

  static String m39(appName) => "${appName} (Безопасный режим)";

  static String m40(count) =>
      "${Intl.plural(count, one: '${count} секунда', few: '${count} секунды', many: '${count} секунд', other: '${count} секунды')}";

  static String m41(count) => "Выбрано: ${count}";

  static String m42(time) => "Проверено в ${time}";

  static String m43(label) => "«${label}» — только одно значение";

  static String m44(label) => "Значение «${label}» должно быть URL";

  static String m45(count) =>
      "${Intl.plural(count, one: '${count} год назад', few: '${count} года назад', many: '${count} лет назад', other: '${count} года назад')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("О программе"),
    "accessControl": MessageLookupByLibrary.simpleMessage(
      "Приложения, использующие прокси",
    ),
    "accessControlAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Через VPN проходят только выбранные приложения",
    ),
    "accessControlDesc": MessageLookupByLibrary.simpleMessage(
      "Выберите приложения для включения в VPN или исключения из него",
    ),
    "accessControlDisabledDesc": MessageLookupByLibrary.simpleMessage(
      "Контроль доступа приложений отключён",
    ),
    "accessControlNotAllowDesc": MessageLookupByLibrary.simpleMessage(
      "Выбранные приложения исключаются из VPN",
    ),
    "accessControlSettings": MessageLookupByLibrary.simpleMessage(
      "Настройки контроля доступа",
    ),
    "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
    "action": MessageLookupByLibrary.simpleMessage("Действие"),
    "actionDelayTest": MessageLookupByLibrary.simpleMessage(
      "Проверить все задержки",
    ),
    "actionDirectMode": MessageLookupByLibrary.simpleMessage("Прямой режим"),
    "actionGlobalMode": MessageLookupByLibrary.simpleMessage(
      "Глобальный режим",
    ),
    "actionMode": MessageLookupByLibrary.simpleMessage("Переключить режим"),
    "actionProxy": MessageLookupByLibrary.simpleMessage("Системный прокси"),
    "actionRuleMode": MessageLookupByLibrary.simpleMessage("Режим правил"),
    "actionStart": MessageLookupByLibrary.simpleMessage("Старт/Стоп"),
    "actionTun": MessageLookupByLibrary.simpleMessage("TUN"),
    "actionUpdateProfiles": MessageLookupByLibrary.simpleMessage(
      "Обновить профили",
    ),
    "actionView": MessageLookupByLibrary.simpleMessage("Показать/Скрыть"),
    "add": MessageLookupByLibrary.simpleMessage("Добавить"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Добавить профиль"),
    "addRule": MessageLookupByLibrary.simpleMessage("Добавить правило"),
    "addedRules": MessageLookupByLibrary.simpleMessage("Добавленные правила"),
    "address": MessageLookupByLibrary.simpleMessage("Адрес"),
    "agree": MessageLookupByLibrary.simpleMessage("Согласен"),
    "allowBypass": MessageLookupByLibrary.simpleMessage(
      "Разрешить приложениям обходить VPN",
    ),
    "allowLan": MessageLookupByLibrary.simpleMessage("Разрешить LAN"),
    "answers": MessageLookupByLibrary.simpleMessage("Ответы"),
    "app": MessageLookupByLibrary.simpleMessage("Приложение"),
    "appAccessControl": MessageLookupByLibrary.simpleMessage(
      "Контроль доступа приложений",
    ),
    "appendSystemDns": MessageLookupByLibrary.simpleMessage(
      "Добавлять системный DNS",
    ),
    "authentication": MessageLookupByLibrary.simpleMessage("Аутентификация"),
    "authorize": MessageLookupByLibrary.simpleMessage("Разрешить"),
    "authorized": MessageLookupByLibrary.simpleMessage("Разрешено"),
    "auto": MessageLookupByLibrary.simpleMessage("Авто"),
    "autoCheckUpdate": MessageLookupByLibrary.simpleMessage(
      "Автопроверка обновлений",
    ),
    "autoLaunch": MessageLookupByLibrary.simpleMessage("Автозапуск"),
    "autoRun": MessageLookupByLibrary.simpleMessage("Подключаться при запуске"),
    "autoSetSystemDns": MessageLookupByLibrary.simpleMessage(
      "Автонастройка системного DNS",
    ),
    "autoUpdate": MessageLookupByLibrary.simpleMessage("Автообновление"),
    "autoUpdateInterval": MessageLookupByLibrary.simpleMessage(
      "Интервал автообновления (минуты)",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Назад"),
    "backup": MessageLookupByLibrary.simpleMessage("Резервное копирование"),
    "backupFromNewerVersion": MessageLookupByLibrary.simpleMessage(
      "Резервная копия создана более новой версией приложения. Обновите приложение перед восстановлением",
    ),
    "basicInfo": MessageLookupByLibrary.simpleMessage("Основная информация"),
    "batchAdd": MessageLookupByLibrary.simpleMessage("Массовое добавление"),
    "batchListInputTip": MessageLookupByLibrary.simpleMessage(
      "По одному значению на строку или через запятую",
    ),
    "batchMapInputTip": MessageLookupByLibrary.simpleMessage(
      "По одной записи на строку: ключ, пробел, значение",
    ),
    "batchPreviewTip": m0,
    "behavior": MessageLookupByLibrary.simpleMessage("Поведение"),
    "bind": MessageLookupByLibrary.simpleMessage("Привязать"),
    "blacklistMode": MessageLookupByLibrary.simpleMessage(
      "Режим чёрного списка",
    ),
    "blockConnection": MessageLookupByLibrary.simpleMessage(
      "Заблокировать соединение",
    ),
    "bypassDomain": MessageLookupByLibrary.simpleMessage("Исключённые домены"),
    "cache": MessageLookupByLibrary.simpleMessage("Кэш"),
    "cacheAlgorithm": MessageLookupByLibrary.simpleMessage("Алгоритм кэша"),
    "cacheCorrupt": MessageLookupByLibrary.simpleMessage(
      "Кэш повреждён. Очистить его?",
    ),
    "cacheMaxSize": MessageLookupByLibrary.simpleMessage("Размер кэша"),
    "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "Разрешите доступ к камере в системных настройках, чтобы сканировать QR-коды, или выберите изображение QR-кода из галереи.",
    ),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Требуется доступ к камере",
    ),
    "cameraUnavailable": MessageLookupByLibrary.simpleMessage(
      "Камера недоступна",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cancelSelectAll": MessageLookupByLibrary.simpleMessage("Снять выделение"),
    "changeProxyFailedTip": MessageLookupByLibrary.simpleMessage(
      "Не удалось переключить прокси; восстановлен предыдущий выбор",
    ),
    "changelogBreaking": MessageLookupByLibrary.simpleMessage(
      "Важные изменения",
    ),
    "changelogFeatures": MessageLookupByLibrary.simpleMessage("Новые функции"),
    "changelogFixes": MessageLookupByLibrary.simpleMessage("Исправления"),
    "changelogPerformance": MessageLookupByLibrary.simpleMessage(
      "Производительность",
    ),
    "changelogReverts": MessageLookupByLibrary.simpleMessage("Откаты"),
    "checkCertificate": MessageLookupByLibrary.simpleMessage(
      "Проверять TLS-сертификаты",
    ),
    "checkUpdate": MessageLookupByLibrary.simpleMessage("Проверить обновления"),
    "checkUpdateError": MessageLookupByLibrary.simpleMessage(
      "У вас уже последняя версия",
    ),
    "clearSearch": MessageLookupByLibrary.simpleMessage("Очистить поиск"),
    "clipboardExport": MessageLookupByLibrary.simpleMessage(
      "Экспорт в буфер обмена",
    ),
    "clipboardImport": MessageLookupByLibrary.simpleMessage(
      "Импорт из буфера обмена",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
    "closeConnections": MessageLookupByLibrary.simpleMessage(
      "Закрыть соединения",
    ),
    "color": MessageLookupByLibrary.simpleMessage("Цвет"),
    "columns": MessageLookupByLibrary.simpleMessage("Столбцы"),
    "compatible": MessageLookupByLibrary.simpleMessage("Режим совместимости"),
    "confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "confirmExitWindow": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите закрыть текущее окно?",
    ),
    "connected": MessageLookupByLibrary.simpleMessage("Подключено"),
    "connecting": MessageLookupByLibrary.simpleMessage("Подключение…"),
    "connection": MessageLookupByLibrary.simpleMessage("Соединение"),
    "connections": MessageLookupByLibrary.simpleMessage("Соединения"),
    "connectivity": MessageLookupByLibrary.simpleMessage("Подключение: "),
    "content": MessageLookupByLibrary.simpleMessage("Содержимое"),
    "contentScheme": MessageLookupByLibrary.simpleMessage("Контентная"),
    "copy": MessageLookupByLibrary.simpleMessage("Копировать"),
    "copyEnvVar": MessageLookupByLibrary.simpleMessage(
      "Копировать переменные окружения",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Копировать ссылку"),
    "copySuccess": MessageLookupByLibrary.simpleMessage("Скопировано"),
    "core": MessageLookupByLibrary.simpleMessage("Ядро"),
    "coreBlockedByPolicyTip": m1,
    "coreBlockedBySmartAppControlTip": MessageLookupByLibrary.simpleMessage(
      "Smart App Control в Windows заблокировал FastAICore.exe. Установите официальный подписанный выпуск или обратитесь в поддержку. Не отключайте защиту Windows.",
    ),
    "coreStatus": MessageLookupByLibrary.simpleMessage("Статус ядра"),
    "country": MessageLookupByLibrary.simpleMessage("Регион"),
    "crashDetected": MessageLookupByLibrary.simpleMessage("Обнаружен сбой"),
    "crashDetectedTip": m2,
    "crashlytics": MessageLookupByLibrary.simpleMessage("Аналитика сбоев"),
    "crashlyticsTip": MessageLookupByLibrary.simpleMessage(
      "При включении в случае сбоя приложения автоматически загружаются логи сбоя без конфиденциальной информации",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Создать"),
    "createProfileFromUrlTip": m3,
    "creationTime": MessageLookupByLibrary.simpleMessage("Время создания"),
    "custom": MessageLookupByLibrary.simpleMessage("Вручную"),
    "cut": MessageLookupByLibrary.simpleMessage("Вырезать"),
    "dark": MessageLookupByLibrary.simpleMessage("Тёмная"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Панель"),
    "dataChangedSave": MessageLookupByLibrary.simpleMessage(
      "Обнаружены изменения данных. Сохранить их?",
    ),
    "dataCollectionContent": MessageLookupByLibrary.simpleMessage(
      "Это приложение использует Firebase Crashlytics для сбора информации о сбоях, чтобы повысить стабильность.\nСобираемые данные включают сведения об устройстве и подробности сбоя и не содержат личных конфиденциальных данных.\nЭту функцию можно отключить в настройках.",
    ),
    "dataCollectionTip": MessageLookupByLibrary.simpleMessage(
      "Уведомление о сборе данных",
    ),
    "databaseWriteFailedTip": MessageLookupByLibrary.simpleMessage(
      "Не удалось сохранить изменение; оно отменено",
    ),
    "daysAgo": m4,
    "defaultText": MessageLookupByLibrary.simpleMessage("По умолчанию"),
    "delay": MessageLookupByLibrary.simpleMessage("Задержка"),
    "delayTest": MessageLookupByLibrary.simpleMessage("Тест задержки"),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "deleteMultipTip": m5,
    "deleteTip": m6,
    "desc": MessageLookupByLibrary.simpleMessage(
      "Многоплатформенный прокси-клиент на основе ClashMeta: простой и удобный, с открытым исходным кодом и без рекламы.",
    ),
    "destination": MessageLookupByLibrary.simpleMessage("Назначение"),
    "destinationGeoIP": MessageLookupByLibrary.simpleMessage(
      "GeoIP назначения",
    ),
    "destinationIPASN": MessageLookupByLibrary.simpleMessage(
      "ASN IP назначения",
    ),
    "details": m7,
    "detectionTip": MessageLookupByLibrary.simpleMessage(
      "Использует сторонний API; только для справки",
    ),
    "dialerProxy": MessageLookupByLibrary.simpleMessage(
      "Прокси для подключения",
    ),
    "direct": MessageLookupByLibrary.simpleMessage("Прямой"),
    "disableUDP": MessageLookupByLibrary.simpleMessage("Отключить UDP"),
    "disabled": MessageLookupByLibrary.simpleMessage("Выключено"),
    "disconnected": MessageLookupByLibrary.simpleMessage("Отключено"),
    "discoverNewVersion": MessageLookupByLibrary.simpleMessage(
      "Доступна новая версия",
    ),
    "dnsHijacking": MessageLookupByLibrary.simpleMessage("Перехват DNS"),
    "dnsMode": MessageLookupByLibrary.simpleMessage("Режим DNS"),
    "dnsQueries": MessageLookupByLibrary.simpleMessage("DNS-запросы"),
    "docked": MessageLookupByLibrary.simpleMessage("Закреплённая"),
    "domain": MessageLookupByLibrary.simpleMessage("Домен"),
    "download": MessageLookupByLibrary.simpleMessage("Загрузка"),
    "edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
    "editRule": MessageLookupByLibrary.simpleMessage("Редактировать правило"),
    "emptyTip": m8,
    "en": MessageLookupByLibrary.simpleMessage("English"),
    "enabled": MessageLookupByLibrary.simpleMessage("Включено"),
    "entries": MessageLookupByLibrary.simpleMessage(" записей"),
    "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "exclude": MessageLookupByLibrary.simpleMessage("Скрыть из недавних задач"),
    "excludeDesc": MessageLookupByLibrary.simpleMessage(
      "Скрывать приложение из недавних задач, когда оно в фоне",
    ),
    "excludeType": MessageLookupByLibrary.simpleMessage("Исключаемые типы"),
    "existsTip": m9,
    "exit": MessageLookupByLibrary.simpleMessage("Выход"),
    "exitFullScreen": MessageLookupByLibrary.simpleMessage(
      "Выйти из полноэкранного режима",
    ),
    "expand": MessageLookupByLibrary.simpleMessage("Стандартный"),
    "expectedStatus": MessageLookupByLibrary.simpleMessage("Ожидаемый статус"),
    "expireTime": MessageLookupByLibrary.simpleMessage("Срок действия"),
    "exportFile": MessageLookupByLibrary.simpleMessage("Экспорт файла"),
    "exportLogs": MessageLookupByLibrary.simpleMessage("Экспорт логов"),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Экспорт выполнен"),
    "expressiveScheme": MessageLookupByLibrary.simpleMessage("Экспрессивная"),
    "externalController": MessageLookupByLibrary.simpleMessage(
      "Внешний контроллер",
    ),
    "externalLink": MessageLookupByLibrary.simpleMessage("Внешняя ссылка"),
    "extraLarge": MessageLookupByLibrary.simpleMessage("Очень крупный"),
    "fade": MessageLookupByLibrary.simpleMessage("Растворение"),
    "fallbackFilter": MessageLookupByLibrary.simpleMessage("Фильтр fallback"),
    "fdAccountStale": MessageLookupByLibrary.simpleMessage(
      "Не удалось обновить данные аккаунта. Они будут проверены при подключении.",
    ),
    "fdAutoCheckUpdateDesc": MessageLookupByLibrary.simpleMessage(
      "Проверяет новые версии в фоне. Скачивание и установка выполняются вручную.",
    ),
    "fdAutoRoute": MessageLookupByLibrary.simpleMessage("Автоматический выбор"),
    "fdBackgroundNotifications": MessageLookupByLibrary.simpleMessage(
      "Фоновая работа и уведомления",
    ),
    "fdBanned": MessageLookupByLibrary.simpleMessage("Аккаунт заблокирован"),
    "fdCertificateError": MessageLookupByLibrary.simpleMessage(
      "Не удалось проверить сертификат сервера. Проверьте системное время или обратитесь в поддержку.",
    ),
    "fdCheckReference": MessageLookupByLibrary.simpleMessage(
      "Системное подключение",
    ),
    "fdCheckTcp": MessageLookupByLibrary.simpleMessage("Соединение TCP"),
    "fdCheckTls": MessageLookupByLibrary.simpleMessage("Защищённое соединение"),
    "fdChooseRoute": MessageLookupByLibrary.simpleMessage("Выбрать маршрут"),
    "fdClientChecks": MessageLookupByLibrary.simpleMessage("Настройки клиента"),
    "fdClientUnavailable": MessageLookupByLibrary.simpleMessage(
      "FastAI временно недоступен. Обратитесь в поддержку на сайте.",
    ),
    "fdCompareBothFailed": MessageLookupByLibrary.simpleMessage(
      "Оба пути не прошли проверку. Возможна общая проблема сети или ограничение адреса; сопоставьте результаты по слоям.",
    ),
    "fdCompareBothPassed": MessageLookupByLibrary.simpleMessage(
      "Оба пути достигли тестового адреса.",
    ),
    "fdComparePaths": MessageLookupByLibrary.simpleMessage(
      "Сравнение подключений",
    ),
    "fdCompareRouteFailed": MessageLookupByLibrary.simpleMessage(
      "Системный путь работает, выбранный маршрут — нет. Начните с маршрута; причина ещё не установлена.",
    ),
    "fdCompareSystemFailed": MessageLookupByLibrary.simpleMessage(
      "Выбранный маршрут работает, системный — нет. Проверьте DNS, маршрутизацию и ограничения сети.",
    ),
    "fdConnect": MessageLookupByLibrary.simpleMessage("Подключить"),
    "fdConnected": MessageLookupByLibrary.simpleMessage("Подключено"),
    "fdConnection": MessageLookupByLibrary.simpleMessage("Подключение"),
    "fdConnectionFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось подключиться. Повторите попытку или выберите другой сервер.",
    ),
    "fdCopyJson": MessageLookupByLibrary.simpleMessage(
      "Копировать технический отчёт",
    ),
    "fdCreditBalance": MessageLookupByLibrary.simpleMessage(
      "Остаток независимого трафика",
    ),
    "fdCreditHelp": MessageLookupByLibrary.simpleMessage(
      "Дополнительный трафик учитывается отдельно и не обнуляется при сбросе периода. Доступ и срок действия зависят от вашей учётной записи.",
    ),
    "fdCurrentRoute": MessageLookupByLibrary.simpleMessage("Текущий сервер"),
    "fdDiagnosticChanged": MessageLookupByLibrary.simpleMessage(
      "Настройки изменились во время проверки. Повторите диагностику.",
    ),
    "fdDiagnosticCoreFail": MessageLookupByLibrary.simpleMessage(
      "Ядро или список серверов не готовы. Обновите серверы и переподключитесь.",
    ),
    "fdDiagnosticDisconnected": MessageLookupByLibrary.simpleMessage(
      "Нет подключения. Подключитесь для проверки маршрута.",
    ),
    "fdDiagnosticDns": MessageLookupByLibrary.simpleMessage("Системный DNS"),
    "fdDiagnosticDnsFail": MessageLookupByLibrary.simpleMessage(
      "Ошибка DNS или тайм-аут. Проверьте сеть или попробуйте другую.",
    ),
    "fdDiagnosticDnsOk": MessageLookupByLibrary.simpleMessage(
      "Публичные тестовые домены успешно разрешены.",
    ),
    "fdDiagnosticEntry": MessageLookupByLibrary.simpleMessage(
      "Найти проблемы подключения и восстановить связь",
    ),
    "fdDiagnosticProxyConflict": MessageLookupByLibrary.simpleMessage(
      "Прокси/PAC Windows не соответствует режиму. Проверьте другие VPN и настройки прокси, затем переподключитесь.",
    ),
    "fdDiagnosticProxyFail": MessageLookupByLibrary.simpleMessage(
      "Локальный порт прокси не отвечает. Переподключитесь и повторите проверку.",
    ),
    "fdDiagnosticProxyOk": MessageLookupByLibrary.simpleMessage(
      "Локальный порт доступен; удалённый маршрут не проверен.",
    ),
    "fdDiagnosticProxySettingsOk": MessageLookupByLibrary.simpleMessage(
      "Ручной прокси и PAC Windows соответствуют текущему режиму.",
    ),
    "fdDiagnosticRetry": MessageLookupByLibrary.simpleMessage(
      "Проверить снова",
    ),
    "fdDiagnosticRoute": MessageLookupByLibrary.simpleMessage(
      "Текущий маршрут",
    ),
    "fdDiagnosticRouteFail": MessageLookupByLibrary.simpleMessage(
      "Тестовый адрес недоступен через выбранный маршрут. Смените сервер; если не помогает, проверьте DNS и сеть.",
    ),
    "fdDiagnosticRouteOk": MessageLookupByLibrary.simpleMessage(
      "Выбранный маршрут достиг тестового HTTPS-адреса. Другие сервисы могут работать иначе.",
    ),
    "fdDiagnosticRunning": MessageLookupByLibrary.simpleMessage(
      "Проверка подключения…",
    ),
    "fdDiagnosticSafe": MessageLookupByLibrary.simpleMessage(
      "В безопасном режиме проверка прокси и системных настроек пропущена.",
    ),
    "fdDiagnosticSettingsOk": MessageLookupByLibrary.simpleMessage(
      "Ядро, серверы и разрешения готовы. Не все системные настройки проверены.",
    ),
    "fdDiagnosticSkipped": MessageLookupByLibrary.simpleMessage(
      "Эта проверка не применяется к текущему состоянию подключения или устройству.",
    ),
    "fdDiagnosticTunDenied": MessageLookupByLibrary.simpleMessage(
      "Нет разрешения TUN. Переподключитесь и разрешите доступ или выберите системный прокси.",
    ),
    "fdDiagnosticUnverified": MessageLookupByLibrary.simpleMessage(
      "Не удалось завершить проверку. Повторите её или следуйте указаниям ниже.",
    ),
    "fdDiagnosticWebsiteFail": MessageLookupByLibrary.simpleMessage(
      "Не удалось проверить тестовый адрес. Это само по себе не означает недоступность всего Интернета.",
    ),
    "fdDiagnosticWebsiteOk": MessageLookupByLibrary.simpleMessage(
      "Публичный тестовый адрес вернул ожидаемый ответ.",
    ),
    "fdDisconnect": MessageLookupByLibrary.simpleMessage("Отключить"),
    "fdDisconnected": MessageLookupByLibrary.simpleMessage("Не подключено"),
    "fdDisconnecting": MessageLookupByLibrary.simpleMessage("Отключение…"),
    "fdEmail": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "fdExhausted": MessageLookupByLibrary.simpleMessage(
      "Трафик исчерпан. Продлите тариф или купите пакет.",
    ),
    "fdExpired": MessageLookupByLibrary.simpleMessage("Подписка истекла"),
    "fdExpiry": MessageLookupByLibrary.simpleMessage("Окончание периода"),
    "fdGlobalMode": MessageLookupByLibrary.simpleMessage("Глобальный режим"),
    "fdHealthIncomplete": MessageLookupByLibrary.simpleMessage(
      "Проверка завершена, часть пунктов не проверена",
    ),
    "fdHealthIssues": MessageLookupByLibrary.simpleMessage(
      "Есть пункты, требующие внимания",
    ),
    "fdHealthPassed": MessageLookupByLibrary.simpleMessage(
      "Выполненные проверки пройдены",
    ),
    "fdHealthScope": MessageLookupByLibrary.simpleMessage(
      "Посмотрите результаты ниже. Исправления выполняются только по вашему выбору.",
    ),
    "fdHeroSubtitle": MessageLookupByLibrary.simpleMessage(
      "Выберите сервер и подключитесь одним нажатием.",
    ),
    "fdHome": MessageLookupByLibrary.simpleMessage("Главная"),
    "fdInvalidConfig": MessageLookupByLibrary.simpleMessage(
      "Сервер вернул некорректную конфигурацию. Повторите синхронизацию или обратитесь в поддержку.",
    ),
    "fdInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Неверная почта или пароль",
    ),
    "fdLatestVersion": MessageLookupByLibrary.simpleMessage(
      "Установлена последняя версия",
    ),
    "fdLocalProxy": MessageLookupByLibrary.simpleMessage("Локальный прокси"),
    "fdLocalProxyHint": MessageLookupByLibrary.simpleMessage(
      "HTTP / SOCKS5 · Подключитесь перед использованием адреса.",
    ),
    "fdLogin": MessageLookupByLibrary.simpleMessage("Войти"),
    "fdLogout": MessageLookupByLibrary.simpleMessage("Выйти"),
    "fdNetworkChecks": MessageLookupByLibrary.simpleMessage(
      "Сетевое соединение",
    ),
    "fdNetworkDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Диагностика сети",
    ),
    "fdNetworkError": MessageLookupByLibrary.simpleMessage(
      "Не удалось подключиться к сервису. Проверьте сеть и повторите попытку.",
    ),
    "fdNextReset": MessageLookupByLibrary.simpleMessage(
      "Следующий автоматический сброс (местное время)",
    ),
    "fdNoExpiry": MessageLookupByLibrary.simpleMessage("Без срока периода"),
    "fdNoPlan": MessageLookupByLibrary.simpleMessage(
      "Выберите тариф для начала",
    ),
    "fdNodesUnavailable": MessageLookupByLibrary.simpleMessage(
      "Нет доступных маршрутов. Проверьте доступ учётной записи на сайте.",
    ),
    "fdOfficialWebsite": MessageLookupByLibrary.simpleMessage(
      "Официальный сайт",
    ),
    "fdPeriodUsed": MessageLookupByLibrary.simpleMessage(
      "Использовано за период",
    ),
    "fdPlan": MessageLookupByLibrary.simpleMessage("Тариф"),
    "fdPublicConnectivity": MessageLookupByLibrary.simpleMessage(
      "Доступ в Интернет",
    ),
    "fdRateLimited": MessageLookupByLibrary.simpleMessage(
      "Слишком много запросов. Повторите позже.",
    ),
    "fdReferenceCriteria": MessageLookupByLibrary.simpleMessage(
      "Тот же HTTPS-адрес без явного прокси приложения. TUN и системные маршруты могут влиять на путь; обход VPN не гарантирован.",
    ),
    "fdReferenceId": MessageLookupByLibrary.simpleMessage("Номер обращения"),
    "fdRefresh": MessageLookupByLibrary.simpleMessage("Обновить"),
    "fdRegisterHelp": MessageLookupByLibrary.simpleMessage(
      "Регистрация или сброс пароля на сайте",
    ),
    "fdRemaining": MessageLookupByLibrary.simpleMessage(
      "Остаток трафика за период",
    ),
    "fdRepairConfig": MessageLookupByLibrary.simpleMessage(
      "Обновить конфигурацию и подключиться",
    ),
    "fdRepairFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось завершить действие. Проверьте новые результаты и доступ учётной записи.",
    ),
    "fdRepairHint": MessageLookupByLibrary.simpleMessage(
      "Возможен краткий разрыв соединения или смена маршрута. Затем проверка повторится. Проверяются до пяти альтернативных маршрутов.",
    ),
    "fdRepairReconnect": MessageLookupByLibrary.simpleMessage(
      "Переподключиться",
    ),
    "fdRepairRoute": MessageLookupByLibrary.simpleMessage(
      "Найти и выбрать рабочий маршрут",
    ),
    "fdRepairUnresolved": MessageLookupByLibrary.simpleMessage(
      "Действие завершено, но восстановление не подтверждено. Следуйте указаниям ниже.",
    ),
    "fdRepairVerified": MessageLookupByLibrary.simpleMessage(
      "Прокси-маршрут прошёл повторную проверку. Проверьте оставшиеся предупреждения.",
    ),
    "fdRepairWorking": MessageLookupByLibrary.simpleMessage(
      "Выполняется исправление и повторная проверка…",
    ),
    "fdReportCopy": MessageLookupByLibrary.simpleMessage("Копировать отчёт"),
    "fdReportCriteria": MessageLookupByLibrary.simpleMessage("Критерий оценки"),
    "fdReportDnsCriteria": MessageLookupByLibrary.simpleMessage(
      "Оба домена должны вернуть адрес за 8 секунд. Проверяется системный DNS, а не утечки или конкретный вышестоящий сервер DNS.",
    ),
    "fdReportDnsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Проверьте Wi-Fi/кабель и вход в сеть.\n2. Повторите в другой сети.\n3. Передайте отчёт поддержке или администратору.",
    ),
    "fdReportFailed": MessageLookupByLibrary.simpleMessage("Проблема"),
    "fdReportNoData": MessageLookupByLibrary.simpleMessage(
      "Измерения отсутствуют.",
    ),
    "fdReportNoRepair": MessageLookupByLibrary.simpleMessage(
      "Исправление не требуется. Это результат текущей проверки, а не гарантия доступа ко всем сервисам.",
    ),
    "fdReportParameters": MessageLookupByLibrary.simpleMessage(
      "Параметры (ms = миллисекунды)",
    ),
    "fdReportPassed": MessageLookupByLibrary.simpleMessage("Успешно"),
    "fdReportPortCriteria": MessageLookupByLibrary.simpleMessage(
      "TCP-соединение с локальным портом за 8 секунд. Процесс-владелец порта и удалённый маршрут не проверяются.",
    ),
    "fdReportPortSteps": MessageLookupByLibrary.simpleMessage(
      "1. Переподключите FastAI.\n2. Перезапустите приложение.\n3. Отправьте отчёт: сбой порта сам по себе не доказывает конфликт с другим приложением.",
    ),
    "fdReportPrivacy": MessageLookupByLibrary.simpleMessage(
      "Отчёт содержит тестовые адреса и ответы DNS, но не аккаунт, токен, подписку или URL PAC.",
    ),
    "fdReportProxyCriteria": MessageLookupByLibrary.simpleMessage(
      "Проверяется пользовательский прокси Windows; PAC отмечается как возможный конфликт. Брандмауэр, WinHTTP и политики организации не проверяются.",
    ),
    "fdReportProxySteps": MessageLookupByLibrary.simpleMessage(
      "1. Откройте настройки прокси Windows.\n2. Закройте другие VPN и проверьте собственные настройки прокси/PAC. Не удаляйте политики организации.\n3. Переподключите FastAI и повторите.",
    ),
    "fdReportRepair": MessageLookupByLibrary.simpleMessage("Рекомендации"),
    "fdReportRouteCriteria": MessageLookupByLibrary.simpleMessage(
      "Выбранный маршрут должен вернуть HTTP 204 за 8 секунд без ошибки прокси.",
    ),
    "fdReportRouteSteps": MessageLookupByLibrary.simpleMessage(
      "1. Смените сервер и повторите.\n2. Если все серверы недоступны, проверьте DNS и локальный прокси.\n3. Если не работает только тестовый адрес, проверьте нужный сервис и отправьте отчёт.",
    ),
    "fdReportRunAgain": MessageLookupByLibrary.simpleMessage(
      "Запустите обычную версию, подключитесь и повторите. На мобильных устройствах проверка локального порта не выполняется.",
    ),
    "fdReportSettingsSteps": MessageLookupByLibrary.simpleMessage(
      "1. Проверьте вход и доступ аккаунта.\n2. Обновите серверы и подключитесь.\n3. Разрешите TUN или выберите системный прокси.",
    ),
    "fdReportSkipped": MessageLookupByLibrary.simpleMessage("Не выполнено"),
    "fdReportTime": MessageLookupByLibrary.simpleMessage("Начало проверки"),
    "fdReportUnverified": MessageLookupByLibrary.simpleMessage("Не проверено"),
    "fdReportWebCriteria": MessageLookupByLibrary.simpleMessage(
      "Проверка сертификата включена. Ожидается HTTP 204 за 8 секунд, без перехода по перенаправлениям.",
    ),
    "fdReportWebSteps": MessageLookupByLibrary.simpleMessage(
      "1. Проверьте дату и время.\n2. Завершите авторизацию Wi-Fi или попробуйте другую сеть.\n3. Сравните результаты другого адреса и прокси. Не отключайте проверку сертификата.",
    ),
    "fdRequestFailed": MessageLookupByLibrary.simpleMessage(
      "Операция не выполнена. Повторите попытку.",
    ),
    "fdRequestTimeout": MessageLookupByLibrary.simpleMessage(
      "Время ожидания истекло. Проверьте сеть и повторите попытку.",
    ),
    "fdRequired": MessageLookupByLibrary.simpleMessage("Обязательное поле"),
    "fdResetConfirm": MessageLookupByLibrary.simpleMessage(
      "Использовать один сброс для обнуления расхода за текущий период? Независимый трафик, тариф и срок подписки останутся прежними.",
    ),
    "fdResetCredits": MessageLookupByLibrary.simpleMessage(
      "Доступные сбросы трафика",
    ),
    "fdResetEmpty": MessageLookupByLibrary.simpleMessage(
      "Нет расхода за период для сброса.",
    ),
    "fdResetHelp": MessageLookupByLibrary.simpleMessage(
      "Использует один доступный сброс для обнуления расхода за период. Независимый трафик и срок подписки не меняются.",
    ),
    "fdResetInactive": MessageLookupByLibrary.simpleMessage(
      "Для сброса нужна действующая подписка с трафиком за период.",
    ),
    "fdResetNoCredit": MessageLookupByLibrary.simpleMessage(
      "Нет доступных сбросов трафика.",
    ),
    "fdResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Расход за период сброшен. Данные аккаунта обновлены.",
    ),
    "fdResetTraffic": MessageLookupByLibrary.simpleMessage(
      "Сбросить трафик периода",
    ),
    "fdResetUnavailable": MessageLookupByLibrary.simpleMessage(
      "Не удалось проверить доступные сбросы. Обновите данные аккаунта и повторите попытку.",
    ),
    "fdRetryReset": MessageLookupByLibrary.simpleMessage(
      "Проверить результат сброса",
    ),
    "fdRouteChecking": MessageLookupByLibrary.simpleMessage("Проверка…"),
    "fdRouteFailed": MessageLookupByLibrary.simpleMessage("Сбой проверки"),
    "fdRouteLastCheck": MessageLookupByLibrary.simpleMessage("Последний замер"),
    "fdRouteResponsive": MessageLookupByLibrary.simpleMessage(
      "Низкая задержка",
    ),
    "fdRouteSlow": MessageLookupByLibrary.simpleMessage("Высокая задержка"),
    "fdRouteUnmeasured": MessageLookupByLibrary.simpleMessage("Не проверено"),
    "fdSessionExpired": MessageLookupByLibrary.simpleMessage(
      "Сессия истекла. Войдите снова.",
    ),
    "fdShop": MessageLookupByLibrary.simpleMessage("Тарифы"),
    "fdSmartMode": MessageLookupByLibrary.simpleMessage("Умный режим"),
    "fdSync": MessageLookupByLibrary.simpleMessage("Обновить маршруты"),
    "fdSyncFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось обновить маршруты. Повторите попытку перед подключением.",
    ),
    "fdSyncingRoutes": MessageLookupByLibrary.simpleMessage(
      "Синхронизация серверов…",
    ),
    "fdTcpCriteria": MessageLookupByLibrary.simpleMessage(
      "Подключение к публичному проверочному серверу за 8 секунд. Время включает разрешение DNS.",
    ),
    "fdTcpFailed": MessageLookupByLibrary.simpleMessage(
      "Сбой TCP. Проверьте DNS, сеть и фильтрацию; это не доказывает проблему брандмауэра.",
    ),
    "fdTcpPassed": MessageLookupByLibrary.simpleMessage(
      "TCP-соединение с проверочным сервером установлено.",
    ),
    "fdTcpSteps": MessageLookupByLibrary.simpleMessage(
      "1. Проверьте DNS.\n2. Попробуйте другую сеть или войдите в сеть.\n3. Проверьте правила с администратором, не отключая брандмауэр целиком.",
    ),
    "fdTlsCriteria": MessageLookupByLibrary.simpleMessage(
      "TLS через системное хранилище доверия за 8 секунд. Время включает DNS/TCP; срок сертификата записывается при наличии.",
    ),
    "fdTlsFailed": MessageLookupByLibrary.simpleMessage(
      "Сбой TLS. Проверьте время, перехват трафика и доверие сертификату, не отключая проверку.",
    ),
    "fdTlsPassed": MessageLookupByLibrary.simpleMessage(
      "TLS-рукопожатие и проверка сертификата успешны.",
    ),
    "fdUpdateRequired": MessageLookupByLibrary.simpleMessage(
      "Для подключения требуется обновление",
    ),
    "fdUseReset": MessageLookupByLibrary.simpleMessage(
      "Использовать один сброс",
    ),
    "fdValidationError": MessageLookupByLibrary.simpleMessage(
      "Проверьте почту и пароль или пройдите проверку на сайте.",
    ),
    "fdWebAccount": MessageLookupByLibrary.simpleMessage("Управление на сайте"),
    "fdWebAccountHint": MessageLookupByLibrary.simpleMessage(
      "Продление, заказы, настройки аккаунта и поддержка доступны на сайте.",
    ),
    "fdWelcome": MessageLookupByLibrary.simpleMessage(
      "Войдите, чтобы подключиться и выбрать маршрут",
    ),
    "fidelityScheme": MessageLookupByLibrary.simpleMessage("Точная передача"),
    "file": MessageLookupByLibrary.simpleMessage("Файл"),
    "fileDesc": MessageLookupByLibrary.simpleMessage(
      "Загрузить файл профиля напрямую",
    ),
    "fileIsUpdate": MessageLookupByLibrary.simpleMessage(
      "Файл изменён. Сохранить изменения?",
    ),
    "filter": MessageLookupByLibrary.simpleMessage("Фильтр"),
    "findProcessMode": MessageLookupByLibrary.simpleMessage("Поиск процесса"),
    "floating": MessageLookupByLibrary.simpleMessage("Плавающая"),
    "fontFamily": MessageLookupByLibrary.simpleMessage("Шрифт"),
    "fontSize": MessageLookupByLibrary.simpleMessage("Размер"),
    "forceRestartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите принудительно перезапустить ядро?",
    ),
    "format": MessageLookupByLibrary.simpleMessage("Формат"),
    "fruitSaladScheme": MessageLookupByLibrary.simpleMessage("Фруктовый микс"),
    "general": MessageLookupByLibrary.simpleMessage("Общие"),
    "geoAutoUpdate": MessageLookupByLibrary.simpleMessage("Автообновление"),
    "geoSkipped": m10,
    "geoUpdated": m11,
    "geodataLoader": MessageLookupByLibrary.simpleMessage(
      "Geo: экономия памяти",
    ),
    "global": MessageLookupByLibrary.simpleMessage("Глобальный"),
    "go": MessageLookupByLibrary.simpleMessage("Перейти"),
    "goDownload": MessageLookupByLibrary.simpleMessage("Скачать"),
    "helperCorruptTip": MessageLookupByLibrary.simpleMessage(
      "Служба Helper недоступна, поэтому TUN-режим включить нельзя. Переустановите FastAI.",
    ),
    "hideIp": MessageLookupByLibrary.simpleMessage("Скрыть IP"),
    "hideTimeoutProxies": MessageLookupByLibrary.simpleMessage(
      "Скрывать узлы с таймаутом",
    ),
    "hideTimeoutProxiesDesc": MessageLookupByLibrary.simpleMessage(
      "Не показывать узлы, у которых последний тест задержки завершился таймаутом",
    ),
    "host": MessageLookupByLibrary.simpleMessage("Хост"),
    "hours": MessageLookupByLibrary.simpleMessage("часов"),
    "hoursAgo": m12,
    "hoursCount": m13,
    "icon": MessageLookupByLibrary.simpleMessage("Значок"),
    "iconRecords": MessageLookupByLibrary.simpleMessage("История значков"),
    "iconStyle": MessageLookupByLibrary.simpleMessage("Стиль значков"),
    "iconUrl": MessageLookupByLibrary.simpleMessage("URL значка"),
    "import": MessageLookupByLibrary.simpleMessage("Импорт"),
    "importFile": MessageLookupByLibrary.simpleMessage("Импорт из файла"),
    "importFromURL": MessageLookupByLibrary.simpleMessage("Импорт из URL"),
    "inbound": MessageLookupByLibrary.simpleMessage("Входящие"),
    "includeAllProxies": MessageLookupByLibrary.simpleMessage(
      "Включить все прокси",
    ),
    "infiniteTime": MessageLookupByLibrary.simpleMessage("Бессрочно"),
    "init": MessageLookupByLibrary.simpleMessage("Инициализация"),
    "initiator": MessageLookupByLibrary.simpleMessage("Инициатор"),
    "installedAppsPermissionDeniedMessage":
        MessageLookupByLibrary.simpleMessage(
          "Разрешение на список приложений отклонено, поэтому установленные приложения недоступны. Предоставьте его вручную в системных настройках.",
        ),
    "installedAppsPermissionDesc": MessageLookupByLibrary.simpleMessage(
      "Эта система не выдаёт список установленных приложений без разрешения. Предоставьте его, чтобы настроить прокси для отдельных приложений.",
    ),
    "installedAppsPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Требуется разрешение на список приложений",
    ),
    "intelligentSelected": MessageLookupByLibrary.simpleMessage("Умный выбор"),
    "interfaceName": MessageLookupByLibrary.simpleMessage("Имя интерфейса"),
    "interfaceNameMode": MessageLookupByLibrary.simpleMessage(
      "Исходящий интерфейс",
    ),
    "internet": MessageLookupByLibrary.simpleMessage("Интернет"),
    "interval": MessageLookupByLibrary.simpleMessage("Интервал"),
    "intranetIP": MessageLookupByLibrary.simpleMessage("Внутренний IP"),
    "invalidBackupFile": MessageLookupByLibrary.simpleMessage(
      "Недопустимый файл резервной копии",
    ),
    "invalidDscpContent": MessageLookupByLibrary.simpleMessage(
      "Метка DSCP не может превышать 63",
    ),
    "invalidNetworkContent": MessageLookupByLibrary.simpleMessage(
      "Поддерживаются только tcp и udp",
    ),
    "invalidPolicy": m14,
    "invalidProfileQrcode": MessageLookupByLibrary.simpleMessage(
      "Этот QR-код не содержит ссылку на профиль",
    ),
    "invalidRangeContent": MessageLookupByLibrary.simpleMessage(
      "Введите числа или диапазоны, например 80 или 8000-9000, через /",
    ),
    "invalidRuleSet": m15,
    "invalidSubRule": m16,
    "ipAddress": MessageLookupByLibrary.simpleMessage("IP-адрес"),
    "ipAsn": MessageLookupByLibrary.simpleMessage("ASN"),
    "ipFlagAbuser": MessageLookupByLibrary.simpleMessage("Злоупотребления"),
    "ipFlagProxy": MessageLookupByLibrary.simpleMessage("Прокси"),
    "ipFlagTor": MessageLookupByLibrary.simpleMessage("Tor"),
    "ipFlagVpn": MessageLookupByLibrary.simpleMessage("VPN"),
    "ipFlags": MessageLookupByLibrary.simpleMessage("Метки"),
    "ipOrganization": MessageLookupByLibrary.simpleMessage("Организация"),
    "ipQualityFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось определить тип IP",
    ),
    "ipQualityGood": MessageLookupByLibrary.simpleMessage("Хороший"),
    "ipQualityLevel": MessageLookupByLibrary.simpleMessage("Уровень"),
    "ipQualityNormal": MessageLookupByLibrary.simpleMessage("Обычный"),
    "ipQualityRetry": MessageLookupByLibrary.simpleMessage("Проверить снова"),
    "ipQualityRisky": MessageLookupByLibrary.simpleMessage("Рискованный"),
    "ipQualitySource": MessageLookupByLibrary.simpleMessage("Источник ответа"),
    "ipQualitySources": MessageLookupByLibrary.simpleMessage("Источники"),
    "ipSourceIpMismatch": MessageLookupByLibrary.simpleMessage(
      "Другой исходящий IP",
    ),
    "ipSourceNoType": MessageLookupByLibrary.simpleMessage("Тип не определён"),
    "ipSourceRateLimited": MessageLookupByLibrary.simpleMessage(
      "Лимит запросов",
    ),
    "ipType": MessageLookupByLibrary.simpleMessage("Тип"),
    "ipTypeBusiness": MessageLookupByLibrary.simpleMessage("Бизнес"),
    "ipTypeHosting": MessageLookupByLibrary.simpleMessage("Дата-центр"),
    "ipTypeMobile": MessageLookupByLibrary.simpleMessage("Мобильная сеть"),
    "ipTypeResidential": MessageLookupByLibrary.simpleMessage("Домашний"),
    "ipv6Timeout": MessageLookupByLibrary.simpleMessage("Тайм-аут IPv6 (мс)"),
    "ja": MessageLookupByLibrary.simpleMessage("日本語"),
    "justNow": MessageLookupByLibrary.simpleMessage("Только что"),
    "key": MessageLookupByLibrary.simpleMessage("Ключ"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "large": MessageLookupByLibrary.simpleMessage("Крупный"),
    "lastUpdated": MessageLookupByLibrary.simpleMessage("Последнее обновление"),
    "launchInterrupted": MessageLookupByLibrary.simpleMessage(
      "Запуск не завершён",
    ),
    "launchInterruptedTip": MessageLookupByLibrary.simpleMessage(
      "В прошлый раз приложение неожиданно завершилось во время запуска. Автоматическая настройка для этого запуска пропущена; вы можете запустить её вручную.",
    ),
    "layout": MessageLookupByLibrary.simpleMessage("Макет"),
    "light": MessageLookupByLibrary.simpleMessage("Светлая"),
    "lineIssueTip": m17,
    "lineWrap": MessageLookupByLibrary.simpleMessage("Перенос строк"),
    "list": MessageLookupByLibrary.simpleMessage("Список"),
    "listen": MessageLookupByLibrary.simpleMessage("Прослушивание"),
    "listenRoutingMark": MessageLookupByLibrary.simpleMessage(
      "Метка маршрутизации",
    ),
    "liveConnections": MessageLookupByLibrary.simpleMessage(
      "Активные соединения",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Загрузка…"),
    "local": MessageLookupByLibrary.simpleMessage("Локально"),
    "localNetworkDeniedTip": MessageLookupByLibrary.simpleMessage(
      "Доступ к локальной сети запрещён: используется стек gvisor, локальная сеть недоступна.",
    ),
    "log": MessageLookupByLibrary.simpleMessage("Лог"),
    "logLevel": MessageLookupByLibrary.simpleMessage("Уровень логов"),
    "logs": MessageLookupByLibrary.simpleMessage("Логи"),
    "loopback": MessageLookupByLibrary.simpleMessage(
      "Снятие ограничения loopback для UWP",
    ),
    "loose": MessageLookupByLibrary.simpleMessage("Свободный"),
    "matchTarget": MessageLookupByLibrary.simpleMessage("MATCH-TARGET"),
    "maxFailedTimes": MessageLookupByLibrary.simpleMessage(
      "Макс. число неудач",
    ),
    "maxLengthTip": m18,
    "maximize": MessageLookupByLibrary.simpleMessage("Развернуть"),
    "memoryAppResident": MessageLookupByLibrary.simpleMessage(
      "Резидентная память",
    ),
    "memoryAppShared": MessageLookupByLibrary.simpleMessage(
      "Приложение и общая",
    ),
    "memoryCoreHeapIdle": MessageLookupByLibrary.simpleMessage(
      "Свободная куча",
    ),
    "memoryCoreHeapInuse": MessageLookupByLibrary.simpleMessage(
      "Используемая куча",
    ),
    "memoryCoreNotRunning": MessageLookupByLibrary.simpleMessage(
      "Ядро не запущено",
    ),
    "memoryCoreRuntime": MessageLookupByLibrary.simpleMessage(
      "Накладные расходы среды",
    ),
    "memoryCoreStack": MessageLookupByLibrary.simpleMessage("Стеки горутин"),
    "memoryEstimateDesc": MessageLookupByLibrary.simpleMessage(
      "Оценка по резидентной памяти процессов; может отличаться от данных системы.",
    ),
    "memoryEstimateSharedDesc": MessageLookupByLibrary.simpleMessage(
      "Ядро работает в процессе приложения. Его доля оценивается по статистике среды выполнения, остальное относится к приложению и общей памяти.",
    ),
    "memoryInfo": MessageLookupByLibrary.simpleMessage("Память"),
    "memoryReleased": MessageLookupByLibrary.simpleMessage(
      "Память освобождена",
    ),
    "memoryReleasedSize": m19,
    "min": MessageLookupByLibrary.simpleMessage("Минимальный"),
    "minimize": MessageLookupByLibrary.simpleMessage("Свернуть"),
    "minimizeOnExit": MessageLookupByLibrary.simpleMessage(
      "Продолжать работу после закрытия окна",
    ),
    "minutesAgo": m20,
    "mixedPort": MessageLookupByLibrary.simpleMessage("Смешанный порт"),
    "mode": MessageLookupByLibrary.simpleMessage("Режим"),
    "monochromeScheme": MessageLookupByLibrary.simpleMessage("Монохром"),
    "monthsAgo": m21,
    "more": MessageLookupByLibrary.simpleMessage("Ещё"),
    "name": MessageLookupByLibrary.simpleMessage("Название"),
    "network": MessageLookupByLibrary.simpleMessage("Сеть"),
    "networkAccessDeniedError": m22,
    "networkBadResponseError": m23,
    "networkCancelledError": MessageLookupByLibrary.simpleMessage(
      "Запрос отменён",
    ),
    "networkConnectionError": MessageLookupByLibrary.simpleMessage(
      "Не удалось подключиться к серверу. Проверьте подключение к сети или настройки прокси",
    ),
    "networkDetection": MessageLookupByLibrary.simpleMessage("Проверка сети"),
    "networkHostLookupError": MessageLookupByLibrary.simpleMessage(
      "Не удалось определить адрес сервера. Проверьте правильность URL и работу DNS",
    ),
    "networkNotFoundError": m24,
    "networkRateLimitedError": MessageLookupByLibrary.simpleMessage(
      "Слишком много запросов (HTTP 429). Подождите немного и повторите попытку",
    ),
    "networkRequestFailed": m25,
    "networkServerError": m26,
    "networkSpeed": MessageLookupByLibrary.simpleMessage("Скорость сети"),
    "networkTimeoutError": MessageLookupByLibrary.simpleMessage(
      "Время ожидания запроса истекло. Проверьте сеть или прокси и повторите попытку",
    ),
    "networkTlsError": MessageLookupByLibrary.simpleMessage(
      "Не удалось установить защищённое соединение. Сертификат сервера может быть недействителен, или соединение перехватывается",
    ),
    "networkType": MessageLookupByLibrary.simpleMessage("Тип сети"),
    "neutralScheme": MessageLookupByLibrary.simpleMessage("Нейтральная"),
    "no": MessageLookupByLibrary.simpleMessage("Нет"),
    "noData": MessageLookupByLibrary.simpleMessage("Нет данных"),
    "noLongerRemind": MessageLookupByLibrary.simpleMessage(
      "Больше не напоминать",
    ),
    "noNetwork": MessageLookupByLibrary.simpleMessage("Нет сети"),
    "noNetworkApp": MessageLookupByLibrary.simpleMessage("Приложения без сети"),
    "noResolve": MessageLookupByLibrary.simpleMessage("Не разрешать IP"),
    "noSearchResults": MessageLookupByLibrary.simpleMessage(
      "Ничего не найдено",
    ),
    "none": MessageLookupByLibrary.simpleMessage("Нет"),
    "notSelectedTip": MessageLookupByLibrary.simpleMessage(
      "Текущую группу прокси нельзя выбрать",
    ),
    "nullProfileDesc": MessageLookupByLibrary.simpleMessage(
      "Добавьте профиль, чтобы начать",
    ),
    "nullTip": m27,
    "onlyStatisticsProxy": MessageLookupByLibrary.simpleMessage(
      "Учитывать только трафик прокси",
    ),
    "optional": MessageLookupByLibrary.simpleMessage("Необязательно"),
    "options": MessageLookupByLibrary.simpleMessage("Опции"),
    "other": MessageLookupByLibrary.simpleMessage("Другое"),
    "outboundIp": MessageLookupByLibrary.simpleMessage("Исходящий IP"),
    "outboundMode": MessageLookupByLibrary.simpleMessage(
      "Режим исходящего трафика",
    ),
    "override": MessageLookupByLibrary.simpleMessage("Переопределение"),
    "overrideDns": MessageLookupByLibrary.simpleMessage("Переопределить DNS"),
    "overrideMode": MessageLookupByLibrary.simpleMessage(
      "Режим переопределения",
    ),
    "overrideNtp": MessageLookupByLibrary.simpleMessage("Переопределить NTP"),
    "overwriteIssueCoreRejected": m28,
    "overwriteIssueDuplicateName": m29,
    "overwriteIssueEmptyName": MessageLookupByLibrary.simpleMessage(
      "Имя не задано",
    ),
    "overwriteIssueGroupLoop": m30,
    "overwriteIssueMissingProviders": m31,
    "overwriteIssueMissingProxies": m32,
    "overwriteIssueNoProxySource": MessageLookupByLibrary.simpleMessage(
      "Не выбраны ни прокси, ни провайдеры прокси, поэтому ядро отклонит эту группу",
    ),
    "overwriteIssueReservedName": m33,
    "overwriteIssueSubscriptionGroupMissingProxies": m34,
    "overwriteTypeCustom": MessageLookupByLibrary.simpleMessage(
      "Пользовательский",
    ),
    "palette": MessageLookupByLibrary.simpleMessage("Палитра"),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "paste": MessageLookupByLibrary.simpleMessage("Вставить"),
    "pickFromAlbum": MessageLookupByLibrary.simpleMessage("Выбрать из галереи"),
    "pinWindow": MessageLookupByLibrary.simpleMessage(
      "Закрепить поверх всех окон",
    ),
    "pleaseUploadValidQrcode": MessageLookupByLibrary.simpleMessage(
      "Загрузите корректный QR-код",
    ),
    "port": MessageLookupByLibrary.simpleMessage("Порт"),
    "preview": MessageLookupByLibrary.simpleMessage("Предпросмотр"),
    "process": MessageLookupByLibrary.simpleMessage("Процесс"),
    "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "profileAutoUpdateIntervalInvalidValidationDesc":
        MessageLookupByLibrary.simpleMessage("Введите корректный интервал"),
    "profileAutoUpdateIntervalNullValidationDesc":
        MessageLookupByLibrary.simpleMessage("Введите интервал автообновления"),
    "profileHasUpdate": MessageLookupByLibrary.simpleMessage(
      "Профиль изменён. Отключить автообновление?",
    ),
    "profileNameNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Введите название профиля",
    ),
    "profileUrlInvalidValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Введите корректный URL профиля",
    ),
    "profileUrlNullValidationDesc": MessageLookupByLibrary.simpleMessage(
      "Введите URL профиля",
    ),
    "profiles": MessageLookupByLibrary.simpleMessage("Профили"),
    "profilesSort": MessageLookupByLibrary.simpleMessage("Сортировка профилей"),
    "project": MessageLookupByLibrary.simpleMessage("Проект"),
    "providerInUse": m35,
    "providerRenameShadowed": m36,
    "providerSourceSubscription": MessageLookupByLibrary.simpleMessage(
      "Подписка",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("Внешние ресурсы"),
    "proxies": MessageLookupByLibrary.simpleMessage("Прокси"),
    "proxiesCount": m37,
    "proxyChains": MessageLookupByLibrary.simpleMessage("Цепочка прокси"),
    "proxyGroup": MessageLookupByLibrary.simpleMessage("Группа прокси"),
    "proxyNode": MessageLookupByLibrary.simpleMessage("Прокси-узел"),
    "proxyProviders": MessageLookupByLibrary.simpleMessage("Провайдеры прокси"),
    "pureBlack": MessageLookupByLibrary.simpleMessage("Чисто чёрный"),
    "qrcode": MessageLookupByLibrary.simpleMessage("QR-код"),
    "qrcodeDesc": MessageLookupByLibrary.simpleMessage(
      "Сканируйте QR-код, чтобы получить профиль",
    ),
    "quickAdd": MessageLookupByLibrary.simpleMessage("Быстрое добавление"),
    "rainbowScheme": MessageLookupByLibrary.simpleMessage("Радуга"),
    "recentRequests": MessageLookupByLibrary.simpleMessage("Последние запросы"),
    "redirPort": MessageLookupByLibrary.simpleMessage("Порт Redir"),
    "redo": MessageLookupByLibrary.simpleMessage("Повторить"),
    "releaseMemory": MessageLookupByLibrary.simpleMessage("Освободить память"),
    "releaseMemoryFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось освободить память",
    ),
    "remote": MessageLookupByLibrary.simpleMessage("Удалённо"),
    "remoteDestination": MessageLookupByLibrary.simpleMessage(
      "Удалённое назначение",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("Убрать"),
    "replace": MessageLookupByLibrary.simpleMessage("Заменить"),
    "replaceAll": MessageLookupByLibrary.simpleMessage("Заменить все"),
    "request": MessageLookupByLibrary.simpleMessage("Запрос"),
    "requests": MessageLookupByLibrary.simpleMessage("Запросы"),
    "reset": MessageLookupByLibrary.simpleMessage("Сброс"),
    "resetPageChangesTip": MessageLookupByLibrary.simpleMessage(
      "На этой странице есть изменения. Вы уверены, что хотите выполнить сброс?",
    ),
    "resources": MessageLookupByLibrary.simpleMessage("Ресурсы"),
    "respectRules": MessageLookupByLibrary.simpleMessage("Соблюдать правила"),
    "restart": MessageLookupByLibrary.simpleMessage("Перезапустить"),
    "restartCoreTip": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите перезапустить ядро?",
    ),
    "restore": MessageLookupByLibrary.simpleMessage("Восстановить"),
    "restoreStrategy": MessageLookupByLibrary.simpleMessage(
      "Стратегия восстановления",
    ),
    "restoreStrategyCompatible": MessageLookupByLibrary.simpleMessage(
      "Совместимость",
    ),
    "restoreStrategyOverride": MessageLookupByLibrary.simpleMessage(
      "Перезапись",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Повторить"),
    "routeAddress": MessageLookupByLibrary.simpleMessage("Адреса маршрутов"),
    "routeMode": MessageLookupByLibrary.simpleMessage("Режим маршрутизации"),
    "routeModeBypassPrivate": MessageLookupByLibrary.simpleMessage(
      "Обходить частные адреса",
    ),
    "routeModeConfig": MessageLookupByLibrary.simpleMessage(
      "Использовать конфигурацию",
    ),
    "ru": MessageLookupByLibrary.simpleMessage("Русский"),
    "rule": MessageLookupByLibrary.simpleMessage("Правило"),
    "ruleActionAndDesc": MessageLookupByLibrary.simpleMessage(
      "Логическое правило AND",
    ),
    "ruleActionDomainDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить полный домен",
    ),
    "ruleActionDomainKeywordDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить ключевое слово в домене",
    ),
    "ruleActionDomainRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по регулярному выражению домена",
    ),
    "ruleActionDomainSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить суффикс домена",
    ),
    "ruleActionDomainWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставление по маске; поддерживаются только * и ?",
    ),
    "ruleActionDscpDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить метку DSCP (только для входящих tproxy UDP)",
    ),
    "ruleActionDstPortDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон портов назначения",
    ),
    "ruleActionGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить код страны IP-адреса",
    ),
    "ruleActionGeositeDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить домены из Geosite",
    ),
    "ruleActionInNameDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить имя входящего подключения",
    ),
    "ruleActionInPortDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить входящий порт",
    ),
    "ruleActionInTypeDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить тип входящего подключения",
    ),
    "ruleActionInUserDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить имя пользователя входящего подключения; несколько имён разделяются /",
    ),
    "ruleActionIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить ASN, которой принадлежит IP",
    ),
    "ruleActionIpCidr6Desc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон IP-адресов; IP-CIDR6 — просто псевдоним",
    ),
    "ruleActionIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон IP-адресов",
    ),
    "ruleActionIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон суффиксов IP",
    ),
    "ruleActionMatchDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставляет все запросы, условия не нужны",
    ),
    "ruleActionNetworkDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить TCP или UDP",
    ),
    "ruleActionNotDesc": MessageLookupByLibrary.simpleMessage(
      "Логическое правило NOT",
    ),
    "ruleActionOrDesc": MessageLookupByLibrary.simpleMessage(
      "Логическое правило OR",
    ),
    "ruleActionProcessNameDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по имени процесса; на Android соответствует имени пакета",
    ),
    "ruleActionProcessNameRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по регулярному выражению имени процесса; на Android соответствует имени пакета",
    ),
    "ruleActionProcessNameWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по маске имени процесса; поддерживаются только * и ?",
    ),
    "ruleActionProcessPathDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по полному пути процесса",
    ),
    "ruleActionProcessPathRegexDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по регулярному выражению пути процесса",
    ),
    "ruleActionProcessPathWildcardDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить по маске пути процесса; поддерживаются только * и ?",
    ),
    "ruleActionRematchNameDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить имя повторного сопоставления; несколько имён разделяются /",
    ),
    "ruleActionRuleSetDesc": MessageLookupByLibrary.simpleMessage(
      "Ссылка на набор правил; требуется настроить rule-providers",
    ),
    "ruleActionSrcGeoipDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить код страны IP источника",
    ),
    "ruleActionSrcIpAsnDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить ASN IP источника",
    ),
    "ruleActionSrcIpCidrDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон IP-адресов источника",
    ),
    "ruleActionSrcIpSuffixDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон суффиксов IP источника",
    ),
    "ruleActionSrcPortDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить диапазон портов источника",
    ),
    "ruleActionSubRuleDesc": MessageLookupByLibrary.simpleMessage(
      "Переход к подправилу; обратите внимание на скобки",
    ),
    "ruleActionUidDesc": MessageLookupByLibrary.simpleMessage(
      "Сопоставить Linux USER ID",
    ),
    "ruleName": MessageLookupByLibrary.simpleMessage("Название правила"),
    "rulePresetBittorrentDirect": MessageLookupByLibrary.simpleMessage(
      "BitTorrent напрямую",
    ),
    "rulePresetBlockDot": MessageLookupByLibrary.simpleMessage(
      "Блокировать DNS over TLS",
    ),
    "rulePresetBlockQuic": MessageLookupByLibrary.simpleMessage(
      "Блокировать QUIC",
    ),
    "rulePresetBlockStun": MessageLookupByLibrary.simpleMessage(
      "Блокировать STUN",
    ),
    "rulePresetLanDirect": MessageLookupByLibrary.simpleMessage(
      "Локальная сеть напрямую",
    ),
    "rulePresetSystemServicesDirect": MessageLookupByLibrary.simpleMessage(
      "Apple и Microsoft напрямую",
    ),
    "ruleProviders": MessageLookupByLibrary.simpleMessage("Провайдеры правил"),
    "ruleSet": MessageLookupByLibrary.simpleMessage("Набор правил"),
    "ruleTarget": MessageLookupByLibrary.simpleMessage("Цель правила"),
    "rules": MessageLookupByLibrary.simpleMessage("Правила"),
    "rulesCount": m38,
    "runTime": MessageLookupByLibrary.simpleMessage("Время работы"),
    "safeMode": MessageLookupByLibrary.simpleMessage("Безопасный режим"),
    "safeModeAppTitle": m39,
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Сохранить изменения?"),
    "script": MessageLookupByLibrary.simpleMessage("Скрипт"),
    "scrollToSelected": MessageLookupByLibrary.simpleMessage(
      "Прокрутить к выбранному",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "seconds": MessageLookupByLibrary.simpleMessage("секунд"),
    "secondsCount": m40,
    "selectAll": MessageLookupByLibrary.simpleMessage("Выбрать всё"),
    "selected": MessageLookupByLibrary.simpleMessage("Выбрано"),
    "selectedCountTitle": m41,
    "server": MessageLookupByLibrary.simpleMessage("Сервер"),
    "serviceAvailable": MessageLookupByLibrary.simpleMessage("Доступен"),
    "serviceBlocked": MessageLookupByLibrary.simpleMessage("Заблокировано"),
    "serviceCheck": MessageLookupByLibrary.simpleMessage("Проверить"),
    "serviceCheckAll": MessageLookupByLibrary.simpleMessage("Проверить все"),
    "serviceCheckedAt": m42,
    "serviceComingSoon": MessageLookupByLibrary.simpleMessage("Скоро появится"),
    "serviceDisallowedIsp": MessageLookupByLibrary.simpleMessage(
      "Недопустимый провайдер",
    ),
    "serviceFailed": MessageLookupByLibrary.simpleMessage("Ошибка проверки"),
    "serviceManage": MessageLookupByLibrary.simpleMessage(
      "Управление сервисами",
    ),
    "serviceOriginalsOnly": MessageLookupByLibrary.simpleMessage(
      "Только оригиналы",
    ),
    "servicePending": MessageLookupByLibrary.simpleMessage("Не проверено"),
    "serviceRestricted": MessageLookupByLibrary.simpleMessage(
      "Доступ ограничен",
    ),
    "serviceStatus": MessageLookupByLibrary.simpleMessage("Состояние сервисов"),
    "serviceUnavailable": MessageLookupByLibrary.simpleMessage("Недоступен"),
    "serviceUnsupportedRegion": MessageLookupByLibrary.simpleMessage(
      "Регион не поддерживается",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "show": MessageLookupByLibrary.simpleMessage("Показать"),
    "showLess": MessageLookupByLibrary.simpleMessage("Свернуть"),
    "showMore": MessageLookupByLibrary.simpleMessage("Развернуть"),
    "showNotificationStopAction": MessageLookupByLibrary.simpleMessage(
      "Кнопка остановки в уведомлении",
    ),
    "shrink": MessageLookupByLibrary.simpleMessage("Компактный"),
    "sidebarBlur": MessageLookupByLibrary.simpleMessage(
      "Размытие боковой панели",
    ),
    "silentLaunch": MessageLookupByLibrary.simpleMessage("Запускать свёрнутым"),
    "singleAdd": MessageLookupByLibrary.simpleMessage("По одному"),
    "singleValueTip": m43,
    "size": MessageLookupByLibrary.simpleMessage("Размер"),
    "slide": MessageLookupByLibrary.simpleMessage("Сдвиг"),
    "socksPort": MessageLookupByLibrary.simpleMessage("Порт SOCKS"),
    "sort": MessageLookupByLibrary.simpleMessage("Сортировка"),
    "source": MessageLookupByLibrary.simpleMessage("Источник"),
    "sourceIp": MessageLookupByLibrary.simpleMessage("IP источника"),
    "specialProxy": MessageLookupByLibrary.simpleMessage("Специальный прокси"),
    "specialRules": MessageLookupByLibrary.simpleMessage("Специальные правила"),
    "speedStatistics": MessageLookupByLibrary.simpleMessage(
      "Статистика скорости",
    ),
    "standard": MessageLookupByLibrary.simpleMessage("Стандартный"),
    "start": MessageLookupByLibrary.simpleMessage("Старт"),
    "startVpn": MessageLookupByLibrary.simpleMessage("Запуск VPN…"),
    "status": MessageLookupByLibrary.simpleMessage("Статус"),
    "stop": MessageLookupByLibrary.simpleMessage("Стоп"),
    "stopVpn": MessageLookupByLibrary.simpleMessage("Остановка VPN…"),
    "strategy": MessageLookupByLibrary.simpleMessage("Стратегия"),
    "style": MessageLookupByLibrary.simpleMessage("Стиль"),
    "subRule": MessageLookupByLibrary.simpleMessage("Подправило"),
    "submit": MessageLookupByLibrary.simpleMessage("Отправить"),
    "subscriptionInfo": MessageLookupByLibrary.simpleMessage(
      "Информация о подписке",
    ),
    "suspended": MessageLookupByLibrary.simpleMessage("Приостановлено…"),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Сменить профиль"),
    "sync": MessageLookupByLibrary.simpleMessage("Синхронизация"),
    "system": MessageLookupByLibrary.simpleMessage("Система"),
    "systemApp": MessageLookupByLibrary.simpleMessage("Системные приложения"),
    "systemProxy": MessageLookupByLibrary.simpleMessage("Системный прокси"),
    "tab": MessageLookupByLibrary.simpleMessage("Вкладки"),
    "tabAnimation": MessageLookupByLibrary.simpleMessage("Анимация вкладок"),
    "tcpConcurrent": MessageLookupByLibrary.simpleMessage("Параллельный TCP"),
    "testUrl": MessageLookupByLibrary.simpleMessage("URL для теста"),
    "textScale": MessageLookupByLibrary.simpleMessage("Масштаб текста"),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "themeColor": MessageLookupByLibrary.simpleMessage("Цвет темы"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Режим темы"),
    "tight": MessageLookupByLibrary.simpleMessage("Плотный"),
    "time": MessageLookupByLibrary.simpleMessage("Время"),
    "timeout": MessageLookupByLibrary.simpleMessage("Тайм-аут"),
    "tip": MessageLookupByLibrary.simpleMessage("Подсказка"),
    "toggle": MessageLookupByLibrary.simpleMessage("Переключить"),
    "tolerance": MessageLookupByLibrary.simpleMessage("Допуск"),
    "tonalSpotScheme": MessageLookupByLibrary.simpleMessage("Тональный акцент"),
    "tools": MessageLookupByLibrary.simpleMessage("Инструменты"),
    "torch": MessageLookupByLibrary.simpleMessage("Фонарик"),
    "total": MessageLookupByLibrary.simpleMessage("Всего"),
    "totalTraffic": MessageLookupByLibrary.simpleMessage("Общий трафик"),
    "tproxyPort": MessageLookupByLibrary.simpleMessage("Порт TProxy"),
    "trafficUsage": MessageLookupByLibrary.simpleMessage("Статистика трафика"),
    "tun": MessageLookupByLibrary.simpleMessage("TUN"),
    "tunDesc": MessageLookupByLibrary.simpleMessage(
      "Работает только в режиме администратора",
    ),
    "turnOff": MessageLookupByLibrary.simpleMessage("Выключить"),
    "turnOn": MessageLookupByLibrary.simpleMessage("Включить"),
    "undo": MessageLookupByLibrary.simpleMessage("Отменить"),
    "unifiedDelay": MessageLookupByLibrary.simpleMessage("Единая задержка"),
    "unknown": MessageLookupByLibrary.simpleMessage("Неизвестно"),
    "unknownNetworkError": MessageLookupByLibrary.simpleMessage(
      "Неизвестная сетевая ошибка",
    ),
    "unmaximize": MessageLookupByLibrary.simpleMessage("Свернуть в окно"),
    "unpinWindow": MessageLookupByLibrary.simpleMessage("Открепить окно"),
    "update": MessageLookupByLibrary.simpleMessage("Обновить"),
    "upload": MessageLookupByLibrary.simpleMessage("Отдача"),
    "url": MessageLookupByLibrary.simpleMessage("URL"),
    "urlDesc": MessageLookupByLibrary.simpleMessage("Получить профиль по URL"),
    "urlTip": m44,
    "useHosts": MessageLookupByLibrary.simpleMessage("Использовать hosts"),
    "useSystemHosts": MessageLookupByLibrary.simpleMessage(
      "Использовать системный hosts",
    ),
    "usedTraffic": MessageLookupByLibrary.simpleMessage(
      "Использованный трафик",
    ),
    "userAgent": MessageLookupByLibrary.simpleMessage("User-Agent"),
    "value": MessageLookupByLibrary.simpleMessage("Значение"),
    "vibrantScheme": MessageLookupByLibrary.simpleMessage("Яркая"),
    "view": MessageLookupByLibrary.simpleMessage("Просмотр"),
    "vpnConfigChangeDetected": MessageLookupByLibrary.simpleMessage(
      "Обнаружено изменение настроек VPN",
    ),
    "vpnTip": MessageLookupByLibrary.simpleMessage(
      "Изменения вступят в силу после перезапуска VPN",
    ),
    "whitelistMode": MessageLookupByLibrary.simpleMessage(
      "Режим белого списка",
    ),
    "writeToSystem": MessageLookupByLibrary.simpleMessage(
      "Записывать в систему",
    ),
    "yearsAgo": m45,
  };
}
