import 'dart:async';
import 'package:fastai/v2board/network_diagnostics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import '../helpers/test_app.dart';

class _Probe extends NetworkProbe {
  bool failDns = false;
  int proxyCalls = 0;
  @override
  Future<void> dns() async {
    if (failDns) throw StateError('DNS failed');
  }

  @override
  Future<void> website() async {}
  @override
  Future<void> proxy(int port) async {
    proxyCalls++;
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
