import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:fastai/l10n/l10n.dart';

import 'config.dart';
import 'diagnostic_result.dart';
export 'diagnostic_result.dart';

class DiagnosticProbeFailure implements Exception {
  const DiagnosticProbeFailure(this.code, this.parameters);
  final String code;
  final Map<String, String> parameters;
}

String diagnosticErrorCode(Object error) => switch (error) {
  DiagnosticProbeFailure() => error.code,
  TimeoutException() => 'timeout',
  HandshakeException() => 'tls_failed',
  SocketException() => 'socket_failed',
  _ => 'check_failed',
};

class NetworkProbe {
  const NetworkProbe();
  static const timeout = Duration(seconds: 8);

  Future<Map<String, String>> dns() async {
    final hosts = {
      V2BoardConfig.origin(V2BoardConfig.websiteUrl).host,
      Uri.parse(defaultTestUrl).host,
    };
    final values = await Future.wait([
      for (final host in hosts)
        (() async {
          try {
            final addresses = await InternetAddress.lookup(
              host,
            ).timeout(timeout);
            if (addresses.isEmpty) return (host, 'no_answer', false);
            return (host, addresses.map((a) => a.address).join(', '), true);
          } catch (error) {
            return (host, diagnosticErrorCode(error), false);
          }
        })(),
    ]);
    final parameters = {
      for (final value in values) 'DNS ${value.$1}': value.$2,
    };
    if (values.any((value) => !value.$3)) {
      throw DiagnosticProbeFailure('dns_failed', parameters);
    }
    return parameters;
  }

  Future<Map<String, String>> website() async {
    final client = HttpClient()..connectionTimeout = timeout;
    client.findProxy = (_) => 'DIRECT';
    final parameters = {
      'target': V2BoardConfig.origin(V2BoardConfig.websiteUrl).toString(),
      'redirects': 'false',
      'tlsValidation': 'true',
    };
    try {
      return await (() async {
        final request = await client.getUrl(
          V2BoardConfig.origin(V2BoardConfig.websiteUrl),
        );
        request.followRedirects = false;
        final response = await request.close();
        parameters['HTTP'] = '${response.statusCode}';
        if (response.statusCode < 200 || response.statusCode >= 400) {
          throw DiagnosticProbeFailure('http_status', parameters);
        }
        return parameters;
      })().timeout(timeout);
    } catch (error) {
      throw DiagnosticProbeFailure(diagnosticErrorCode(error), parameters);
    } finally {
      client.close(force: true);
    }
  }

  Future<Map<String, String>> proxy(int port) async {
    final socket = await Socket.connect('127.0.0.1', port, timeout: timeout);
    socket.destroy();
    return {'endpoint': '127.0.0.1:$port', 'protocol': 'TCP'};
  }
}

Future<List<NetworkCheckResult>> runNetworkChecks({
  required bool checkProxy,
  required int port,
  NetworkProbe probe = const NetworkProbe(),
}) async {
  Future<NetworkCheckResult> check(
    NetworkCheck kind,
    Future<Map<String, String>> Function() action,
    Map<String, String> input,
  ) async {
    final watch = Stopwatch()..start();
    try {
      final output = await action().timeout(NetworkProbe.timeout);
      return NetworkCheckResult(
        kind,
        NetworkCheckStatus.passed,
        parameters: {
          ...input,
          ...output,
          'elapsedMs': '${watch.elapsedMilliseconds}',
          'timeoutMs': '8000',
        },
      );
    } catch (error) {
      return NetworkCheckResult(
        kind,
        NetworkCheckStatus.failed,
        parameters: {
          ...input,
          if (error is DiagnosticProbeFailure) ...error.parameters,
          'elapsedMs': '${watch.elapsedMilliseconds}',
          'timeoutMs': '8000',
          'error': diagnosticErrorCode(error),
        },
      );
    }
  }

  return Future.wait([
    check(NetworkCheck.dns, probe.dns, const {}),
    check(NetworkCheck.website, probe.website, const {}),
    if (checkProxy)
      check(NetworkCheck.proxy, () => probe.proxy(port), {
        'endpoint': '127.0.0.1:$port',
        'protocol': 'TCP',
      })
    else
      Future.value(
        NetworkCheckResult(
          NetworkCheck.proxy,
          NetworkCheckStatus.skipped,
          parameters: {'endpoint': '127.0.0.1:$port'},
        ),
      ),
  ]);
}

String diagnosticTitle(AppLocalizations l, NetworkCheck check) =>
    switch (check) {
      NetworkCheck.dns => l.fdDiagnosticDns,
      NetworkCheck.website => l.fdOfficialWebsite,
      NetworkCheck.proxy => l.fdLocalProxy,
      NetworkCheck.settings => l.settings,
      NetworkCheck.systemProxy => l.systemProxy,
      NetworkCheck.route => l.fdDiagnosticRoute,
    };

String diagnosticStatus(AppLocalizations l, NetworkCheckStatus status) =>
    switch (status) {
      NetworkCheckStatus.passed => l.fdReportPassed,
      NetworkCheckStatus.failed => l.fdReportFailed,
      NetworkCheckStatus.skipped => l.fdReportSkipped,
      NetworkCheckStatus.unverified => l.fdReportUnverified,
    };

String diagnosticDetail(AppLocalizations l, NetworkCheckResult result) =>
    result.detail ??
    switch ((result.check, result.status)) {
      (_, NetworkCheckStatus.unverified) => l.fdDiagnosticUnverified,
      (_, NetworkCheckStatus.skipped) => l.fdDiagnosticSkipped,
      (NetworkCheck.dns, NetworkCheckStatus.passed) => l.fdDiagnosticDnsOk,
      (NetworkCheck.website, NetworkCheckStatus.passed) =>
        l.fdDiagnosticWebsiteOk,
      (NetworkCheck.proxy, NetworkCheckStatus.passed) => l.fdDiagnosticProxyOk,
      (NetworkCheck.dns, _) => l.fdDiagnosticDnsFail,
      (NetworkCheck.website, _) => l.fdDiagnosticWebsiteFail,
      (NetworkCheck.proxy, _) => l.fdDiagnosticProxyFail,
      _ => l.fdDiagnosticUnverified,
    };

String diagnosticCriteria(AppLocalizations l, NetworkCheck check) =>
    switch (check) {
      NetworkCheck.dns => l.fdReportDnsCriteria,
      NetworkCheck.website => l.fdReportWebCriteria,
      NetworkCheck.proxy => l.fdReportPortCriteria,
      NetworkCheck.settings => l.fdDiagnosticSettingsOk,
      NetworkCheck.systemProxy => l.fdReportProxyCriteria,
      NetworkCheck.route => l.fdReportRouteCriteria,
    };

String diagnosticGuidance(AppLocalizations l, NetworkCheckResult result) {
  if (result.detail == l.fdDiagnosticChanged) return l.fdDiagnosticChanged;
  if (result.status == NetworkCheckStatus.unverified) {
    return l.fdDiagnosticUnverified;
  }
  if (result.status == NetworkCheckStatus.passed) return l.fdReportNoRepair;
  if (result.status == NetworkCheckStatus.skipped) return l.fdReportRunAgain;
  return switch (result.check) {
    NetworkCheck.dns => l.fdReportDnsSteps,
    NetworkCheck.website => l.fdReportWebSteps,
    NetworkCheck.proxy => l.fdReportPortSteps,
    NetworkCheck.settings => l.fdReportSettingsSteps,
    NetworkCheck.systemProxy => l.fdReportProxySteps,
    NetworkCheck.route => l.fdReportRouteSteps,
  };
}

String diagnosticReport(
  AppLocalizations l,
  List<NetworkCheckResult> results,
  DateTime at,
) => [
  l.fdNetworkDiagnostics,
  '${l.fdReportTime}: ${at.toUtc().toIso8601String()}',
  l.fdReportPrivacy,
  for (final result in results) ...[
    '',
    '${diagnosticTitle(l, result.check)} — ${diagnosticStatus(l, result.status)}',
    diagnosticDetail(l, result),
    '${l.fdReportCriteria}: ${diagnosticCriteria(l, result.check)}',
    for (final entry in result.parameters.entries)
      '${entry.key}: ${entry.value}',
    '${l.fdReportRepair}: ${diagnosticGuidance(l, result)}',
  ],
].join('\n');

class NetworkDiagnosticsDialog extends StatefulWidget {
  const NetworkDiagnosticsDialog({super.key, required this.runChecks});
  final Future<List<NetworkCheckResult>> Function() runChecks;

  @override
  State<NetworkDiagnosticsDialog> createState() =>
      _NetworkDiagnosticsDialogState();
}

class _NetworkDiagnosticsDialogState extends State<NetworkDiagnosticsDialog> {
  bool _busy = false;
  DateTime _at = DateTime.now();
  List<NetworkCheckResult> _results = [];
  DiagnosticSnapshot? _snapshot;

  @override
  void initState() {
    super.initState();
    unawaited(_run());
  }

  Future<void> _run() async {
    if (_busy) return;
    setState(() {
      _busy = true;
      _at = DateTime.now();
      _results = [];
      _snapshot = null;
    });
    try {
      final results = await widget.runChecks();
      if (mounted) setState(() => _results = results);
    } catch (_) {
      if (mounted) {
        setState(
          () => _results = [
            for (final check in NetworkCheck.values)
              NetworkCheckResult(
                check,
                NetworkCheckStatus.unverified,
                parameters: const {'error': 'check_failed'},
              ),
          ],
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _snapshot = DiagnosticSnapshot(
            startedAt: _at,
            finishedAt: DateTime.now(),
            results: _results,
          );
        });
      }
    }
  }

  Future<void> _copy() async {
    final l = context.appLocalizations;
    try {
      await Clipboard.setData(
        ClipboardData(text: diagnosticReport(l, _snapshot!.results, _at)),
      );
      if (mounted) context.showNotifier(l.copySuccess);
    } catch (_) {
      if (mounted) context.showNotifier(l.fdRequestFailed);
    }
  }

  Widget _section(String title, String text, {bool selectable = false}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: context.textTheme.titleSmall),
            const SizedBox(height: 6),
            if (selectable)
              SelectableText(text, style: context.textTheme.bodySmall)
            else
              Text(text, style: context.textTheme.bodyMedium),
          ],
        ),
      );

  Widget _resultCard(NetworkCheckResult result) {
    final l = context.appLocalizations;
    final scheme = context.colorScheme;
    final failed = result.status == NetworkCheckStatus.failed;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: AppShape.lg.copyWith(
        side: BorderSide(
          color: failed
              ? scheme.error.withValues(alpha: 0.25)
              : scheme.outlineVariant,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        key: ValueKey('${_at.toIso8601String()}:${result.check}'),
        initiallyExpanded: failed,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: GlyphIcon(
          result.status == NetworkCheckStatus.passed
              ? AppGlyphs.check
              : AppGlyphs.info,
          color: failed ? scheme.error : scheme.primary,
        ),
        title: Text(
          '${diagnosticTitle(l, result.check)} · ${diagnosticStatus(l, result.status)}',
          style: context.textTheme.titleSmall,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            diagnosticDetail(l, result),
            style: context.textTheme.bodySmall,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _section(
                  l.fdReportRepair,
                  diagnosticGuidance(l, result),
                  selectable: true,
                ),
                const Divider(height: 24),
                _section(
                  l.fdReportCriteria,
                  diagnosticCriteria(l, result.check),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: ShapeDecoration(
                    color: scheme.surfaceContainerLow,
                    shape: AppShape.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l.fdReportParameters,
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        result.parameters.isEmpty
                            ? l.fdReportNoData
                            : result.parameters.entries
                                  .map((e) => '${e.key}: ${e.value}')
                                  .join('\n'),
                        style: context.textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    final scheme = context.colorScheme;
    final failed = _results
        .where((r) => r.status == NetworkCheckStatus.failed)
        .toList();
    final incomplete =
        _results.isEmpty ||
        _results.any(
          (r) =>
              r.status == NetworkCheckStatus.skipped ||
              r.status == NetworkCheckStatus.unverified,
        );
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: SizedBox(
        width: 800,
        height: math.min(720, MediaQuery.sizeOf(context).height - 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 16),
              child: Row(
                children: [
                  const GlyphIcon(AppGlyphs.proxies),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l.fdNetworkDiagnostics,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                    tooltip: l.close,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const GlyphIcon(AppGlyphs.close),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: ShapeDecoration(
                      color: scheme.primaryContainer.withValues(alpha: 0.45),
                      shape: AppShape.lg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _busy
                              ? l.fdDiagnosticRunning
                              : failed.isNotEmpty
                              ? l.fdHealthIssues
                              : incomplete
                              ? l.fdHealthIncomplete
                              : l.fdHealthPassed,
                          style: context.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.fdHealthScope,
                          style: context.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        if (_busy)
                          const LinearProgressIndicator()
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final status in NetworkCheckStatus.values)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 7,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: scheme.surface,
                                    shape: AppShape.sm,
                                  ),
                                  child: Text(
                                    '${diagnosticStatus(l, status)} ${_results.where((r) => r.status == status).length}',
                                    style: context.textTheme.labelMedium,
                                  ),
                                ),
                            ],
                          ),
                        if (!_busy) ...[
                          const SizedBox(height: 12),
                          Text(
                            '${l.fdReportTime}: ${_at.toLocal().toString().split('.').first}',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (failed.isNotEmpty) ...[
                    Text(
                      l.fdHealthPriority,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l.fdHealthPriorityHint,
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 12),
                    for (final result in failed) _resultCard(result),
                    const SizedBox(height: 12),
                  ],
                  if (!_busy) ...[
                    Text(
                      l.fdHealthDetails,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    for (final result in _results.where(
                      (r) => r.status != NetworkCheckStatus.failed,
                    ))
                      _resultCard(result),
                    const SizedBox(height: 8),
                    Text(
                      l.fdReportPrivacy,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 12,
                runSpacing: 8,
                children: [
                  OutlinedButton(
                    onPressed: _busy || _snapshot == null ? null : _copy,
                    child: Text(l.fdReportCopy),
                  ),
                  FilledButton(
                    onPressed: _busy ? null : _run,
                    child: Text(l.fdDiagnosticRetry),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
