import 'dart:async';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'diagnostics.dart';

class ClientTelemetry {
  static const _key = 'fastai.telemetry.enabled.v1';
  bool enabled = false;
  bool _sending = false;
  bool _disposed = false;
  int _generation = 0;
  V2BoardApi? _api;
  Timer? _timer;
  final List<Map<String, Object>> _events = [];

  Future<void> load() async {
    try {
      final value =
          (await SharedPreferences.getInstance()).getBool(_key) ?? false;
      if (!_disposed) enabled = value;
    } catch (_) {
      enabled = false;
    }
  }

  Future<void> setEnabled(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    if (!await preferences.setBool(_key, value)) {
      throw StateError('preference_write_failed');
    }
    if (_disposed) return;
    enabled = value;
    _generation++;
    _events.clear();
  }

  void bind(V2BoardApi? api) {
    if (identical(api, _api)) return;
    _generation++;
    _events.clear();
    _timer?.cancel();
    _api = api;
    if (api != null) {
      _timer = Timer.periodic(const Duration(minutes: 5), (_) {
        unawaited(_flush());
      });
    }
  }

  void request(ClientRequestDiagnostic event) {
    final name = switch (event.endpoint) {
      '/me/client-config' => 'config_sync',
      '/me/subscription' => 'subscription_sync',
      '/me' => 'account_sync',
      _ => null,
    };
    if (name == null) return;
    record(
      name,
      event.code == 'ok',
      event.duration.inMilliseconds,
      errorClass: event.code == 'ok'
          ? 'none'
          : switch (event.code) {
              'request_timeout' => 'timeout',
              'network_error' => 'network',
              'certificate_error' => 'certificate',
              _ => switch (event.status) {
                401 => 'authentication',
                403 || 422 => 'policy',
                final int status when status >= 500 => 'server',
                _ => 'unknown',
              },
            },
    );
  }

  void record(
    String name,
    bool success,
    int elapsedMs, {
    String errorClass = 'unknown',
  }) {
    if (!enabled || _api?.accessToken == null) return;
    if (_events.length >= 30) _events.removeAt(0);
    _events.add({
      'name': name,
      'outcome': success ? 'success' : 'failure',
      'elapsedMs': elapsedMs.clamp(0, 300000),
      'errorClass': success ? 'none' : errorClass,
    });
  }

  Future<void> _flush() async {
    final api = _api;
    if (!enabled || _sending || api?.accessToken == null || _events.isEmpty) {
      return;
    }
    final events = List<Map<String, Object>>.of(_events);
    final generation = _generation;
    _events.clear();
    _sending = true;
    try {
      await api!.request(
        'POST',
        '/me/client-events',
        body: {
          'clientVersion': api.version,
          'platform': Platform.operatingSystem,
          'events': events,
        },
      );
    } catch (_) {
      if (enabled && generation == _generation && identical(api, _api)) {
        _events.insertAll(0, events);
        if (_events.length > 30) _events.removeRange(0, _events.length - 30);
      }
    } finally {
      _sending = false;
    }
  }

  void dispose() {
    _disposed = true;
    enabled = false;
    bind(null);
  }
}
