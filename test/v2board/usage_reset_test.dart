import 'dart:async';

import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/usage_reset.dart';
import 'package:flutter_test/flutter_test.dart';

class _Api extends V2BoardApi {
  _Api() : super('https://example.com');
  final bodies = <V10Object>[];
  Completer<V10Object>? pending;
  V2BoardProblem? error;
  String outcome = 'reset';

  @override
  Future<V10Object> object(
    String method,
    String path, {
    V10Object? body,
  }) async {
    expect(method, 'POST');
    expect(path, '/me/usage-resets/consumptions');
    bodies.add(body!);
    if (error != null) throw error!;
    if (pending != null) return pending!.future;
    return {'outcome': outcome};
  }
}

void main() {
  test(
    'reset eligibility is determined by the v10 permission and available count',
    () {
      expect(
        UsageResetSummary({'available': 2, 'canReset': true}).canReset,
        isTrue,
      );
      expect(
        UsageResetSummary({'available': 2, 'canReset': false}).canReset,
        isFalse,
      );
      expect(
        UsageResetSummary({'available': 0, 'canReset': true}).canReset,
        isFalse,
      );
      expect(
        UsageResetSummary({'available': -1, 'canReset': true}).available,
        0,
      );
      expect(UsageResetSummary({}).canReset, isFalse);
    },
  );
  test(
    'lost responses retry the same UUID and accept an already consumed result',
    () async {
      final api = _Api()..error = const V2BoardProblem('request_timeout');
      addTearDown(api.close);
      final operation = UsageResetOperation();
      await expectLater(operation.consume(api), throwsA(isA<V2BoardProblem>()));
      expect(operation.hasPendingRequest, isTrue);
      final key = api.bodies.single['requestKey'];
      expect(
        key,
        matches(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        ),
      );
      api.error = null;
      api.outcome = 'already_redeemed';
      await operation.consume(api);
      expect(api.bodies.last['requestKey'], key);
      expect(operation.hasPendingRequest, isFalse);
      await operation.consume(api);
      expect(api.bodies.last['requestKey'], isNot(key));
    },
  );
  test(
    'concurrent clicks share one reset and definitive rejection clears the attempt',
    () async {
      final api = _Api()..pending = Completer<V10Object>();
      addTearDown(api.close);
      final operation = UsageResetOperation();
      final first = operation.consume(api);
      final second = operation.consume(api);
      expect(api.bodies.length, 1);
      api.pending!.complete({'outcome': 'reset'});
      await Future.wait([first, second]);
      api.pending = null;
      api.error = const V2BoardProblem('reset_no_credit', status: 422);
      await expectLater(operation.consume(api), throwsA(isA<V2BoardProblem>()));
      expect(operation.hasPendingRequest, isFalse);
    },
  );
}
