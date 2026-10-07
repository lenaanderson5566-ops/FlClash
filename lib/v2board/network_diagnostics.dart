import 'dart:async';
import 'dart:io';

import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:material_ui/material_ui.dart';

import 'config.dart';

enum NetworkCheck { dns, website, proxy, settings, systemProxy, route }

enum NetworkCheckStatus { passed, failed, skipped }

class NetworkCheckResult {
  const NetworkCheckResult(this.check, this.status, {this.detail});
  final String? detail;
  final NetworkCheck check;
  final NetworkCheckStatus status;
}

class NetworkProbe {
  const NetworkProbe();
  static const timeout = Duration(seconds: 8);

  Future<void> dns() async {
    await Future.wait([
      for (final host in {
        V2BoardConfig.origin(V2BoardConfig.websiteUrl).host,
        Uri.parse(defaultTestUrl).host,
      })
        InternetAddress.lookup(host).timeout(timeout).then((addresses) {
          if (addresses.isEmpty) throw const SocketException('No DNS result');
        }),
    ]);
  }

  Future<void> website() async {
    final client = HttpClient()..connectionTimeout = timeout;
    try {
      await (() async {
        final request = await client.getUrl(
          V2BoardConfig.origin(V2BoardConfig.websiteUrl),
        );
        request.followRedirects = false;
        final response = await request.close();
        if (response.statusCode < 200 || response.statusCode >= 400) {
          throw const HttpException('Website unavailable');
        }
      })().timeout(timeout);
    } finally {
      client.close(force: true);
    }
  }

  Future<void> proxy(int port) async {
    final socket = await Socket.connect('127.0.0.1', port, timeout: timeout);
    socket.destroy();
  }
}

Future<List<NetworkCheckResult>> runNetworkChecks({
  required bool checkProxy,
  required int port,
  NetworkProbe probe = const NetworkProbe(),
}) async {
  Future<NetworkCheckResult> check(
    NetworkCheck kind,
    Future<void> Function() action,
  ) async {
    try {
      await action().timeout(NetworkProbe.timeout);
      return NetworkCheckResult(kind, NetworkCheckStatus.passed);
    } catch (_) {
      return NetworkCheckResult(kind, NetworkCheckStatus.failed);
    }
  }

  return Future.wait([
    check(NetworkCheck.dns, probe.dns),
    check(NetworkCheck.website, probe.website),
    if (checkProxy)
      check(NetworkCheck.proxy, () => probe.proxy(port))
    else
      Future.value(
        const NetworkCheckResult(
          NetworkCheck.proxy,
          NetworkCheckStatus.skipped,
        ),
      ),
  ]);
}

class NetworkDiagnosticsDialog extends StatefulWidget {
  const NetworkDiagnosticsDialog({super.key, required this.runChecks});
  final Future<List<NetworkCheckResult>> Function() runChecks;

  @override
  State<NetworkDiagnosticsDialog> createState() =>
      _NetworkDiagnosticsDialogState();
}

class _NetworkDiagnosticsDialogState extends State<NetworkDiagnosticsDialog> {
  bool _busy = false;
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
              NetworkCheckResult(check, NetworkCheckStatus.failed),
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
        width: 440,
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
              for (final result in _results)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: GlyphIcon(
                    result.status == NetworkCheckStatus.passed
                        ? AppGlyphs.check
                        : AppGlyphs.info,
                  ),
                  title: Text(switch (result.check) {
                    NetworkCheck.dns => l.fdDiagnosticDns,
                    NetworkCheck.website => l.fdOfficialWebsite,
                    NetworkCheck.proxy => l.fdLocalProxy,
                    NetworkCheck.settings => l.settings,
                    NetworkCheck.systemProxy => l.systemProxy,
                    NetworkCheck.route => l.fdDiagnosticRoute,
                  }),
                  subtitle: Text(
                    result.detail ??
                        (result.status == NetworkCheckStatus.skipped
                            ? l.fdDiagnosticSkipped
                            : switch ((result.check, result.status)) {
                                (NetworkCheck.dns, NetworkCheckStatus.passed) =>
                                  l.fdDiagnosticDnsOk,
                                (
                                  NetworkCheck.website,
                                  NetworkCheckStatus.passed,
                                ) =>
                                  l.fdDiagnosticWebsiteOk,
                                (
                                  NetworkCheck.proxy,
                                  NetworkCheckStatus.passed,
                                ) =>
                                  l.fdDiagnosticProxyOk,
                                (NetworkCheck.dns, _) => l.fdDiagnosticDnsFail,
                                (NetworkCheck.website, _) =>
                                  l.fdDiagnosticWebsiteFail,
                                (NetworkCheck.proxy, _) =>
                                  l.fdDiagnosticProxyFail,
                                _ => l.fdDiagnosticUnverified,
                              }),
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
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
