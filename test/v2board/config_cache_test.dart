import 'package:fastai/v2board/config_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'cache is short-lived and scoped to the client, profile and version',
    () {
      final client = Object();
      final syncedAt = DateTime.utc(2026, 10, 6);
      final cache = ClientConfigCache(
        client: client,
        profileId: 7,
        hash: 'hash',
        version: '1.0.0',
        syncedAt: syncedAt,
      );
      bool eligible({
        Object? session,
        int? id = 7,
        String version = '1.0.0',
        Duration age = Duration.zero,
      }) => cache.reusable(
        client: session ?? client,
        profileId: id,
        version: version,
        now: syncedAt.add(age),
      );
      expect(eligible(age: const Duration(minutes: 4)), isTrue);
      expect(eligible(age: const Duration(minutes: 5)), isFalse);
      expect(eligible(age: const Duration(seconds: -1)), isFalse);
      expect(eligible(session: Object()), isFalse);
      expect(eligible(id: null), isFalse);
      expect(eligible(id: 8), isFalse);
      expect(eligible(version: '1.0.1'), isFalse);
    },
  );
}
