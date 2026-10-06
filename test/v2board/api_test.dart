import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/config.dart';

class _Adapter implements HttpClientAdapter {
  _Adapter(this.respond);
  final ResponseBody Function(RequestOptions) respond;
  final requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return respond(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(dynamic body, [int status = 200]) => ResponseBody.fromString(
  jsonEncode(body),
  status,
  headers: {
    Headers.contentTypeHeader: ['application/json'],
  },
);

void main() {
  test('website login uses a one-time code on the trusted origin', () async {
    final code = List.filled(64, 'a').join();
    final adapter = _Adapter(
      (_) => _json({
        'data': 'https://panel.example/#/login?verify=$code&redirect=dashboard',
      }),
    );
    final api = V2BoardApi(
      'https://panel.example',
      dio: Dio()..httpClientAdapter = adapter,
    );
    addTearDown(api.close);
    api.accessToken = 'private-session';
    final link = await api.loginLink(Uri.parse('https://panel.example'));
    expect(link.query, isEmpty);
    expect(link.toString(), isNot(contains('private-session')));
    expect(adapter.requests.single.method, 'POST');
    expect(
      adapter.requests.single.headers['Authorization'],
      'Bearer private-session',
    );
  });

  test(
    'website login rejects other origins and long-lived tokens in queries',
    () async {
      for (final link in [
        'https://evil.example/#/login?verify=${List.filled(64, 'a').join()}&redirect=dashboard',
        'https://panel.example/?token=session#/login?verify=wrong&redirect=dashboard',
        'http://panel.example/#/login?verify=wrong&redirect=dashboard',
      ]) {
        final adapter = _Adapter((_) => _json({'data': link}));
        final api = V2BoardApi(
          'https://panel.example',
          dio: Dio()..httpClientAdapter = adapter,
        );
        addTearDown(api.close);
        await expectLater(
          api.loginLink(Uri.parse('https://panel.example')),
          throwsA(isA<V2BoardProblem>()),
        );
      }
    },
  );

  test(
    'native configuration uses the panel session and never a subscription URL',
    () async {
      final adapter = _Adapter(
        (_) => ResponseBody.fromString(
          'proxies: []\nproxy-groups: []\nrules: []\n',
          200,
          headers: {
            Headers.contentTypeHeader: ['application/yaml'],
          },
        ),
      );
      final api = V2BoardApi(
        'https://panel.example',
        dio: Dio()..httpClientAdapter = adapter,
      );
      addTearDown(api.close);
      api.accessToken = 'session-secret';
      final bytes = await api.clientConfig(
        version: '0.8.99',
        platform: 'windows',
      );
      expect(utf8.decode(bytes), contains('proxies:'));
      final request = adapter.requests.single;
      expect(request.uri.path, '/api/v10/me/client-config');
      expect(request.headers['Authorization'], 'Bearer session-secret');
      expect(request.queryParameters, {
        'clientVersion': '0.8.99',
        'platform': 'windows',
      });
      expect(request.followRedirects, isFalse);
    },
  );

  test('native configuration requests and accepts a JSON snapshot', () async {
    final body = {
      'data': {'configVersion': 'snapshot', 'yaml': 'proxies: []', 'nodes': []},
    };
    final adapter = _Adapter((_) => _json(body));
    final api = V2BoardApi(
      'https://panel.example',
      dio: Dio()..httpClientAdapter = adapter,
    );
    addTearDown(api.close);
    api.accessToken = 'session-secret';
    final bytes = await api.clientConfig(
      version: '0.8.99',
      platform: 'windows',
    );
    expect(jsonDecode(utf8.decode(bytes)), body);
    expect(
      adapter.requests.single.headers['Accept'],
      'application/json, application/yaml;q=0.9',
    );
  });

  test(
    'native entitlement denial preserves the session while revocation clears it',
    () async {
      for (final status in [403, 401]) {
        var cleared = false;
        final adapter = _Adapter(
          (_) => _json({
            'code': status == 403
                ? 'SUBSCRIPTION_UNAVAILABLE'
                : 'UNAUTHENTICATED',
          }, status),
        );
        final api = V2BoardApi(
          'https://panel.example',
          dio: Dio()..httpClientAdapter = adapter,
        );
        addTearDown(api.close);
        api.accessToken = 'session-secret';
        api.onSessionRejected = () async {
          cleared = true;
        };
        await expectLater(
          api.clientConfig(version: '0.8.99', platform: 'windows'),
          throwsA(
            isA<V2BoardProblem>().having((e) => e.status, 'status', status),
          ),
        );
        expect(cleared, status == 401);
        expect(adapter.requests, hasLength(1));
      }
    },
  );

  test('native configuration rejects redirects and HTML responses', () async {
    for (final status in [301, 200]) {
      final api = V2BoardApi(
        'https://panel.example',
        dio: Dio()
          ..httpClientAdapter = _Adapter(
            (_) => ResponseBody.fromString(
              '<html>redirect</html>',
              status,
              headers: {
                Headers.contentTypeHeader: ['text/html'],
              },
            ),
          ),
      );
      addTearDown(api.close);
      api.accessToken = 'session-secret';
      await expectLater(
        api.clientConfig(version: '0.8.99', platform: 'windows'),
        throwsA(isA<V2BoardProblem>()),
      );
    }
  });

  test(
    'session rejection invokes cleanup before returning an authenticated error',
    () async {
      var cleared = false;
      final api = V2BoardApi(
        'https://panel.example',
        dio: Dio()
          ..httpClientAdapter = _Adapter(
            (_) => _json({'code': 'unauthenticated'}, 401),
          ),
      );
      addTearDown(api.close);
      api.accessToken = 'revoked';
      api.onSessionRejected = () async {
        cleared = true;
        api.accessToken = null;
      };
      await expectLater(
        api.object('GET', '/me'),
        throwsA(isA<V2BoardProblem>()),
      );
      expect(cleared, isTrue);
      expect(api.accessToken, isNull);
    },
  );
  test(
    'V10 login uses body fields and authenticated calls use Bearer',
    () async {
      final adapter = _Adapter(
        (options) => _json({
          'data': options.path == '/auth/sessions'
              ? {'accessToken': 'session-secret', 'tokenType': 'Bearer'}
              : {'email': 'user@example.com'},
        }),
      );
      final api = V2BoardApi(
        'https://panel.example',
        dio: Dio()..httpClientAdapter = adapter,
      );
      addTearDown(api.close);
      await api.login(' user@example.com ', 'password');
      await api.object('GET', '/me');
      expect(adapter.requests[0].uri.path, '/api/v10/auth/sessions');
      expect(adapter.requests[0].data['email'], 'user@example.com');
      expect(adapter.requests[0].queryParameters, isEmpty);
      expect(
        adapter.requests[1].headers['Authorization'],
        'Bearer session-secret',
      );
      expect(adapter.requests[1].headers['Accept-Language'], 'zh-CN');
      expect(adapter.requests[1].followRedirects, isFalse);
    },
  );

  for (final status in [401, 403, 409, 422, 429, 502]) {
    test(
      'HTTP $status preserves problem identity and never replays POST',
      () async {
        final adapter = _Adapter(
          (_) => _json({
            'code': 'business_error',
            'detail': 'detail',
            'requestId': 'r-1',
          }, status),
        );
        final api = V2BoardApi(
          'https://panel.example',
          dio: Dio()..httpClientAdapter = adapter,
        );
        addTearDown(api.close);
        await expectLater(
          api.object(
            'POST',
            '/me/orders',
            body: {'planId': 1, 'billingPeriod': 'monthly'},
          ),
          throwsA(
            isA<V2BoardProblem>()
                .having((error) => error.status, 'status', status)
                .having((error) => error.code, 'code', 'business_error'),
          ),
        );
        expect(adapter.requests, hasLength(1));
      },
    );
  }

  test('204 logout does not require a JSON envelope', () async {
    final api = V2BoardApi(
      'https://panel.example',
      dio: Dio()
        ..httpClientAdapter = _Adapter((_) => ResponseBody.fromString('', 204)),
    );
    addTearDown(api.close);
    expect(await api.request('DELETE', '/me/session'), isNull);
  });

  test('lists send V10 page and pageSize', () async {
    final adapter = _Adapter(
      (_) => _json({
        'data': [
          {'orderNumber': '1'},
        ],
      }),
    );
    final api = V2BoardApi(
      'https://panel.example',
      dio: Dio()..httpClientAdapter = adapter,
    );
    addTearDown(api.close);
    expect(await api.list('/me/orders', page: 2), hasLength(1));
    expect(adapter.requests.single.queryParameters, {
      'page': 2,
      'pageSize': 20,
    });
  });

  test('unexpected HTML and incomplete login responses fail closed', () async {
    final api = V2BoardApi(
      'https://panel.example',
      dio: Dio()
        ..httpClientAdapter = _Adapter(
          (_) => _json({
            'data': {'auth_data': 'old-token'},
          }),
        ),
    );
    addTearDown(api.close);
    await expectLater(
      api.login('a@b.com', 'p'),
      throwsA(isA<V2BoardProblem>()),
    );
    expect(api.accessToken, isNull);
  });

  test('origins reject HTTP, userinfo, query, fragment and API paths', () {
    for (final origin in [
      'http://panel.example',
      'https://u:p@panel.example',
      'https://panel.example/api/v1',
      'https://panel.example?token=x',
      'https://panel.example/#x',
    ]) {
      expect(() => V2BoardConfig.origin(origin), throwsFormatException);
    }
  });
}
