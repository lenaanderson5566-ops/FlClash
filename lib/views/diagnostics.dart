import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'dashboard/widgets/service_status.dart';

class LogLevelItem extends ConsumerWidget {
  const LogLevelItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ConfigOptionsItem<LogLevel>(
      title: (l) => l.logLevel,
      options: LogLevel.values,
      textBuilder: (logLevel) => logLevel.name,
      selector: patchClashConfigProvider.select((state) => state.logLevel),
      onChanged: (ref, value) => ref
          .read(patchClashConfigProvider.notifier)
          .update((state) => state.copyWith(logLevel: value)),
    );
  }
}

class DiagnosticsView extends ConsumerWidget {
  const DiagnosticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.appLocalizations;
    return CommonScaffold(
      title: l.logsAndDiagnostics,
      body: ListView(
        padding: const EdgeInsets.all(
          16,
        ).copyWith(top: context.contentTopPadding),
        children: [
          ListItem(
            title: Text(l.serviceStatus),
            subtitle: Text(l.networkDetection),
            onTap: () => showServiceStatusSheet(context),
          ),
          const LogLevelItem(),
          ConfigToggleItem(
            title: (l) => l.logcat,
            subtitle: (l) => l.logcatDesc,
            selector: appSettingProvider.select((state) => state.openLogs),
            onChanged: (ref, enabled) => ref
                .read(appSettingProvider.notifier)
                .update((state) => state.copyWith(openLogs: enabled)),
          ),
        ],
      ),
    );
  }
}
