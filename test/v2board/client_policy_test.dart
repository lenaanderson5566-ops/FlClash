import 'dart:async';
import 'dart:io';

import 'package:fastai/common/link.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/action.dart';
import 'package:fastai/v2board/access.dart';
import 'package:fastai/v2board/config.dart';
import 'package:fastai/views/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'server version rejection survives entitlement refresh until config sync succeeds',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final access = container.read(v2BoardAccessProvider.notifier);
      access.setAvailable(true);
      expect(container.read(v2BoardAccessProvider), isTrue);
      access.rejectVersion();
      access.setAvailable(true);
      expect(container.read(v2BoardAccessProvider), isFalse);
      access.acceptVersion();
      access.setAvailable(true);
      expect(container.read(v2BoardAccessProvider), isTrue);
    },
  );

  test(
    'external scheme and launch links never attach an import listener',
    () async {
      final links = StreamController<Uri>.broadcast();
      addTearDown(links.close);
      addTearDown(linkManager.destroy);
      var subscribed = false;
      linkManager.uriLinkStream = () {
        subscribed = true;
        return links.stream;
      };
      final received = <String>[];
      linkManager.seedInitialLink([
        'flclash://install-config?url=https://example.com/private.yaml',
      ]);
      await linkManager.initAppLinksListen(received.add);
      for (final scheme in [
        'clash',
        'clashmeta',
        'flclash',
        'fastai',
        'https',
      ]) {
        links.add(
          Uri.parse('$scheme://install-config?url=https://example.com/a.yaml'),
        );
      }
      await Future<void>.delayed(Duration.zero);
      expect(subscribed, false);
      expect(linkManager.subscription, isNull);
      expect(received, isEmpty);
    },
  );

  test(
    'file, URL, QR and backup imports stop before invoking platform IO',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final action = container.read(profilesActionProvider.notifier);
      await action.addProfileFormFile();
      await action.addProfileFormURL('https://example.com/profile.yaml');
      await action.addProfileFormQrCode();
      var fetched = false;
      final restored = await container
          .read(backupActionProvider.notifier)
          .restore(RestoreOption.onlyProfiles, (_) async {
            fetched = true;
            return null;
          });
      expect(restored, false);
      expect(fetched, false);
      expect(V2BoardConfig.allowProfileImports, false);
      expect(
        navigation.getItems().any((item) => item.label == PageLabel.profiles),
        false,
      );
    },
  );

  test(
    'tray and provider start requests cannot bypass missing entitlement',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      expect(container.read(v2BoardAccessProvider), false);
      expect(
        await container
            .read(setupActionProvider.notifier)
            .setRunning(true, initialize: true),
        false,
      );
    },
  );

  test('platform packages advertise no import scheme', () {
    final android = File(
      'android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();
    final macos = File('macos/Runner/Info.plist').readAsStringSync();
    expect(android, isNot(contains('android.intent.action.VIEW')));
    expect(android, isNot(contains('android.intent.category.BROWSABLE')));
    expect(macos, isNot(contains('CFBundleURLTypes')));
    for (final platform in ['appimage', 'deb', 'rpm']) {
      final config = File(
        'linux/packaging/$platform/make_config.yaml',
      ).readAsStringSync();
      expect(config, isNot(contains('x-scheme-handler/')));
    }
  });
}
