import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:yaml/yaml.dart' show loadYaml;
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
import 'access.dart';
import 'config.dart';
import 'update.dart';
import 'geo.dart';
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
    final config = Map<String, dynamic>.from(
      json.decode(json.encode(loadYaml(utf8.decode(bytes)))) as Map,
    );
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
    final profile = (previous ?? Profile.normal(label: label)).copyWith(
      label: label,
      autoUpdate: false,
    );
    final updated = await profile.saveFile(
      bytes,
      validate: ref.read(coreHandlerProvider).validateConfig,
    );
    if (!ref.context.mounted) return;
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
