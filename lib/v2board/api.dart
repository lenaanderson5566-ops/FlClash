import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'config.dart';
import 'language.dart';
import 'diagnostics.dart';

typedef V10Object = Map<String, dynamic>;

class V2BoardProblem implements Exception {
  const V2BoardProblem(
    this.code, {
    this.status,
    this.detail = '',
    this.requestId = '',
  });

  final String code;
  final int? status;
  final String detail;
  final String requestId;

  bool get sessionRejected =>
      status == 401 ||
      (status == 403 &&
          code != 'SUBSCRIPTION_UNAVAILABLE' &&
          code != 'CLIENT_DISABLED');

  @override
  String toString() => code;
}

class V2BoardApi {
  V2BoardApi(String origin, {Dio? dio})
    : panel = V2BoardConfig.origin(origin),
      _dio = dio ?? Dio() {
    if (dio == null) {
      _dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback = null;
          client.findProxy = (_) => 'DIRECT';
          return client;
        },
      );
    }
    _dio.options = BaseOptions(
      baseUrl: '${panel.origin}/api/v10',
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 15),
      followRedirects: false,
      validateStatus: (status) => status != null,
      headers: {
        'Accept': 'application/json',
        'User-Agent': V2BoardConfig.appName,
      },
    );
  }

  final Uri panel;
  final Dio _dio;
  String? accessToken;
  Future<void> Function()? onSessionRejected;
  String? version;
  String _language = 'en-US';
  String get language => _language;
  set language(String value) => _language = clientLanguage(value);
  void Function(ClientRequestDiagnostic event)? onDiagnostic;

  Future<T> _perform<T>(
    String method,
    String path,
    Future<T> Function() action,
  ) async {
    final timer = Stopwatch()..start();
    V2BoardProblem? problem;
    try {
      return await action();
    } on V2BoardProblem catch (error) {
      problem = error;
      rethrow;
    } finally {
      timer.stop();
      onDiagnostic?.call(
        ClientRequestDiagnostic(
          method: method,
          path: path,
          code: problem?.code ?? 'ok',
          requestId: problem?.requestId ?? '',
          status: problem?.status,
          duration: timer.elapsed,
        ),
      );
    }
  }

  Future<dynamic> request(
    String method,
    String path, {
    V10Object? body,
    V10Object? query,
  }) => _perform(method, path, () async {
    try {
      final response = await _dio.request<dynamic>(
        path,
        data: body,
        queryParameters: query,
        options: Options(
          method: method,
          headers: {
            'Accept-Language': language,
            'User-Agent':
                '${V2BoardConfig.appName}${version == null ? '' : '/$version'}',
            if (accessToken != null) 'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      final status = response.statusCode ?? 0;
      final payload = response.data;
      await _checkStatus(status, payload);
      if (status == 204) return null;
      if (payload is! Map || !payload.containsKey('data')) {
        throw const V2BoardProblem('invalid_response');
      }
      return payload['data'];
    } on DioException catch (error) {
      throw V2BoardProblem(switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => 'request_timeout',
        DioExceptionType.badCertificate => 'certificate_error',
        _ => 'network_error',
      });
    }
  });

  Future<void> _checkStatus(int status, dynamic payload) async {
    if (status >= 200 && status < 300) return;
    final problem = payload is Map ? payload : const <String, dynamic>{};
    final code = problem['code'] as String? ?? 'request_failed';
    final error = V2BoardProblem(
      code,
      status: status,
      detail: problem['detail'] as String? ?? '',
      requestId: problem['requestId'] as String? ?? '',
    );
    if (error.sessionRejected && accessToken != null) {
      await onSessionRejected?.call();
    }
    throw error;
  }

  Future<Uint8List> clientConfig({
    required String version,
    required String platform,
    String? architecture,
  }) => _clientConfig(
    version: version,
    platform: platform,
    architecture: architecture,
  );

  Future<void> validateCachedConfig({
    required String version,
    required String platform,
    String? architecture,
  }) async {
    await _clientConfig(
      version: version,
      platform: platform,
      architecture: architecture,
      head: true,
    );
  }

  Future<Uint8List> _clientConfig({
    required String version,
    required String platform,
    String? architecture,
    bool head = false,
  }) => _perform(head ? 'HEAD' : 'GET', '/me/client-config', () async {
    if (accessToken == null || accessToken!.isEmpty) {
      throw const V2BoardProblem('UNAUTHENTICATED', status: 401);
    }
    try {
      final response = await _dio.request<List<int>>(
        '/me/client-config',
        queryParameters: {
          'clientVersion': version,
          'platform': platform,
          'architecture': ?architecture,
        },
        options: Options(
          method: head ? 'HEAD' : 'GET',
          responseType: ResponseType.bytes,
          headers: {
            'Accept': 'application/json, application/yaml;q=0.9',
            'Accept-Language': language,
            'Authorization': 'Bearer $accessToken',
            'User-Agent': '${V2BoardConfig.appName}/$version',
          },
        ),
      );
      final bytes = response.data ?? const <int>[];
      final status = response.statusCode ?? 0;
      dynamic problem;
      if (head && (status < 200 || status >= 300)) {
        await _clientConfig(
          version: version,
          platform: platform,
          architecture: architecture,
        );
        throw const V2BoardProblem('invalid_response');
      }
      if (status < 200 || status >= 300) {
        try {
          problem = jsonDecode(utf8.decode(bytes));
        } on FormatException {
          problem = null;
        }
      }
      await _checkStatus(status, problem);
      if (head) {
        final format = response.headers.value('content-type') ?? '';
        if (!const ['yaml', 'json'].any(format.contains) ||
            !const [
              '1',
              '2',
            ].contains(response.headers.value('x-fastai-config-version'))) {
          throw const V2BoardProblem('invalid_response');
        }
        return Uint8List(0);
      }
      if (bytes.isEmpty ||
          !const ['yaml', 'json'].any(
            (type) =>
                (response.headers.value('content-type') ?? '').contains(type),
          )) {
        throw const V2BoardProblem('invalid_response');
      }
      return Uint8List.fromList(bytes);
    } on DioException catch (error) {
      throw V2BoardProblem(switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => 'request_timeout',
        DioExceptionType.badCertificate => 'certificate_error',
        _ => 'network_error',
      });
    }
  });

  Future<V10Object> object(
    String method,
    String path, {
    V10Object? body,
  }) async {
    final data = await request(method, path, body: body);
    if (data is! Map<String, dynamic>) {
      throw const V2BoardProblem('invalid_response');
    }
    return data;
  }

  Future<List<V10Object>> list(String path, {int page = 1}) async {
    final data = await request(
      'GET',
      path,
      query: {'page': page, 'pageSize': 20},
    );
    if (data is! List) throw const V2BoardProblem('invalid_response');
    return data.map((item) {
      if (item is! Map<String, dynamic>) {
        throw const V2BoardProblem('invalid_response');
      }
      return item;
    }).toList();
  }

  Future<void> login(String email, String password) async {
    final result = await object(
      'POST',
      '/auth/sessions',
      body: {'email': email.trim(), 'password': password, 'language': language},
    );
    final token = result['accessToken'];
    if (token is! String || token.isEmpty || result['tokenType'] != 'Bearer') {
      throw const V2BoardProblem('invalid_response');
    }
    accessToken = token;
  }

  Future<Uri> loginLink(Uri website) async {
    final data = await request(
      'POST',
      '/me/login-links',
      body: {'redirect': 'dashboard'},
    );
    if (data is! String) throw const V2BoardProblem('invalid_response');
    final url = Uri.tryParse(data);
    if (url == null ||
        url.scheme != 'https' ||
        url.origin != website.origin ||
        url.userInfo.isNotEmpty ||
        url.query.isNotEmpty ||
        !url.fragment.startsWith('/login?verify=')) {
      throw const V2BoardProblem('invalid_response');
    }
    final fragment = Uri.parse(url.fragment);
    if (!RegExp(
          r'^[a-f0-9]{64}$',
        ).hasMatch(fragment.queryParameters['verify'] ?? '') ||
        fragment.queryParameters['redirect'] != 'dashboard' ||
        fragment.queryParameters.length != 2) {
      throw const V2BoardProblem('invalid_response');
    }
    return url;
  }

  void close() => _dio.close(force: true);
}
