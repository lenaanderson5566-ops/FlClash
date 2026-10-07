import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/browser_login.dart';

class _Api extends V2BoardApi {
  _Api() : super('https://fastdog.ws');
  V10Object? creation;
  String? verifier;
  String origin = 'https://fastdog.ws';
  @override
  Future<V10Object> object(
    String method,
    String path, {
    V10Object? body,
  }) async {
    if (path == '/auth/client-authorizations') {
      creation = body;
      return {
        'authorizationId': 'a' * 64,
        'authorizationUrl':
            '$origin/app#/client-authorize?authorizationId=${'a' * 64}',
      };
    }
    throw StateError('Unexpected request');
  }

  @override
  Future<void> exchangeClientCode(
    String code,
    String value,
    String redirectUri,
  ) async {
    expect(code, 'b' * 64);
    expect(redirectUri, creation!['redirectUri']);
    expect(BrowserLogin.challenge(value), creation!['codeChallenge']);
    verifier = value;
    accessToken = 'app-session';
  }
}

void main() {
  test('PKCE S256 matches the RFC 7636 vector', () {
    expect(
      BrowserLogin.challenge('dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk'),
      'E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM',
    );
  });
  test('callback accepts only this attempt and exact login shape', () {
    final redirect = Uri.parse('ws.fastdog.fastai://oauth/callback');
    final valid = redirect.replace(
      queryParameters: {'code': 'a' * 64, 'state': 's' * 43},
    );
    expect(BrowserLogin.matches(valid, redirect, 's' * 43), isTrue);
    for (final uri in [
      valid.replace(path: '/install-config'),
      valid.replace(host: 'other'),
      valid.replace(fragment: 'secret'),
      valid.replace(query: '${valid.query}&state=${'s' * 43}'),
      valid.replace(query: '${valid.query}&url=https://example.com'),
    ]) {
      expect(BrowserLogin.matches(uri, redirect, 's' * 43), isFalse);
    }
    expect(BrowserLogin.matches(valid, redirect, 'wrong-state'), isFalse);
  });
  test(
    'loopback ignores an invalid response then exchanges bound code',
    () async {
      final api = _Api();
      final login = BrowserLogin(
        platform: 'windows',
        completedMessage: 'Return to FastAI',
      );
      final http = HttpClient();
      addTearDown(api.close);
      addTearDown(http.close);
      await login.authenticate(api, Uri.parse('https://fastdog.ws'), (
        url,
      ) async {
        expect(url.scheme, 'https');
        final redirect = Uri.parse(api.creation!['redirectUri'] as String);
        final bad = await (await http.getUrl(
          redirect.replace(
            queryParameters: {'code': 'b' * 64, 'state': 'wrong'},
          ),
        )).close();
        expect(bad.statusCode, 400);
        await bad.drain<void>();
        expect(api.verifier, isNull);
        final good = await (await http.getUrl(
          redirect.replace(
            queryParameters: {
              'code': 'b' * 64,
              'state': api.creation!['state'] as String,
            },
          ),
        )).close();
        expect(good.statusCode, 200);
        expect(good.headers.value('cache-control'), 'no-store');
        await good.drain<void>();
        return true;
      });
      expect(api.accessToken, 'app-session');
      expect(api.verifier, isNotNull);
      final redirect = Uri.parse(api.creation!['redirectUri'] as String);
      await expectLater(
        http.getUrl(redirect).then((request) => request.close()),
        throwsA(anyOf(isA<SocketException>(), isA<HttpException>())),
      );
    },
  );
  test('cancellation leaves no authenticated session', () async {
    final api = _Api();
    addTearDown(api.close);
    final login = BrowserLogin(platform: 'windows', completedMessage: 'Return');
    await expectLater(
      login.authenticate(api, Uri.parse('https://fastdog.ws'), (url) async {
        login.cancel();
        return true;
      }),
      throwsA(
        isA<V2BoardProblem>().having(
          (e) => e.code,
          'code',
          'client_auth_cancelled',
        ),
      ),
    );
    expect(api.accessToken, isNull);
  });
  test('untrusted browser destination is never opened', () async {
    final api = _Api()..origin = 'https://evil.example';
    addTearDown(api.close);
    final login = BrowserLogin(platform: 'windows', completedMessage: 'Return');
    var opened = false;
    await expectLater(
      login.authenticate(api, Uri.parse('https://fastdog.ws'), (url) async {
        opened = true;
        return true;
      }),
      throwsA(isA<V2BoardProblem>()),
    );
    expect(opened, isFalse);
  });
  test('missing callback expires and releases its listener', () async {
    final api = _Api();
    addTearDown(api.close);
    final login = BrowserLogin(
      platform: 'windows',
      completedMessage: 'Return',
      timeout: const Duration(milliseconds: 30),
    );
    await expectLater(
      login.authenticate(
        api,
        Uri.parse('https://fastdog.ws'),
        (url) async => true,
      ),
      throwsA(
        isA<V2BoardProblem>().having(
          (e) => e.code,
          'code',
          'CLIENT_AUTH_EXPIRED',
        ),
      ),
    );
    expect(api.accessToken, isNull);
  });
}
