import 'dart:async';
import 'package:fastai/v2board/network_diagnostics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:fastai/l10n/l10n.dart';
import '../helpers/test_app.dart';

class _Probe extends NetworkProbe {
  bool failDns = false;
  int proxyCalls = 0;
  @override
  Future<Map<String, String>> dns() async {
    if (failDns) {
      throw const DiagnosticProbeFailure('dns_failed', {
        'DNS example.test': 'socket_failed',
      });
    }
    return {'DNS example.test': '192.0.2.1'};
  }

  @override
  Future<Map<String, String>> website() async => {'HTTP': '204'};
  @override
  Future<Map<String, String>> proxy(int port) async {
    proxyCalls++;
    return {};
  }
}

void main() {
  test('independent checks preserve success and skip inactive proxy', () async {
    final probe = _Probe()..failDns = true;
    final result = await runNetworkChecks(
      checkProxy: false,
      port: 7890,
      probe: probe,
    );
    expect(result.map((r) => r.status), [
      NetworkCheckStatus.failed,
      NetworkCheckStatus.passed,
      NetworkCheckStatus.skipped,
    ]);
    expect(probe.proxyCalls, 0);
  });
  test(
    'failure preserves evidence and excludes raw exception details',
    () async {
      final probe = _Probe()..failDns = true;
      final results = await runNetworkChecks(
        checkProxy: false,
        port: 7890,
        probe: probe,
      );
      expect(results.first.parameters['DNS example.test'], 'socket_failed');
      expect(results.first.parameters['error'], 'dns_failed');
      expect(results[1].parameters['HTTP'], '204');
      expect(results.first.parameters['timeoutMs'], '8000');
      expect(diagnosticErrorCode(StateError('token=secret')), 'check_failed');
      expect(
        diagnosticErrorCode(TimeoutException('private endpoint')),
        'timeout',
      );
    },
  );
  testWidgets(
    'report includes parameters, criteria, guidance and all statuses',
    (tester) async {
      await tester.pumpWidget(
        TestApp(
          child: NetworkDiagnosticsDialog(
            runChecks: () async => [
              const NetworkCheckResult(
                NetworkCheck.website,
                NetworkCheckStatus.failed,
                parameters: {'HTTP': '503', 'timeoutMs': '8000'},
              ),
              const NetworkCheckResult(
                NetworkCheck.systemProxy,
                NetworkCheckStatus.unverified,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(NetworkDiagnosticsDialog));
      final l = AppLocalizations.of(context);
      final report = diagnosticReport(l, [
        const NetworkCheckResult(
          NetworkCheck.website,
          NetworkCheckStatus.failed,
          parameters: {'HTTP': '503'},
        ),
      ], DateTime.utc(2026, 10, 7));
      expect(report, contains('HTTP: 503'));
      expect(report, contains('Assessment criteria'));
      expect(report, contains('What to do next'));
      expect(report, contains('2026-10-07T00:00:00.000Z'));
      expect(find.text('Copy report'), findsOneWidget);
      expect(find.textContaining('HTTP: 503'), findsOneWidget);
      expect(find.text('Not verified 1'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  test('connected desktop checks local proxy', () async {
    final probe = _Probe();
    final result = await runNetworkChecks(
      checkProxy: true,
      port: 7890,
      probe: probe,
    );
    expect(result.every((r) => r.status == NetworkCheckStatus.passed), isTrue);
    expect(probe.proxyCalls, 1);
  });
  testWidgets('diagnosis prevents repeated requests and supports retry', (
    tester,
  ) async {
    var pending = Completer<List<NetworkCheckResult>>();
    var calls = 0;
    await tester.pumpWidget(
      TestApp(
        child: NetworkDiagnosticsDialog(
          runChecks: () {
            calls++;
            return pending.future;
          },
        ),
      ),
    );
    expect(calls, 1);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    pending.complete([
      const NetworkCheckResult(NetworkCheck.dns, NetworkCheckStatus.passed),
    ]);
    await tester.pumpAndSettle();
    expect(
      find.text('Website and test domain resolved successfully.'),
      findsOneWidget,
    );
    pending = Completer<List<NetworkCheckResult>>();
    await tester.tap(find.text('Check again'));
    await tester.pump();
    expect(calls, 2);
    await tester.pumpWidget(const SizedBox.shrink());
    pending.complete([]);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
  testWidgets('expanded report fits a narrow window and remains scrollable', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(380, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      TestApp(
        child: NetworkDiagnosticsDialog(
          runChecks: () async => [
            for (final check in NetworkCheck.values)
              NetworkCheckResult(
                check,
                NetworkCheckStatus.failed,
                parameters: const {'timeoutMs': '8000'},
              ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Check again'), findsOneWidget);
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
  testWidgets('unexpected check failure restores retry control', (
    tester,
  ) async {
    await tester.pumpWidget(
      TestApp(
        child: NetworkDiagnosticsDialog(
          runChecks: () async => throw StateError('failed'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
