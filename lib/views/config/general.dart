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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = context.appLocalizations;
    return Column(
      children: [
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
      ],
    );
  }
}
