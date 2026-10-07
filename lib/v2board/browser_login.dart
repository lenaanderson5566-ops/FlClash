import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:app_links/app_links.dart';
import 'package:crypto/crypto.dart';

import 'api.dart';

class BrowserLogin {
  BrowserLogin({
    required this.platform,
    required this.completedMessage,
    this.timeout = const Duration(minutes: 5),
  });

  final String platform;
  final String completedMessage;
  final Duration timeout;
  HttpServer? _server;
  StreamSubscription<Uri>? _links;
  Completer<Uri?>? _callback;
  bool _cancelled = false;

  static String secret() => base64UrlEncode(
    List<int>.generate(32, (_) => Random.secure().nextInt(256)),
  ).replaceAll('=', '');

  static String challenge(String verifier) => base64UrlEncode(
    sha256.convert(ascii.encode(verifier)).bytes,
  ).replaceAll('=', '');

  static bool matches(Uri uri, Uri redirect, String state) =>
      uri.scheme == redirect.scheme &&
      uri.host == redirect.host &&
      uri.port == redirect.port &&
      uri.path == redirect.path &&
      uri.userInfo.isEmpty &&
      uri.fragment.isEmpty &&
      uri.queryParametersAll.length == 2 &&
      uri.queryParametersAll['state']?.length == 1 &&
      uri.queryParametersAll['code']?.length == 1 &&
      uri.queryParameters['state'] == state &&
      RegExp(r'^[a-f0-9]{64}$').hasMatch(uri.queryParameters['code'] ?? '');

  Future<void> authenticate(
    V2BoardApi api,
    Uri website,
    Future<bool> Function(Uri) launch,
  ) async {
    final callback = _callback = Completer<Uri?>();
    final verifier = secret();
    final state = secret();
    try {
      final Uri redirect;
      if (platform == 'android') {
        redirect = Uri.parse('ws.fastdog.fastai://oauth/callback');
        _links = AppLinks().uriLinkStream.listen((uri) {
          if (!callback.isCompleted && matches(uri, redirect, state)) {
            callback.complete(uri);
          }
        });
      } else {
        final server = _server = await HttpServer.bind(
          InternetAddress.loopbackIPv4,
          0,
        );
        redirect = Uri.parse(
          'http://127.0.0.1:${server.port}/fastai-auth/callback',
        );
        server.listen((request) async {
          final uri = redirect.replace(
            path: request.uri.path,
            query: request.uri.query,
          );
          final valid =
              request.method == 'GET' &&
              request.headers.value(HttpHeaders.hostHeader) ==
                  '127.0.0.1:${server.port}' &&
              !callback.isCompleted &&
              matches(uri, redirect, state);
          request.response.headers.set(
            HttpHeaders.cacheControlHeader,
            'no-store',
          );
          request.response.headers.set('Referrer-Policy', 'no-referrer');
          request.response.headers.contentType = ContentType(
            'text',
            'plain',
            charset: 'utf-8',
          );
          request.response.statusCode = valid ? 200 : 400;
          request.response.write(
            valid ? completedMessage : 'Invalid authorization response',
          );
          try {
            await request.response.close();
          } on IOException {
            // Closing the browser tab must not discard a verified callback.
          } finally {
            if (valid && !callback.isCompleted) callback.complete(uri);
          }
        });
      }
      if (_cancelled) throw const V2BoardProblem('client_auth_cancelled');
      final data = await api.object(
        'POST',
        '/auth/client-authorizations',
        body: {
          'codeChallenge': challenge(verifier),
          'state': state,
          'redirectUri': redirect.toString(),
          'platform': platform,
        },
      );
      if (_cancelled) throw const V2BoardProblem('client_auth_cancelled');
      final url = Uri.tryParse(data['authorizationUrl'] as String? ?? '');
      final id = data['authorizationId'];
      final fragment = url == null ? null : Uri.tryParse(url.fragment);
      if (id is! String ||
          !RegExp(r'^[a-f0-9]{64}$').hasMatch(id) ||
          url == null ||
          url.scheme != 'https' ||
          url.origin != website.origin ||
          url.userInfo.isNotEmpty ||
          url.query.isNotEmpty ||
          url.path != '/app' ||
          fragment?.path != '/client-authorize' ||
          fragment?.queryParametersAll.length != 1 ||
          fragment?.queryParameters['authorizationId'] != id) {
        throw const V2BoardProblem('invalid_response');
      }
      if (!await launch(url)) {
        throw const V2BoardProblem('client_auth_unavailable');
      }
      final result = await callback.future.timeout(
        timeout,
        onTimeout: () => throw const V2BoardProblem('CLIENT_AUTH_EXPIRED'),
      );
      if (result == null || _cancelled) {
        throw const V2BoardProblem('client_auth_cancelled');
      }
      await api.exchangeClientCode(
        result.queryParameters['code']!,
        verifier,
        redirect.toString(),
      );
      if (_cancelled) {
        try {
          await api.request('DELETE', '/me/session');
        } on V2BoardProblem {
          // Local cancellation still takes effect if revocation is unreachable.
        }
        throw const V2BoardProblem('client_auth_cancelled');
      }
    } finally {
      await _links?.cancel();
      await _server?.close(force: true);
      _server = null;
      _links = null;
      _callback = null;
    }
  }

  void cancel() {
    _cancelled = true;
    final callback = _callback;
    if (callback != null && !callback.isCompleted) callback.complete(null);
    unawaited(_server?.close(force: true));
  }
}
