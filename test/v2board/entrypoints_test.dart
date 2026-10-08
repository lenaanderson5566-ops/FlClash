import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/entrypoints.dart';

class _Adapter implements HttpClientAdapter {
  _Adapter(this.respond);
  final Future<ResponseBody> Function(RequestOptions) respond;
  final requests = <RequestOptions>[];
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancel,
  ) {
    requests.add(options);
    return respond(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _settings() => ResponseBody.fromString(
  jsonEncode({
    'data': {'appUrl': 'https://fastdog.ws'},
  }),
  200,
  headers: {
    'content-type': ['application/json'],
  },
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test(
    'signed entrypoints reject tampering, rollback, expiry and other service identities',
    () async {
      final algorithm = Ed25519();
      final pair = await algorithm.newKeyPair();
      final key = await pair.extractPublicKey();
      final publicKey = base64Encode(key.bytes);
      final digest = await Sha256().hash(key.bytes);
      final identity = digest.bytes
          .map((v) => v.toRadixString(16).padLeft(2, '0'))
          .join();
      final now = DateTime.utc(2026, 10, 8);
      final seconds = now.millisecondsSinceEpoch ~/ 1000;
      Future<Map<String, dynamic>> envelope({
        int version = 12,
        int? expiry,
        String? service,
      }) async {
        final bytes = utf8.encode(
          jsonEncode({
            'version': version,
            'serviceId': service ?? identity,
            'issuedAt': seconds,
            'expiresAt': expiry ?? seconds + 3600,
            'endpoints': [
              {'origin': 'https://fastdog66.com', 'priority': 1},
            ],
          }),
        );
        final signature = await algorithm.sign(bytes, keyPair: pair);
        return {
          'payload': base64Encode(bytes),
          'signature': base64Encode(signature.bytes),
        };
      }

      final valid = await envelope();
      expect(
        (await EntrypointManifest.verify(
          valid,
          publicKey,
          now: now,
        )).origins.single.host,
        'fastdog66.com',
      );
      expect(
        EntrypointManifest.verify(
          {...valid, 'payload': base64Encode(utf8.encode('{}'))},
          publicKey,
          now: now,
        ),
        throwsFormatException,
      );
      expect(
        EntrypointManifest.verify(
          await envelope(version: 11),
          publicKey,
          minimumVersion: 12,
          now: now,
        ),
        throwsFormatException,
      );
      expect(
        EntrypointManifest.verify(
          await envelope(expiry: seconds),
          publicKey,
          now: now,
        ),
        throwsFormatException,
      );
      expect(
        EntrypointManifest.verify(
          await envelope(service: 'another-service'),
          publicKey,
          now: now,
        ),
        throwsFormatException,
      );
    },
  );

  for (final method in ['GET', 'POST']) {
    test(
      '$method network failure retries only a read on a verified backup',
      () async {
        final probe = _Adapter((_) async => _settings());
        final entries = ServiceEntrypoints(
          dio: Dio()..httpClientAdapter = probe,
        );
        final adapter = _Adapter((options) async {
          if (options.uri.host == 'fastdog.ws') {
            throw DioException(
              requestOptions: options,
              type: DioExceptionType.connectionError,
            );
          }
          return ResponseBody.fromString(
            '{"data":{"ok":true}}',
            200,
            headers: {
              'content-type': ['application/json'],
            },
          );
        });
        final api = V2BoardApi(
          'https://fastdog.ws',
          dio: Dio()..httpClientAdapter = adapter,
          entrypoints: entries,
        )..accessToken = 'test-token';
        addTearDown(api.close);
        if (method == 'GET') {
          expect(await api.object(method, '/me'), {'ok': true});
          expect(adapter.requests.map((r) => r.uri.host), [
            'fastdog.ws',
            'fastdog.me',
          ]);
          expect(
            adapter.requests.last.headers['Authorization'],
            'Bearer test-token',
          );
          expect(
            probe.requests.every(
              (r) => !r.headers.containsKey('Authorization'),
            ),
            isTrue,
          );
        } else {
          await expectLater(
            api.object(method, '/me/orders', body: {'value': 1}),
            throwsA(isA<V2BoardProblem>()),
          );
          expect(adapter.requests, hasLength(1));
        }
      },
    );
  }
}
