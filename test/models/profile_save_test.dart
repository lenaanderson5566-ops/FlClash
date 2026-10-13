import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fastai/common/common.dart';
import 'package:fastai/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class _FakePathProvider extends PathProviderPlatform {
  final String root;

  _FakePathProvider(this.root);

  @override
  Future<String?> getTemporaryPath() async => root;

  @override
  Future<String?> getApplicationSupportPath() async => root;

  @override
  Future<String?> getApplicationCachePath() async => root;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUpAll(() {
    tempDir = Directory.systemTemp.createTempSync('profile_save_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDownAll(() {
    try {
      tempDir.deleteSync(recursive: true);
    } catch (_) {}
  });

  group('Profile.saveFile', () {
    // EditProfileView relies on this throwing rather than silently
    // succeeding, so a caller-level try/catch can surface the failure.
    test('rejects an invalid config without touching the saved file', () async {
      final profile = Profile.normal(label: 'p');
      final bytes = Uint8List.fromList(utf8.encode('bad: ['));

      await expectLater(
        profile.saveFile(bytes, validate: (_) async => 'invalid config'),
        throwsA(
          isA<MessageException>().having(
            (e) => e.message,
            'message',
            'invalid config',
          ),
        ),
      );

      final savedFile = await profile.file;
      expect(await savedFile.length(), 0);
    });

    test(
      'validation exceptions remove staging files and preserve old bytes',
      () async {
        final profile = Profile.normal(label: 'p');
        final destination = await profile.file;
        await destination.writeAsString('old');
        String? staged;
        await expectLater(
          profile.saveFile(
            Uint8List.fromList([1]),
            validate: (path) async {
              staged = path;
              throw StateError('validator unavailable');
            },
          ),
          throwsStateError,
        );
        expect(await destination.readAsString(), 'old');
        expect(await File(staged!).parent.exists(), isFalse);
      },
    );

    test('readers retain the old config until validation completes', () async {
      final profile = Profile.normal(label: 'p');
      final destination = await profile.file;
      await destination.writeAsString('old');
      final entered = Completer<String>();
      final validation = Completer<String>();
      final saving = profile.saveFile(
        Uint8List.fromList(utf8.encode('new')),
        validate: (path) {
          entered.complete(path);
          return validation.future;
        },
      );
      final staged = await entered.future;
      expect(await destination.readAsString(), 'old');
      validation.complete('');
      await saving;
      expect(await destination.readAsString(), 'new');
      expect(await File(staged).parent.exists(), isFalse);
    });

    test('copies validated bytes and stamps the update time', () async {
      final profile = Profile.normal(label: 'p');
      final bytes = Uint8List.fromList(utf8.encode('proxies: []'));

      final saved = await profile.saveFile(bytes, validate: (_) async => '');

      expect(saved.lastUpdateDate, isNotNull);
      final savedFile = await profile.file;
      expect(await savedFile.readAsString(), 'proxies: []');
    });
  });
}
