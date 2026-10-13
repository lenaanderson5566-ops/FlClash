import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
import 'singbox.dart';
import 'config_cache.dart';
import 'node_metadata.dart';
import 'access.dart';
import 'config.dart';
import 'update.dart';
import 'package:fastai/common/common.dart';

class V2BoardProfile {
  V2BoardProfile(this.ref);

  final WidgetRef ref;
  ClientConfigCache? _cache;
  int _generation = 0;
  Future<void> _writes = Future.value();

  void invalidate() {
    _generation++;
    _cache = null;
  }

  bool _current(int generation) =>
      generation == _generation && ref.context.mounted;

  void _check(int generation) {
    if (!_current(generation)) throw const _SupersededProfile();
  }

  Future<void> _intent(Future<void> Function(int) action) async {
    final generation = ++_generation;
    try {
      await action(generation);
    } catch (_) {
      if (_current(generation)) rethrow;
    }
  }

  Future<void> _write(Future<void> Function() action) {
    final result = _writes.then((_) => action());
    _writes = result.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return result;
  }

  static const label = V2BoardConfig.managedProfileLabel;

  Future<String> _singboxFeatures() async {
    final features = await ref.read(coreHandlerProvider).singboxFeatures();
    return features.contains('naive') ? 'naive' : '';
  }

  Future<void> sync(V2BoardApi api, {bool apply = true}) =>
      _intent((generation) => _sync(api, generation, apply: apply));

  Future<void> _sync(
    V2BoardApi api,
    int generation, {
    bool apply = true,
  }) async {
    _check(generation);
    _cache = null;
    final features = await _singboxFeatures();
    _check(generation);
    var bytes = await api.clientConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
      architecture: fastaiArchitecture,
      core: 'sing-box',
    );
    _check(generation);
    String responseText;
    try {
      responseText = utf8.decode(bytes);
    } on FormatException {
      throw const V2BoardProblem('invalid_config');
    }
    Map<String, Map<String, dynamic>> metadata = {};
    Map<String, dynamic>? nativeConfig;
    final unsupported = <String>{};
    if (responseText.trimLeft().startsWith('{')) {
      try {
        final payload =
            (jsonDecode(responseText) as Map<String, dynamic>)['data']
                as Map<String, dynamic>;
        if (payload['configVersion'] is! String) {
          throw const FormatException();
        }
        if (payload['core'] == 'sing-box') {
          final compatible = compatibleSingboxProfile(
            Map<String, dynamic>.from(payload['configuration'] as Map),
            features: features.split(','),
          );
          nativeConfig = compatible.profile;
          unsupported.addAll(compatible.removed);
        } else {
          throw const FormatException();
        }
        metadata = decodeNodeMetadata(payload['nodes']);
        metadata.removeWhere((name, _) => unsupported.contains(name));
      } on FormatException {
        throw const V2BoardProblem('invalid_response');
      } on TypeError {
        throw const V2BoardProblem('invalid_response');
      }
    }
    if (nativeConfig == null) throw const V2BoardProblem('invalid_config');
    final config = nativeConfig;
    if (config['proxies'] is! List ||
        config['proxy-groups'] is! List ||
        (config['proxies'] as List).any(
          (node) => node is! Map || node['name'] is! String,
        ) ||
        (config['proxy-groups'] as List).any(
          (group) =>
              group is! Map ||
              group['name'] is! String ||
              group['proxies'] is! List,
        )) {
      throw const V2BoardProblem('invalid_config');
    }
    final nodeNames = (config['proxies'] as List? ?? const [])
        .whereType<Map>()
        .map((node) => node['name'])
        .toSet();
    if (metadata.keys.any((name) => !nodeNames.contains(name))) {
      throw const V2BoardProblem('invalid_response');
    }
    final managedGroups = config['proxy-groups'] as List? ?? const [];
    final primary = managedGroups
        .where(
          (g) =>
              g is Map &&
              g['type'] == 'select' &&
              g['name'] != 'GLOBAL' &&
              g['hidden'] != true,
        )
        .firstOrNull;
    final removed = unsupported;
    bytes = Uint8List.fromList(utf8.encode(jsonEncode(config)));
    final hash = sha256.convert(bytes).toString();
    _check(generation);
    await _write(() async {
      _check(generation);
      final previous = ref
          .read(profilesProvider)
          .where(
            (profile) =>
                profile.label == label || profile.label == 'fastai · managed',
          )
          .firstOrNull;
      final choices = primary == null
          ? <String>[]
          : (primary['proxies'] as List? ?? const [])
                .whereType<String>()
                .where(
                  (name) => !const {
                    'DIRECT',
                    'REJECT',
                    'REJECT-DROP',
                    'PASS',
                  }.contains(name.toUpperCase()),
                )
                .toList();
      final oldChoice = primary == null
          ? null
          : previous?.selectedMap[primary['name']];
      final previousChoice = migrateNodeChoice(oldChoice, metadata, choices);
      final preservedSelections = <String, String>{};
      for (final group in managedGroups.whereType<Map>()) {
        final name = group['name'];
        if (name is! String || name == 'GLOBAL' || name == primary?['name']) {
          continue;
        }
        final migrated = migrateNodeChoice(
          previous?.selectedMap[name],
          metadata,
          (group['proxies'] as List? ?? const []).whereType<String>().where(
            (name) => !removed.contains(name),
          ),
        );
        if (migrated != null) preservedSelections[name] = migrated;
      }
      final profile = (previous ?? Profile.normal(label: label)).copyWith(
        label: label,
        autoUpdate: false,
        selectedMap: {
          if (primary != null) 'GLOBAL': primary['name'] as String,
          if (primary != null && choices.isNotEmpty)
            primary['name'] as String: choices.contains(previousChoice)
                ? previousChoice!
                : choices.first,
          ...preservedSelections,
        },
      );
      var published = false;
      try {
        Profile updated;
        try {
          updated = await profile.saveFile(
            bytes,
            validate: (path) async {
              _check(generation);
              final message = await ref
                  .read(coreHandlerProvider)
                  .validateConfig(path);
              _check(generation);
              return message;
            },
          );
        } on MessageException {
          throw const V2BoardProblem('invalid_config');
        }
        _check(generation);
        final metadataPath = await nodeMetadataFile(updated.id);
        await metadataPath.writeAsString(
          jsonEncode({
            'yamlHash': hash,
            'nodes': metadata.values
                .where((node) => !removed.contains(node['proxyName']))
                .toList(),
          }),
          flush: true,
        );
        _check(generation);
        ref.invalidate(fastaiNodeMetadataProvider);
        ref.read(v2BoardAccessProvider.notifier)
          ..acceptVersion()
          ..setAvailable(true);
        ref.read(profilesActionProvider.notifier).putProfile(updated);
        published = true;
        ref.read(currentProfileIdProvider.notifier).value = updated.id;
        if (apply) {
          ref.read(setupActionProvider.notifier).applyProfileDebounce();
        }
        if (unsupported.isNotEmpty && ref.context.mounted) {
          ref.context.showNotifier(
            ref.context.appLocalizations.fdUnsupportedNodesSkipped,
          );
        }
        _cache = ClientConfigCache(
          coreFeatures: features,
          client: api,
          profileId: updated.id,
          hash: hash,
          version: globalState.packageInfo.version,
          syncedAt: DateTime.now(),
          core: 'sing-box',
        );
      } finally {
        if (!published && previous == null) {
          await (await profile.file).safeDelete();
          await (await nodeMetadataFile(profile.id)).safeDelete();
        }
      }
    });
  }

  Future<void> clear() {
    invalidate();
    final stopped = ref.read(setupActionProvider.notifier).setRunning(false);
    return _write(() async {
      await stopped;
      if (!ref.context.mounted) return;
      final profiles = ref
          .read(profilesProvider)
          .where(
            (profile) =>
                profile.label == label || profile.label == 'fastai · managed',
          )
          .toList();
      for (final profile in profiles) {
        if (!ref.context.mounted) return;
        await ref
            .read(profilesActionProvider.notifier)
            .deleteProfile(profile.id);
        await (await nodeMetadataFile(profile.id)).safeDelete();
      }
    });
  }

  Future<bool> _reuseConfig(V2BoardApi api, int generation) async {
    final cache = _cache;
    final features = await _singboxFeatures();
    _check(generation);
    final profile = ref.read(currentProfileProvider);
    if (cache == null ||
        profile == null ||
        !cache.reusable(
          coreFeatures: features,
          client: api,
          profileId: profile.id,
          version: globalState.packageInfo.version,
          now: DateTime.now(),
          core: 'sing-box',
        )) {
      return false;
    }
    try {
      final file = await profile.file;
      if (!await file.exists() ||
          (await sha256.bind(file.openRead()).first).toString() != cache.hash) {
        return false;
      }
    } on FileSystemException {
      return false;
    }
    _check(generation);
    await api.validateCachedConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
      architecture: fastaiArchitecture,
      core: 'sing-box',
    );
    _check(generation);
    return ref.context.mounted &&
        ref.read(currentProfileProvider)?.id == cache.profileId;
  }

  Future<void> connect(V2BoardApi api, {void Function()? onConnecting}) =>
      _intent((generation) async {
        _check(generation);
        if (!await _reuseConfig(api, generation)) await _sync(api, generation);
        _check(generation);
        onConnecting?.call();
        _check(generation);
        final result = await ref
            .read(setupActionProvider.notifier)
            .setRunning(true, initialize: !ref.read(initProvider));
        _check(generation);
        if (!result) throw const V2BoardProblem('connection_failed');
      });
}

class _SupersededProfile implements Exception {
  const _SupersededProfile();
}
