import 'package:fastai/v2board/language.dart';
import 'package:fastai/common/network_error.dart';
import 'package:fastai/core/desktop/launch_policy.dart';
import 'package:fastai/core/method.dart';
import 'package:fastai/l10n/l10n.dart';

import 'dart:ui';

AppLocalizations get currentAppLocalizations => AppLocalizations.current;

String? coreLaunchBlockedMessage(
  Object error,
  AppLocalizations appLocalizations,
) {
  if (!isPolicyBlockedLaunch(error)) {
    return null;
  }
  return switch (smartAppControlStateReader()) {
    SmartAppControlState.on || SmartAppControlState.evaluation =>
      appLocalizations.coreBlockedBySmartAppControlTip,
    _ => appLocalizations.coreBlockedByPolicyTip(launchOsError(error)!),
  };
}

String userFacingErrorMessage(Object error, AppLocalizations appLocalizations) {
  return networkErrorMessage(error, appLocalizations) ??
      coreLaunchBlockedMessage(error, appLocalizations) ??
      switch (error) {
        CoreMethodException(:final message) => message,
        _ => error.toString(),
      };
}

Locale? getLocaleForString(String? localString) {
  if (localString == null) return null;
  final localSplit = localString.replaceAll('-', '_').split('_');
  if (localSplit.length == 1) {
    return Locale(localSplit[0]);
  }
  if (localSplit.length == 2) {
    return localSplit[1].length == 4
        ? Locale.fromSubtags(
            languageCode: localSplit[0],
            scriptCode: localSplit[1],
          )
        : Locale(localSplit[0], localSplit[1]);
  }
  if (localSplit.length == 3) {
    return Locale.fromSubtags(
      languageCode: localSplit[0],
      scriptCode: localSplit[1],
      countryCode: localSplit[2],
    );
  }
  return null;
}

Locale resolveAppLocale(List<Locale>? preferred, Iterable<Locale> supported) {
  for (final locale in preferred ?? const <Locale>[]) {
    if (!supported.any((value) => value.languageCode == locale.languageCode)) {
      continue;
    }
    final tag = clientLanguage(locale.toLanguageTag());
    final match = supported
        .where((value) => clientLanguage(value.toLanguageTag()) == tag)
        .firstOrNull;
    if (match != null) return match;
  }
  return const Locale('en');
}
