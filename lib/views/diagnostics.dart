import 'package:fastai/common/common.dart';
import 'package:fastai/v2board/diagnostics.dart';
import 'package:fastai/v2board/config.dart';
import 'package:fastai/state.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:fastai/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class DiagnosticsView extends ConsumerWidget {
  const DiagnosticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.appLocalizations;
    final requests = ref.watch(clientDiagnosticsProvider);
    return CommonScaffold(
      title: l.logsAndDiagnostics,
      body: ListView(
        padding: const EdgeInsets.all(
          16,
        ).copyWith(top: context.contentTopPadding),
        children: [
          if (V2BoardConfig.enabled)
            ListTile(
              title: Text(l.fdDiagnosticReport),
              subtitle: Text(l.fdDiagnosticReportHint),
              trailing: TextButton(
                onPressed: requests.isEmpty
                    ? null
                    : () async {
                        final report = [
                          'FastAI ${globalState.packageInfo.version} (${globalState.packageInfo.buildNumber})',
                          'Platform: ${defaultTargetPlatform.name}',
                          for (final event in requests)
                            '${event.timestamp.toUtc().toIso8601String()} ${event.summary} · ${event.code}${event.requestId.isEmpty ? '' : ' · ${event.requestId}'}',
                        ].join('\n');
                        await Clipboard.setData(ClipboardData(text: report));
                        if (context.mounted) {
                          context.showNotifier(l.fdDiagnosticsCopied);
                        }
                      },
                child: Text(l.fdCopyDiagnostics),
              ),
            ),
        ],
      ),
    );
  }
}
