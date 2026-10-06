import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'api.dart';
import 'config.dart';

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
      if (V2BoardConfig.panelUrl.isNotEmpty &&
          V2BoardConfig.origin(origin).origin !=
              V2BoardConfig.origin(V2BoardConfig.panelUrl).origin) {
        await clear();
        return null;
      }
      final token = data['accessToken'] as String;
      if (token.isEmpty) throw const FormatException();
      return V2BoardApi(origin)..accessToken = token;
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
      var value = V2BoardConfig.websiteUrl;
      if (value.isEmpty) {
        final settings = await client.object('GET', '/public/settings');
        value = settings['appUrl'] as String? ?? client.panel.origin;
      }
      final website = Uri.tryParse(value);
      if (website == null ||
          website.scheme != 'https' ||
          website.host.isEmpty ||
          website.userInfo.isNotEmpty) {
        throw const FormatException();
      }
      return restored == null ? website : await client.loginLink(website);
    } finally {
      if (api == null) client.close();
    }
  }

  Future<void> save(V2BoardApi api) => _storage.write(
    key: _key,
    value: jsonEncode({
      'origin': api.panel.origin,
      'accessToken': api.accessToken,
    }),
  );

  Future<void> clear() => _storage.delete(key: _key);
}
