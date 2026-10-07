import 'dart:io';
import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:win32_registry/win32_registry.dart';
import 'package:fastai/l10n/l10n.dart';
import 'network_diagnostics.dart';
import 'network_policy.dart';
import 'routes.dart';

bool systemProxyMatches(String server, int port) {
  bool matches(String value) => {
    '127.0.0.1:$port',
    'localhost:$port',
    '[::1]:$port',
  }.contains(value.trim().toLowerCase());
  if (!server.contains('=')) return matches(server);
  final entries = <String, String>{};
  for (final part in server.split(';')) {
    final pair = part.split('=');
    if (pair.length == 2) entries[pair.first.trim().toLowerCase()] = pair.last;
  }
  return matches(entries['http'] ?? '') && matches(entries['https'] ?? '');
}

Future<List<NetworkCheckResult>> diagnoseConnection(
  WidgetRef ref,
  AppLocalizations l,
) async {
  final safe = ref.read(safeModeProvider);
  final running = ref.read(isStartProvider);
  final ready = ref.read(coreStatusProvider) == CoreStatus.connected;
  final patch = managedPatchConfig(ref.read(patchClashConfigProvider));
  final group = primaryRouteGroup(ref.read(groupsProvider));
  final profileId = ref.read(currentProfileProvider)?.id;
  final selected = group == null
      ? null
      : ref.read(selectedProxyNameProvider(group.name));
  final core = ref.read(coreHandlerProvider);
  final desktop = system.isDesktop;
  final usable = !safe && running && ready;
  final tunDenied =
      desktop &&
      patch.tun.enable &&
      ref.read(authorizedTunEnableProvider) != TunAuthorizationState.authorized;
  final results = <NetworkCheckResult>[
    NetworkCheckResult(
      NetworkCheck.settings,
      safe || !running
          ? NetworkCheckStatus.skipped
          : tunDenied || !ready || group == null
          ? NetworkCheckStatus.failed
          : NetworkCheckStatus.passed,
      detail: safe
          ? l.fdDiagnosticSafe
          : !running
          ? l.fdDiagnosticDisconnected
          : tunDenied
          ? l.fdDiagnosticTunDenied
          : !ready || group == null
          ? l.fdDiagnosticCoreFail
          : l.fdDiagnosticSettingsOk,
    ),
  ];
  Future<NetworkCheckResult> route() async {
    if (!usable || group == null) {
      return NetworkCheckResult(
        NetworkCheck.route,
        NetworkCheckStatus.skipped,
        detail: safe ? l.fdDiagnosticSafe : l.fdDiagnosticDisconnected,
      );
    }
    try {
      final result = await core
          .probe(
            ProbeParams(
              url: defaultTestUrl,
              proxyName: group.name,
              timeout: 8000,
            ),
          )
          .timeout(NetworkProbe.timeout);
      final ok =
          result != null &&
          (result.error == null || result.error!.isEmpty) &&
          result.statusCode >= 200 &&
          result.statusCode < 400;
      return NetworkCheckResult(
        NetworkCheck.route,
        ok ? NetworkCheckStatus.passed : NetworkCheckStatus.failed,
        detail: ok ? l.fdDiagnosticRouteOk : l.fdDiagnosticRouteFail,
      );
    } catch (_) {
      return NetworkCheckResult(
        NetworkCheck.route,
        NetworkCheckStatus.failed,
        detail: l.fdDiagnosticRouteFail,
      );
    }
  }

  final batches = await Future.wait([
    runNetworkChecks(checkProxy: usable && desktop, port: patch.mixedPort),
    route().then((result) => [result]),
  ]);
  results.addAll(batches.expand((items) => items));
  if (Platform.isWindows && !safe) {
    try {
      final key = CURRENT_USER.open(
        r'Software\Microsoft\Windows\CurrentVersion\Internet Settings',
      );
      try {
        final enabled = key.getInt('ProxyEnable') == 1;
        final server = key.getString('ProxyServer') ?? '';
        final pac = (key.getString('AutoConfigURL') ?? '').isNotEmpty;
        final expected = usable && !patch.tun.enable;
        final mismatch =
            pac ||
            (expected
                ? !enabled || !systemProxyMatches(server, patch.mixedPort)
                : enabled);
        results.add(
          NetworkCheckResult(
            NetworkCheck.systemProxy,
            mismatch ? NetworkCheckStatus.failed : NetworkCheckStatus.passed,
            detail: mismatch
                ? l.fdDiagnosticProxyConflict
                : l.fdDiagnosticProxySettingsOk,
          ),
        );
      } finally {
        key.close();
      }
    } catch (_) {
      results.add(
        NetworkCheckResult(
          NetworkCheck.systemProxy,
          NetworkCheckStatus.skipped,
          detail: l.fdDiagnosticUnverified,
        ),
      );
    }
  } else {
    results.add(
      NetworkCheckResult(
        NetworkCheck.systemProxy,
        NetworkCheckStatus.skipped,
        detail: safe ? l.fdDiagnosticSafe : l.fdDiagnosticUnverified,
      ),
    );
  }
  if (!ref.context.mounted) return results;
  if ((group != null &&
          selected != ref.read(selectedProxyNameProvider(group.name))) ||
      running != ref.read(isStartProvider) ||
      profileId != ref.read(currentProfileProvider)?.id ||
      patch.tun.enable != ref.read(patchClashConfigProvider).tun.enable) {
    return [
      NetworkCheckResult(
        NetworkCheck.settings,
        NetworkCheckStatus.skipped,
        detail: l.fdDiagnosticChanged,
      ),
    ];
  }
  return results;
}
