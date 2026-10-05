import 'dart:io';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
import 'config.dart';

class V2BoardProfile {
  V2BoardProfile(this.ref);

  final WidgetRef ref;
  static const label = V2BoardConfig.managedProfileLabel;

  Future<void> sync(V2BoardApi api) async {
    final bytes = await api.clientConfig(
      version: globalState.packageInfo.version,
      platform: Platform.operatingSystem,
    );
    if (!ref.context.mounted) return;
    final previous = ref
        .read(profilesProvider)
        .where((profile) => profile.label == label)
        .firstOrNull;
    final profile = (previous ?? Profile.normal(label: label)).copyWith(
      autoUpdate: false,
    );
    final updated = await profile.saveFile(
      bytes,
      validate: ref.read(coreHandlerProvider).validateConfig,
    );
    if (!ref.context.mounted) return;
    ref.read(profilesActionProvider.notifier).putProfile(updated);
    ref.read(currentProfileIdProvider.notifier).value = updated.id;
    ref.read(setupActionProvider.notifier).applyProfileDebounce();
  }

  Future<void> clear() async {
    await ref.read(setupActionProvider.notifier).setRunning(false);
    if (!ref.context.mounted) return;
    final profiles = ref
        .read(profilesProvider)
        .where((profile) => profile.label == label)
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
