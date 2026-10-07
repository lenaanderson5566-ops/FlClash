import 'package:fastai/v2board/auto_delay.dart';
import 'package:fastai/v2board/connection_diagnostics.dart';
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
  test('system proxy requires matching HTTP and HTTPS destinations', () {
    expect(systemProxyMatches('127.0.0.1:7890', 7890), isTrue);
    expect(
      systemProxyMatches('http=127.0.0.1:7890;https=localhost:7890', 7890),
      isTrue,
    );
    expect(
      systemProxyMatches('http=127.0.0.1:7890;https=localhost:8888', 7890),
      isFalse,
    );
    expect(systemProxyMatches('http=127.0.0.1:7890', 7890), isFalse);
    expect(systemProxyMatches('127.0.0.1:78901', 7890), isFalse);
    expect(systemProxyMatches('proxy.example.com:7890', 7890), isFalse);
  });
}
