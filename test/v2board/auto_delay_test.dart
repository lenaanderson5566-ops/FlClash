import 'package:fastai/v2board/auto_delay.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('delay checks deduplicate concurrent work and respect cooldown', () {
    final gate = AutoDelayGate();
    final now = DateTime(2026);
    expect(gate.retryAfter('profile-a', now), Duration.zero);
    expect(gate.begin('profile-a', now), isTrue);
    expect(gate.retryAfter('profile-a', now), isNull);
    expect(gate.begin('profile-b', now), isFalse);
    gate.finish();
    expect(
      gate.retryAfter('profile-a', now.add(const Duration(minutes: 9))),
      const Duration(minutes: 1),
    );
    expect(
      gate.begin('profile-a', now.add(const Duration(minutes: 9))),
      isFalse,
    );
    expect(
      gate.begin('profile-a', now.add(const Duration(minutes: 10))),
      isTrue,
    );
  });
  test('new configuration and core reconnect invalidate cooldown', () {
    final gate = AutoDelayGate();
    final now = DateTime(2026);
    expect(gate.begin('old', now), isTrue);
    gate.finish();
    expect(gate.begin('new', now), isTrue);
    gate.reset();
    expect(gate.begin('new', now), isFalse);
    gate.finish();
    expect(gate.begin('new', now), isTrue);
  });
}
