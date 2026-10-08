import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'api.dart';
import 'config.dart';
import 'entrypoints.dart';

class V2BoardSession {
  const V2BoardSession({
    FlutterSecureStorage storage = const FlutterSecureStorage(),
  }) : _storage = storage;

  final FlutterSecureStorage _storage;
  static const _key = 'fastai.v10.session';

  Future<V2BoardApi?> restore() async {
    final value = await _storage.read(key: _key);
    if (value == null) return null;
    try {
      final data = jsonDecode(value) as Map<String, dynamic>;
      final origin = data['origin'] as String;
      await ServiceEntrypoints.shared.loadCache();
      final identity = data['serviceIdentity'];
      final trusted = identity == null
          ? ServiceEntrypoints.shared.trusts(V2BoardConfig.origin(origin))
          : identity == ServiceEntrypoints.identity;
      if (!trusted) {
        await clear();
        return null;
      }
      final token = data['accessToken'] as String;
      if (token.isEmpty) throw const FormatException();
      return V2BoardApi(V2BoardConfig.panelUrl)..accessToken = token;
    } on FormatException {
      await clear();
      return null;
    } on TypeError {
      await clear();
      return null;
    }
  }

  Future<Uri> websiteLink({V2BoardApi? api, String? version}) async {
    final restored = api ?? await restore();
    final client = restored ?? V2BoardApi(V2BoardConfig.panelUrl);
    client.version ??= version;
    if (api == null) client.onSessionRejected = clear;
    try {
      await client.prepare();
      final website = client.panel;
      return restored == null ? website : await client.loginLink(website);
    } finally {
      if (api == null) client.close();
    }
  }

  Future<void> save(V2BoardApi api) => _storage.write(
    key: _key,
    value: jsonEncode({
      'origin': api.panel.origin,
      'serviceIdentity': ServiceEntrypoints.identity,
      'accessToken': api.accessToken,
    }),
  );

  Future<void> clear() => _storage.delete(key: _key);
}
