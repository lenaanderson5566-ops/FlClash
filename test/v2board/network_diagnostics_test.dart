import 'dart:async';
import 'package:fastai/v2board/network_diagnostics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:fastai/l10n/l10n.dart';
import '../helpers/test_app.dart';

class _Probe extends NetworkProbe {
  bool failDns = false;
  @override
  Future<Map<String, String>> tcp() async => {'protocol': 'TCP'};
  @override
  Future<Map<String, String>> tls() async => {'certificateVerified': 'true'};
  @override
  Future<Map<String, String>> reference() async => {
    'target': 'https://example.test',
    'HTTP': '204',
  };
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
  const brokenRoute = [
    NetworkCheckResult(
      NetworkCheck.settings,
      NetworkCheckStatus.passed,
      parameters: {
        'safeMode': 'false',
        'connected': 'true',
        'coreReady': 'true',
        'routeGroupLoaded': 'true',
        'TUN': 'false',
      },
    ),
    NetworkCheckResult(NetworkCheck.route, NetworkCheckStatus.failed),
  ];
  test(
    'repair only selects actionable failures and never runs in safe mode',
    () {
      expect(diagnosticRepairFor(brokenRoute), DiagnosticRepair.switchRoute);
      expect(
        diagnosticRepairFor([
          const NetworkCheckResult(
            NetworkCheck.settings,
            NetworkCheckStatus.skipped,
            parameters: {'safeMode': 'true'},
          ),
        ]),
        isNull,
      );
      expect(diagnosticConnectionRestored(brokenRoute), isFalse);
      expect(
        diagnosticConnectionRestored([
          const NetworkCheckResult(
            NetworkCheck.route,
            NetworkCheckStatus.unverified,
          ),
        ]),
        isFalse,
      );
    },
  );
  testWidgets('repair executes once and verifies before reporting recovery', (
    tester,
  ) async {
    var checks = 0;
    var repairs = 0;
    final pending = Completer<void>();
    await tester.pumpWidget(
      TestApp(
        child: NetworkDiagnosticsDialog(
          runChecks: () async => ++checks == 1
              ? brokenRoute
              : [
                  brokenRoute.first,
                  const NetworkCheckResult(
                    NetworkCheck.route,
                    NetworkCheckStatus.passed,
                  ),
                ],
          onRepair: (repair) async {
            repairs++;
            expect(repair, DiagnosticRepair.switchRoute);
            await pending.future;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Find and switch to a working route'));
    await tester.pump();
    expect(repairs, 1);
    expect(checks, 1);
    expect(
      find.text('Applying the fix and checking the connection…'),
      findsOneWidget,
    );
    pending.complete();
    await tester.pumpAndSettle();
    expect(checks, 2);
    expect(
      find.text(
        'The proxy route passed verification. Review any remaining warnings below.',
      ),
      findsOneWidget,
    );
    expect(find.text('Find and switch to a working route'), findsNothing);
  });
  testWidgets('failed repair still rechecks and never claims recovery', (
    tester,
  ) async {
    var checks = 0;
    await tester.pumpWidget(
      TestApp(
        child: NetworkDiagnosticsDialog(
          runChecks: () async {
            checks++;
            return brokenRoute;
          },
          onRepair: (_) async => throw StateError('private data'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Find and switch to a working route'));
    await tester.pumpAndSettle();
    expect(checks, 2);
    expect(
      find.textContaining('The action could not be completed.'),
      findsOneWidget,
    );
    expect(find.textContaining('private data'), findsNothing);
    await tester.scrollUntilVisible(
      find.text('Find and switch to a working route'),
      150,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Find and switch to a working route'), findsOneWidget);
  });

  test('path comparison requires matching targets and conclusive checks', () {
    String compare(
      NetworkCheckStatus a,
      NetworkCheckStatus b, {
      String target = 'https://example.test',
    }) => diagnosticPathComparison([
      NetworkCheckResult(
        NetworkCheck.reference,
        a,
        parameters: const {'target': 'https://example.test'},
      ),
      NetworkCheckResult(NetworkCheck.route, b, parameters: {'target': target}),
    ]);
    const passed = NetworkCheckStatus.passed;
    const failed = NetworkCheckStatus.failed;
    expect(compare(passed, passed), 'both_passed');
    expect(compare(passed, failed), 'route_failed');
    expect(compare(failed, passed), 'system_failed');
    expect(compare(failed, failed), 'both_failed');
    expect(
      compare(passed, passed, target: 'https://other.test'),
      'not_comparable',
    );
    expect(compare(NetworkCheckStatus.skipped, passed), 'not_comparable');
    expect(compare(passed, NetworkCheckStatus.unverified), 'not_comparable');
    expect(diagnosticPathComparison([]), 'not_comparable');
  });
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
      NetworkCheckStatus.passed,
      NetworkCheckStatus.passed,
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
      expect(find.text('HTTP'), findsOneWidget);
      expect(find.text('503'), findsOneWidget);
      expect(find.text('Internet connectivity'), findsOneWidget);
      expect(find.text('Network connectivity'), findsOneWidget);
      expect(find.text('Not verified 1'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
  test('assistant snapshot is versioned, language-neutral and immutable', () {
    final evidence = {'HTTP': '503'};
    final report = DiagnosticSnapshot(
      startedAt: DateTime.utc(2026),
      finishedAt: DateTime.utc(2026, 1, 1, 0, 0, 2),
      results: [
        NetworkCheckResult(
          NetworkCheck.website,
          NetworkCheckStatus.failed,
          detail: 'localized narrative',
          parameters: evidence,
        ),
      ],
    );
    evidence['HTTP'] = '200';
    final json = report.toJson();
    expect(json['schemaVersion'], 1);
    expect(json['automaticRepair'], isFalse);
    expect(json.toString(), isNot(contains('localized narrative')));
    expect(json.toString(), contains('503'));
    expect(json.toString(), contains('check_clock'));
    expect(json.toString(), contains('not_a_dns_leak_test'));
    expect(() => report.results.clear(), throwsUnsupportedError);
    expect(
      diagnosticActionCodes(
        const NetworkCheckResult(NetworkCheck.dns, NetworkCheckStatus.passed),
      ),
      isEmpty,
    );
  });
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
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pumpAndSettle();
    expect(
      find.text('Public test domains resolved successfully.'),
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
  for (final locale in AppLocalizations.delegate.supportedLocales) {
    testWidgets('expanded report fits a narrow window in $locale', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(380, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        TestApp(
          locale: locale,
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
      expect(
        find.text(AppLocalizations.current.fdDiagnosticRetry),
        findsOneWidget,
      );
      expect(
        Directionality.of(
          tester.element(find.byType(NetworkDiagnosticsDialog)),
        ),
        locale.languageCode == 'fa' ? TextDirection.rtl : TextDirection.ltr,
      );
      await tester.drag(find.byType(Scrollable).first, const Offset(0, -400));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
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
