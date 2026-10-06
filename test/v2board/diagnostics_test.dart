import 'package:fastai/v2board/diagnostics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'diagnostics exclude unknown paths, query secrets and unsafe server text',
    () {
      final event = ClientRequestDiagnostic(
        method: 'GET',
        path: '/subscriptions/private-token?password=secret',
        code: 'Error with private-token',
        requestId: 'url?token=secret',
        status: 500,
        duration: Duration.zero,
      );
      expect(event.endpoint, '/other');
      expect(event.code, 'request_failed');
      expect(event.requestId, isEmpty);
      expect(event.summary, isNot(contains('secret')));
    },
  );
  test(
    'diagnostics keep only 30 recent control-plane requests and can be cleared',
    () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final diagnostics = container.read(clientDiagnosticsProvider.notifier);
      for (var i = 0; i < 35; i++) {
        diagnostics.record(
          ClientRequestDiagnostic(
            method: 'GET',
            path: '/me/client-config',
            code: 'ok',
            requestId: 'req-$i',
            status: 200,
            duration: const Duration(milliseconds: 10),
          ),
        );
      }
      final events = container.read(clientDiagnosticsProvider);
      expect(events.length, 30);
      expect(events.first.requestId, 'req-34');
      expect(events.last.requestId, 'req-5');
      diagnostics.clear();
      expect(container.read(clientDiagnosticsProvider), isEmpty);
    },
  );
}
