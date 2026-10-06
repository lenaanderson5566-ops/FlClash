import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:fastai/common/constant.dart';

Future<void> restoreBundledGeo(String home, {AssetBundle? bundle}) async {
  for (final name in [MMDB, GEOIP, GEOSITE, ASN]) {
    final data = await (bundle ?? rootBundle).load('assets/data/$name');
    final bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    final file = File(join(home, name));
    if (await file.exists() &&
        await sha256.bind(file.openRead()).first == sha256.convert(bytes)) {
      continue;
    }
    final temporary = File('${file.path}.bundled');
    await temporary.writeAsBytes(bytes, flush: true);
    await temporary.rename(file.path);
  }
}

void enforceBundledRules(Map config) {
  config['geo-auto-update'] = false;
  config.remove('geo-update-interval');
  config.remove('geox-url');
  final providers = config['rule-providers'];
  if (providers is Map) {
    for (final provider in providers.values) {
      if (provider is! Map ||
          provider['type'] == 'http' ||
          provider.containsKey('url')) {
        throw const FormatException(
          'FastAI requires bundled or inline rule providers.',
        );
      }
    }
  }
}
