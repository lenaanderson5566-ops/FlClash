import 'dart:io';

import 'package:setup_hooks/src/options.dart';
import 'package:test/test.dart';

void main() {
  test('macOS Naive tags participate in build cache identity', () {
    final directory = Directory.systemTemp.createTempSync('fastai_macos_');
    addTearDown(() => directory.deleteSync(recursive: true));
    File(
      '${directory.path}/build_config.yaml',
    ).writeAsStringSync('tags: with_quic\nmacos_tags: with_naive_outbound\n');
    final config = BuildConfig.load(rootDir: directory.path);
    expect(config.macosTags, 'with_naive_outbound');
    expect(config.androidTags, isEmpty);
    expect(config.toFingerprintMap()['macos_tags'], 'with_naive_outbound');
  });

  test(
    'Android native protocol tags are loaded and invalidate cached builds',
    () {
      final directory = Directory.systemTemp.createTempSync(
        'fastai_build_config_',
      );
      addTearDown(() => directory.deleteSync(recursive: true));
      File('${directory.path}/build_config.yaml').writeAsStringSync(
        'tags: with_quic\nandroid_tags: with_naive_outbound\n',
      );
      final config = BuildConfig.load(rootDir: directory.path);
      expect(config.androidTags, 'with_naive_outbound');
      expect(config.windowsTags, isEmpty);
      expect(config.toFingerprintMap()['android_tags'], 'with_naive_outbound');
    },
  );
}
