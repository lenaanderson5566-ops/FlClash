import 'package:fastai/common/app_localizations.dart';
import 'package:fastai/common/l10n_labels.dart';
import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/v2board/language.dart';
import 'package:fastai/v2board/node_metadata.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supported app locales cover exactly the backend languages', () {
    expect(
      AppLocalizations.delegate.supportedLocales
          .map((locale) => clientLanguage(locale.toLanguageTag()))
          .toSet(),
      {'zh-CN', 'zh-TW', 'en-US', 'ja-JP', 'ko-KR', 'vi-VN', 'ru-RU', 'fa-IR'},
    );
    expect(
      resolveAppLocale([
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      ], AppLocalizations.delegate.supportedLocales),
      const Locale('zh', 'TW'),
    );
    expect(
      resolveAppLocale([
        const Locale('de'),
        const Locale('ko', 'KR'),
      ], AppLocalizations.delegate.supportedLocales),
      const Locale('ko'),
    );
  });
  test('client language tags match the backend language contract', () {
    for (final entry in {
      'zh_CN': 'zh-CN',
      'zh_Hant': 'zh-TW',
      'zh-HK': 'zh-TW',
      'zh-MO': 'zh-TW',
      'en-GB': 'en-US',
      'ja': 'ja-JP',
      'ko': 'ko-KR',
      'vi': 'vi-VN',
      'ru': 'ru-RU',
      'fa': 'fa-IR',
      'de-DE': 'en-US',
    }.entries) {
      expect(clientLanguage(entry.key), entry.value);
    }
    expect(
      getLocaleForString('zh-Hant'),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    );
  });
  test(
    'global messages and native language labels follow locale changes',
    () async {
      await AppLocalizations.load(const Locale('en'));
      expect(currentAppLocalizations.fdConnect, 'Connect');
      await AppLocalizations.load(const Locale('ja'));
      expect(
        currentAppLocalizations.fdConnect,
        AppLocalizations.current.fdConnect,
      );
      expect(const Locale('en').label, 'English');
      expect(const Locale('ja').label, '日本語');
      expect(const Locale('zh', 'TW').label, '繁體中文');
    },
  );
  test('traditional Chinese node names also work for Hong Kong', () {
    expect(
      nodeDisplayName(
        {
          'displayNames': {
            'zh-TW': '香港',
            'zh-CN': '香港简体',
            'en-US': 'Hong Kong',
          },
        },
        'node_1',
        const Locale('zh', 'HK'),
      ),
      '香港',
    );
  });
}
