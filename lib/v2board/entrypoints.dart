import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cryptography/cryptography.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

class EntrypointManifest {
  const EntrypointManifest(this.version, this.expiresAt, this.origins);
  final int version;
  final int expiresAt;
  final List<Uri> origins;

  static Future<EntrypointManifest> verify(
    Map<String, dynamic> envelope,
    String publicKey, {
    int minimumVersion = 0,
    DateTime? now,
  }) async {
    final key = base64Decode(publicKey);
    final bytes = base64Decode(envelope['payload'] as String);
    final signature = base64Decode(envelope['signature'] as String);
    if (key.length != 32 ||
        bytes.length > 16384 ||
        !await Ed25519().verify(
          bytes,
          signature: Signature(
            signature,
            publicKey: SimplePublicKey(key, type: KeyPairType.ed25519),
          ),
        )) {
      throw const FormatException('invalid_entrypoint_signature');
    }
    final data = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
    final seconds = (now ?? DateTime.now()).millisecondsSinceEpoch ~/ 1000;
    final issued = data['issuedAt'] as int;
    final expires = data['expiresAt'] as int;
    final version = data['version'] as int;
    final digest = await Sha256().hash(key);
    final serviceId = digest.bytes
        .map((v) => v.toRadixString(16).padLeft(2, '0'))
        .join();
    if (data['serviceId'] != serviceId ||
        version < minimumVersion ||
        issued > seconds + 300 ||
        expires <= seconds ||
        expires <= issued ||
        expires - issued > 7 * 86400) {
      throw const FormatException('expired_entrypoint_manifest');
    }
    final entries = data['endpoints'] as List<dynamic>;
    if (entries.isEmpty || entries.length > 16) throw const FormatException();
    final sorted = entries
        .map((value) => value as Map<String, dynamic>)
        .toList();
    for (final entry in sorted) {
      final priority = entry['priority'] as int;
      if (priority < 1 || priority > 100) throw const FormatException();
    }
    sorted.sort(
      (a, b) => (a['priority'] as int).compareTo(b['priority'] as int),
    );
    final origins = sorted
        .map((entry) => V2BoardConfig.origin(entry['origin'] as String))
        .toList();
    if (origins.toSet().length != origins.length) throw const FormatException();
    return EntrypointManifest(version, expires, origins);
  }
}

class ServiceEntrypoints {
  ServiceEntrypoints({Dio? dio}) : _dio = dio ?? Dio() {
    if (dio == null) {
      _dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (_) => 'DIRECT';
          return client;
        },
      );
    }
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 4),
      receiveTimeout: const Duration(seconds: 4),
      followRedirects: false,
      validateStatus: (status) => status == 200,
    );
  }
  static final shared = ServiceEntrypoints();
  static const publicKey = String.fromEnvironment(
    'FASTAI_ENTRYPOINT_PUBLIC_KEY',
  );
  static String get identity => publicKey.isNotEmpty
      ? publicKey
      : V2BoardConfig.origin(V2BoardConfig.panelUrl).origin;
  static const distributionSources = String.fromEnvironment(
    'FASTAI_ENTRYPOINT_SOURCES',
  );
  static const backups = String.fromEnvironment(
    'FASTAI_SERVICE_ORIGINS',
    defaultValue: 'https://fastdog.me,https://fastdog66.com',
  );
  static List<Uri> get builtins => {
    V2BoardConfig.origin(V2BoardConfig.panelUrl),
    ...backups
        .split(',')
        .where((s) => s.trim().isNotEmpty)
        .map(V2BoardConfig.origin),
  }.toList();

  final Dio _dio;
  Uri current = V2BoardConfig.origin(V2BoardConfig.panelUrl);
  List<Uri> _origins = builtins;
  int _version = 0;
  int _expiresAt = 0;
  DateTime? _checkedAt;
  Future<void>? _initializing;
  Future<void>? _loading;
  Future<void>? _refreshing;
  Future<bool>? _selecting;
  static const _cacheKey = 'fastai.entrypoint.envelope';

  Future<void> prepare() async {
    await initialize();
    if (_expiresAt != 0 &&
        _expiresAt <= DateTime.now().millisecondsSinceEpoch ~/ 1000) {
      _origins = builtins;
      _expiresAt = 0;
      if (!_origins.contains(current)) current = _origins.first;
      await _select(excludeCurrent: false);
    }
  }

  Future<void> initialize() => _initializing ??= _initialize();
  Future<void> loadCache() => _loading ??= _loadCache();

  Future<void> _loadCache() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getString('fastai.entrypoint.identity') == identity) {
      _version = preferences.getInt('fastai.entrypoint.version') ?? 0;
      final checked = preferences.getInt('fastai.entrypoint.checkedAt');
      if (checked != null && checked <= DateTime.now().millisecondsSinceEpoch) {
        _checkedAt = DateTime.fromMillisecondsSinceEpoch(checked);
      }
    }
    final envelope = preferences.getString(_cacheKey);
    if (publicKey.isNotEmpty && envelope != null) {
      try {
        final manifest = await EntrypointManifest.verify(
          jsonDecode(envelope) as Map<String, dynamic>,
          publicKey,
          minimumVersion: _version,
        );
        _accept(manifest);
      } catch (_) {
        _checkedAt = null;
        await preferences.remove(_cacheKey);
      }
    }
    final previous = preferences.getString('fastai.entrypoint.last');
    if (previous != null &&
        _origins.any((origin) => origin.origin == previous)) {
      current = V2BoardConfig.origin(previous);
    }
  }

  Future<void> _initialize() async {
    await loadCache();
    if (!await _select(excludeCurrent: false)) {
      await refresh(force: true);
      await _select(excludeCurrent: false);
    }
  }

  void _accept(EntrypointManifest manifest) {
    _version = manifest.version;
    _expiresAt = manifest.expiresAt;
    _origins = manifest.origins;
    if (!_origins.contains(current)) current = _origins.first;
  }

  Future<bool> failover() async {
    await initialize();
    if (await _select(excludeCurrent: true)) {
      return true;
    }
    await refresh(force: true);
    return _select(excludeCurrent: true);
  }

  Future<bool> _select({required bool excludeCurrent}) async {
    if (_selecting != null) return _selecting!;
    final operation = _probe(excludeCurrent);
    _selecting = operation;
    try {
      return await operation;
    } finally {
      _selecting = null;
    }
  }

  Future<bool> _probe(bool excludeCurrent) async {
    if (_expiresAt != 0 &&
        _expiresAt <= DateTime.now().millisecondsSinceEpoch ~/ 1000) {
      _origins = builtins;
    }
    if (!_origins.contains(current)) current = _origins.first;
    final candidates = {
      if (!excludeCurrent) current,
      ..._origins,
    }.where((origin) => !excludeCurrent || origin != current);
    for (final origin in candidates) {
      try {
        final response = await _dio.get<dynamic>(
          '${origin.origin}/api/v10/public/settings',
        );
        final data = response.data as Map<String, dynamic>;
        final settings = data['data'] as Map<String, dynamic>;
        final website = V2BoardConfig.origin(settings['appUrl'] as String);
        if (!_origins.contains(website) && !builtins.contains(website)) {
          continue;
        }
        current = origin;
        final preferences = await SharedPreferences.getInstance();
        await preferences.setString('fastai.entrypoint.last', origin.origin);
        unawaited(refresh(force: excludeCurrent));
        return true;
      } catch (_) {
        continue;
      }
    }
    return false;
  }

  Future<void> refresh({bool force = false}) async {
    if (publicKey.isEmpty) {
      return;
    }
    if (_refreshing != null) {
      await _refreshing;
      return;
    }
    if (!force &&
        _checkedAt != null &&
        DateTime.now().difference(_checkedAt!) < const Duration(hours: 6)) {
      return;
    }
    _checkedAt = DateTime.now();
    final operation = _refresh();
    _refreshing = operation;
    try {
      await operation;
    } finally {
      _refreshing = null;
    }
  }

  Future<void> _refresh() async {
    final sources = {
      '${current.origin}/api/v10/public/fastai/entrypoints',
      ..._origins.map(
        (origin) => '${origin.origin}/api/v10/public/fastai/entrypoints',
      ),
      ...distributionSources
          .split(',')
          .where((value) => value.trim().isNotEmpty),
    };
    for (final source in sources) {
      try {
        final uri = Uri.parse(source);
        if (uri.scheme != 'https' ||
            uri.userInfo.isNotEmpty ||
            uri.hasFragment) {
          continue;
        }
        final response = await _dio.get<dynamic>(source);
        final data = response.data as Map<String, dynamic>;
        final envelope = (data['data'] ?? data) as Map<String, dynamic>;
        final manifest = await EntrypointManifest.verify(
          envelope,
          publicKey,
          minimumVersion: _version,
        );
        final preferences = await SharedPreferences.getInstance();
        await preferences.setString(_cacheKey, jsonEncode(envelope));
        await preferences.setInt('fastai.entrypoint.version', manifest.version);
        await preferences.setString('fastai.entrypoint.identity', identity);
        await preferences.setInt(
          'fastai.entrypoint.checkedAt',
          DateTime.now().millisecondsSinceEpoch,
        );
        final previous = current;
        _accept(manifest);
        if (current != previous) {
          await _select(excludeCurrent: false);
        }
        return;
      } catch (_) {
        continue;
      }
    }
  }

  bool trusts(Uri origin) =>
      _origins.contains(origin) || builtins.contains(origin);
}
