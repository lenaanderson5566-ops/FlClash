import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:yaml/yaml.dart' show loadYaml, YamlException;
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
import 'config_cache.dart';
import 'node_metadata.dart';
import 'access.dart';
import 'config.dart';
import 'update.dart';
import 'geo.dart';
import 'subscription_policy.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/common/common.dart';

class V2BoardProfile {
  V2BoardProfile(this.ref);

  final WidgetRef ref;
  ClientConfigCache? _cache;
  static const label = V2BoardConfig.managedProfileLabel;

  Future<void> sync(V2BoardApi api) async {
    _cache = null;
    var bytes = await api.clientConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
      architecture: fastaiArchitecture,
    );
    String responseText;
    try {
      responseText = utf8.decode(bytes);
    } on FormatException {
      throw const V2BoardProblem('invalid_config');
    }
    Map<String, Map<String, dynamic>> metadata = {};
    var yamlText = responseText;
    if (responseText.trimLeft().startsWith('{')) {
      try {
        final payload =
            (jsonDecode(responseText) as Map<String, dynamic>)['data']
                as Map<String, dynamic>;
        if (payload['configVersion'] is! String || payload['yaml'] is! String) {
          throw const FormatException();
        }
        yamlText = payload['yaml'] as String;
        metadata = decodeNodeMetadata(payload['nodes']);
      } on FormatException {
        throw const V2BoardProblem('invalid_response');
      } on TypeError {
        throw const V2BoardProblem('invalid_response');
      }
    }
    Map<String, dynamic> config;
    try {
      config = Map<String, dynamic>.from(
        json.decode(json.encode(loadYaml(yamlText))) as Map,
      );
    } on YamlException {
      throw const V2BoardProblem('invalid_config');
    } on FormatException {
      throw const V2BoardProblem('invalid_config');
    } on TypeError {
      throw const V2BoardProblem('invalid_config');
    }
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
    final removed = removeSubscriptionMetadata(config);
    if (removed.isNotEmpty) {
      commonPrint.log(
        'Native configuration contained ${removed.length} subscription metadata nodes; removed.',
        logLevel: LogLevel.warning,
      );
    }
    enforceBundledRules(config);
    bytes = Uint8List.fromList(utf8.encode(await encodeYamlTask(config)));
    if (!ref.context.mounted) return;
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
    Profile updated;
    try {
      updated = await profile.saveFile(
        bytes,
        validate: ref.read(coreHandlerProvider).validateConfig,
      );
    } on MessageException {
      throw const V2BoardProblem('invalid_config');
    }
    final metadataPath = await nodeMetadataFile(updated.id);
    await metadataPath.writeAsString(
      jsonEncode({
        'yamlHash': sha256.convert(bytes).toString(),
        'nodes': metadata.values
            .where((node) => !removed.contains(node['proxyName']))
            .toList(),
      }),
      flush: true,
    );
    if (!ref.context.mounted) return;
    ref.invalidate(fastaiNodeMetadataProvider);
    ref.read(v2BoardAccessProvider.notifier)
      ..acceptVersion()
      ..setAvailable(true);
    ref.read(profilesActionProvider.notifier).putProfile(updated);
    ref.read(currentProfileIdProvider.notifier).value = updated.id;
    ref.read(setupActionProvider.notifier).applyProfileDebounce();
    _cache = ClientConfigCache(
      client: api,
      profileId: updated.id,
      hash: sha256.convert(bytes).toString(),
      version: globalState.packageInfo.version,
      syncedAt: DateTime.now(),
    );
  }

  Future<void> clear() async {
    _cache = null;
    await ref.read(setupActionProvider.notifier).setRunning(false);
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
      await ref.read(profilesActionProvider.notifier).deleteProfile(profile.id);
      final metadataPath = await nodeMetadataFile(profile.id);
      if (await metadataPath.exists()) await metadataPath.delete();
    }
  }

  Future<bool> _reuseConfig(V2BoardApi api) async {
    final cache = _cache;
    final profile = ref.read(currentProfileProvider);
    if (cache == null ||
        profile == null ||
        !cache.reusable(
          client: api,
          profileId: profile.id,
          version: globalState.packageInfo.version,
          now: DateTime.now(),
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
    await api.validateCachedConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
      architecture: fastaiArchitecture,
    );
    return ref.context.mounted &&
        ref.read(currentProfileProvider)?.id == cache.profileId;
  }

  Future<void> connect(V2BoardApi api, {void Function()? onConnecting}) async {
    if (!await _reuseConfig(api)) await sync(api);
    if (!ref.context.mounted) return;
    onConnecting?.call();
    final result = await ref
        .read(setupActionProvider.notifier)
        .setRunning(true, initialize: !ref.read(initProvider));
    if (!result) throw const V2BoardProblem('connection_failed');
  }
}
