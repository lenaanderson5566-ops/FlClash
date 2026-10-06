import 'package:fastai/common/common.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ConfigToggleItem _appSettingToggle({
  required ConfigLabel title,
  ConfigLabel? subtitle,
  bool enabled = true,
  required bool Function(AppSettingProps state) select,
  required AppSettingProps Function(AppSettingProps state, bool value) update,
}) {
  return ConfigToggleItem(
    title: title,
    subtitle: subtitle,
    enabled: enabled,
    selector: appSettingProvider.select(select),
    onChanged: (ref, value) => ref
        .read(appSettingProvider.notifier)
        .update((state) => update(state, value)),
  );
}

class GeneralSettings extends ConsumerWidget {
  const GeneralSettings({super.key, this.isDesktop, this.isAndroid});

  final bool? isDesktop;
  final bool? isAndroid;

  List<Widget> _startupItems(WidgetRef ref) {
    return [
      if (isDesktop ?? system.isDesktop) ...[
        _appSettingToggle(
          title: (l) => l.autoLaunch,
          subtitle: (l) => l.autoLaunchDesc,
          select: (state) => state.autoLaunch,
          update: (state, value) => state.copyWith(
            autoLaunch: value,
            silentLaunch: value && state.silentLaunch,
          ),
        ),
        _appSettingToggle(
          enabled: ref.watch(appSettingProvider.select((s) => s.autoLaunch)),
          title: (l) => l.silentLaunch,
          subtitle: (l) => l.silentLaunchDesc,
          select: (state) => state.silentLaunch,
          update: (state, value) => state.copyWith(silentLaunch: value),
        ),
      ],
      _appSettingToggle(
        title: (l) => l.autoRun,
        subtitle: (l) => l.autoRunDesc,
        select: (state) => state.autoRun,
        update: (state, value) => state.copyWith(autoRun: value),
      ),
      if (isDesktop ?? system.isDesktop)
        _appSettingToggle(
          title: (l) => l.minimizeOnExit,
          select: (state) => state.minimizeOnExit,
          update: (state, value) => state.copyWith(minimizeOnExit: value),
        ),
    ];
  }

  List<Widget> _requestItems() {
    return [
      _appSettingToggle(
        title: (l) => l.autoCheckUpdate,
        select: (state) => state.autoCheckUpdate,
        update: (state, value) => state.copyWith(autoCheckUpdate: value),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    return Column(
      children: [
        generateSectionV3(
          title: appLocalizations.startupAndBackground,
          items: _startupItems(ref),
        ),
        if (isAndroid ?? system.isAndroid)
          generateSectionV3(
            title: appLocalizations.fdBackgroundNotifications,
            items: [
              _appSettingToggle(
                title: (l) => l.exclude,
                subtitle: (l) => l.excludeDesc,
                select: (state) => state.hidden,
                update: (state, value) => state.copyWith(hidden: value),
              ),
              _appSettingToggle(
                title: (l) => l.showNotificationStopAction,
                select: (state) => state.showNotificationStopAction,
                update: (state, value) =>
                    state.copyWith(showNotificationStopAction: value),
              ),
            ],
          ),
        generateSectionV3(
          title: appLocalizations.requestsAndUpdates,
          items: _requestItems(),
        ),
      ],
    );
  }
}
