import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:yaml/yaml.dart' show loadYaml;
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
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
  static const label = V2BoardConfig.managedProfileLabel;

  Future<void> sync(V2BoardApi api) async {
    var bytes = await api.clientConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
      architecture: fastaiArchitecture,
    );
    final responseText = utf8.decode(bytes);
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
    final config = Map<String, dynamic>.from(
      json.decode(json.encode(loadYaml(yamlText))) as Map,
    );
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
    final updated = await profile.saveFile(
      bytes,
      validate: ref.read(coreHandlerProvider).validateConfig,
    );
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
  }

  Future<void> clear() async {
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

  Future<void> connect(V2BoardApi api) async {
    await sync(api);
    if (!ref.context.mounted) return;
    final result = await ref
        .read(setupActionProvider.notifier)
        .setRunning(true, initialize: !ref.read(initProvider));
    if (!result) throw const V2BoardProblem('connection_failed');
  }
}
