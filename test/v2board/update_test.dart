import 'package:fastai/v2board/update.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> release() => {
  'latestVersion': '1.2.0',
  'latestBuild': 2026100602,
  'minimumVersion': '1.0.0',
  'downloadUrl': 'https://fastdog.ws/download/FastAI.exe',
  'sha256': List.filled(64, 'a').join(),
  'releaseNotes': 'New version',
};

void main() {
  test('minimum version is independent of an optional newer release', () {
    final value = FastaiRelease.fromJson(release());
    expect(value.requiredFor('0.8.99'), isTrue);
    expect(value.requiredFor('1.0.0'), isFalse);
    expect(value.availableFor('1.1.9', 2026100602), isTrue);
    expect(value.availableFor('1.2.0', 2026100601), isTrue);
    expect(value.availableFor('1.2.0', 2026100602), isFalse);
    expect(value.availableFor('1.3.0', 1), isFalse);
  });

  test(
    'rejects unsafe downloads, malformed digests and inconsistent versions',
    () {
      for (final patch in [
        {'downloadUrl': 'http://fastdog.ws/update.exe'},
        {'downloadUrl': 'https://user:secret@fastdog.ws/update.exe'},
        {'downloadUrl': 'file:///update.exe'},
        {'minimumVersion': '9.0.0'},
        {'latestVersion': '1.2.0-beta.1'},
        {'sha256': 'invalid'},
        {'latestBuild': 0},
      ]) {
        expect(
          () => FastaiRelease.fromJson({...release(), ...patch}),
          throwsFormatException,
        );
      }
    },
  );
}
