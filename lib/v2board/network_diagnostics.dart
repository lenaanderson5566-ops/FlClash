import 'dart:async';
import 'dart:io';

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:fastai/l10n/l10n.dart';

import 'config.dart';

enum NetworkCheck { dns, website, proxy, settings, systemProxy, route }

enum NetworkCheckStatus { passed, failed, skipped, unverified }

class NetworkCheckResult {
  const NetworkCheckResult(
    this.check,
    this.status, {
    this.detail,
    this.parameters = const {},
  });
  final Map<String, String> parameters;
  final String? detail;
  final NetworkCheck check;
  final NetworkCheckStatus status;
}

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
  if (result.status == NetworkCheckStatus.unverified)
    return l.fdDiagnosticUnverified;
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
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.appLocalizations;
    return AlertDialog(
      title: Text(l.fdNetworkDiagnostics),
      content: SizedBox(
        width: 640,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.fdDiagnosticScope, style: context.textTheme.bodySmall),
              const SizedBox(height: 16),
              if (_busy) ...[
                const LinearProgressIndicator(),
                const SizedBox(height: 12),
                Text(l.fdDiagnosticRunning),
              ],
              if (!_busy && _results.isNotEmpty) ...[
                Text(
                  '${l.fdReportTime}: ${_at.toLocal().toString().split('.').first}',
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    for (final status in NetworkCheckStatus.values)
                      Text(
                        '${diagnosticStatus(l, status)} ${_results.where((r) => r.status == status).length}',
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(l.fdReportPrivacy, style: context.textTheme.bodySmall),
              ],
              for (final result in _results)
                ExpansionTile(
                  key: ValueKey('${_at.toIso8601String()}:${result.check}'),
                  initiallyExpanded: result.status == NetworkCheckStatus.failed,
                  tilePadding: EdgeInsets.zero,
                  leading: GlyphIcon(
                    result.status == NetworkCheckStatus.passed
                        ? AppGlyphs.check
                        : AppGlyphs.info,
                    color: result.status == NetworkCheckStatus.failed
                        ? context.colorScheme.error
                        : null,
                  ),
                  title: Text(
                    '${diagnosticTitle(l, result.check)} · ${diagnosticStatus(l, result.status)}',
                  ),
                  subtitle: Text(diagnosticDetail(l, result)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l.fdReportCriteria,
                            style: context.textTheme.titleSmall,
                          ),
                          Text(diagnosticCriteria(l, result.check)),
                          const SizedBox(height: 12),
                          Text(
                            l.fdReportParameters,
                            style: context.textTheme.titleSmall,
                          ),
                          SelectableText(
                            result.parameters.isEmpty
                                ? l.fdReportNoData
                                : result.parameters.entries
                                      .map((e) => '${e.key}: ${e.value}')
                                      .join('\n'),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l.fdReportRepair,
                            style: context.textTheme.titleSmall,
                          ),
                          SelectableText(diagnosticGuidance(l, result)),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy || _results.isEmpty
              ? null
              : () async {
                  try {
                    await Clipboard.setData(
                      ClipboardData(text: diagnosticReport(l, _results, _at)),
                    );
                    if (context.mounted) context.showNotifier(l.copySuccess);
                  } catch (_) {
                    if (context.mounted) {
                      context.showNotifier(l.fdRequestFailed);
                    }
                  }
                },
          child: Text(l.fdReportCopy),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.close),
        ),
        FilledButton(
          onPressed: _busy ? null : _run,
          child: Text(l.fdDiagnosticRetry),
        ),
      ],
    );
  }
}
