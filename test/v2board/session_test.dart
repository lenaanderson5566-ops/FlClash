import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fastai/v2board/entrypoints.dart';
import 'package:fastai/v2board/session.dart';

class _Storage extends Mock implements FlutterSecureStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));
  test(
    'a retired origin preserves a session bound to the same service identity',
    () async {
      final storage = _Storage();
      when(() => storage.read(key: 'fastai.v10.session')).thenAnswer(
        (_) async => jsonEncode({
          'origin': 'https://retired.example',
          'serviceIdentity': ServiceEntrypoints.identity,
          'accessToken': 'test-token',
        }),
      );
      final restored = await V2BoardSession(storage: storage).restore();
      expect(restored?.accessToken, 'test-token');
      restored?.close();
      verifyNever(() => storage.delete(key: 'fastai.v10.session'));
    },
  );
  test('another service identity never restores a credential', () async {
    final storage = _Storage();
    when(() => storage.read(key: 'fastai.v10.session')).thenAnswer(
      (_) async => jsonEncode({
        'origin': 'https://fastdog.ws',
        'serviceIdentity': 'another-service',
        'accessToken': 'test-token',
      }),
    );
    when(
      () => storage.delete(key: 'fastai.v10.session'),
    ).thenAnswer((_) async {});
    expect(await V2BoardSession(storage: storage).restore(), isNull);
    verify(() => storage.delete(key: 'fastai.v10.session')).called(1);
  });
}
