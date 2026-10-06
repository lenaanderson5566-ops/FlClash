import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fastai/v2board/geo.dart';
import 'package:fastai/common/constant.dart';

class _Bundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async =>
      ByteData.sublistView(Uint8List.fromList(key.codeUnits));
}

void main() {
  test(
    'Geo snapshots restore missing and modified files and preserve matching files',
    () async {
      final directory = await Directory.systemTemp.createTemp('fastai-geo-');
      addTearDown(() => directory.delete(recursive: true));
      await restoreBundledGeo(directory.path, bundle: _Bundle());
      final file = File('${directory.path}/$GEOIP');
      final modified = await file.lastModified();
      await restoreBundledGeo(directory.path, bundle: _Bundle());
      expect(await file.lastModified(), modified);
      await file.writeAsString('online update');
      await restoreBundledGeo(directory.path, bundle: _Bundle());
      expect(await file.readAsString(), 'assets/data/$GEOIP');
      expect(await File('${directory.path}/$GEOSITE').exists(), isTrue);
    },
  );

  test('profile overrides cannot reenable Geo updates or remote rules', () {
    final config = <String, dynamic>{
      'geo-auto-update': true,
      'geo-update-interval': 1,
      'geox-url': {'geoip': 'https://example.com/data'},
    };
    enforceBundledRules(config);
    expect(config, {'geo-auto-update': false});
    expect(
      () => enforceBundledRules({
        'rule-providers': {
          'remote': {'type': 'http', 'url': 'https://example.com/rules'},
        },
      }),
      throwsFormatException,
    );
    final inline = <String, dynamic>{
      'rule-providers': {
        'local': {
          'type': 'inline',
          'payload': ['example.com'],
        },
      },
    };
    enforceBundledRules(inline);
    expect(inline['rule-providers'], isNotNull);
  });
}
