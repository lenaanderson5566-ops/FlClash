import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:fastai/common/common.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

Map<String, Map<String, dynamic>> decodeNodeMetadata(dynamic rows) {
  if (rows is! List) throw const FormatException('Invalid node metadata');
  final result = <String, Map<String, dynamic>>{};
  for (final row in rows) {
    if (row is! Map<String, dynamic> ||
        row['proxyName'] is! String ||
        row['nodeId'] is! String ||
        row['name'] is! String ||
        row['displayNames'] is! Map ||
        row['tags'] is! List ||
        (row['regionCode'] != null && row['regionCode'] is! String)) {
      throw const FormatException('Invalid node metadata');
    }
    final name = row['proxyName'] as String;
    if (result.containsKey(name)) throw const FormatException('Duplicate node');
    result[name] = row;
  }
  return result;
}

String? migrateNodeChoice(
  String? previous,
  Map<String, Map<String, dynamic>> metadata,
  Iterable<String> choices,
) {
  if (previous == null) return null;
  if (choices.contains(previous)) return previous;
  final matches = metadata.entries
      .where(
        (entry) =>
            entry.value['name'] == previous && choices.contains(entry.key),
      )
      .toList();
  return matches.length == 1 ? matches.single.key : null;
}

String nodeDisplayName(
  Map<String, dynamic>? node,
  String proxyName,
  Locale locale,
) {
  final names = node?['displayNames'];
  if (names is Map) {
    final language = locale.languageCode;
    final full = locale.toLanguageTag();
    final normalized = switch (language) {
      'zh' =>
        locale.countryCode == 'TW' || locale.scriptCode == 'Hant'
            ? 'zh-TW'
            : 'zh-CN',
      'ja' => 'ja-JP',
      'ko' => 'ko-KR',
      'ru' => 'ru-RU',
      'vi' => 'vi-VN',
      'fa' => 'fa-IR',
      _ => 'en-US',
    };
    for (final key in [full, normalized, 'en-US']) {
      final value = names[key];
      if (value is String && value.isNotEmpty) return value;
    }
  }
  return node?['name'] as String? ?? proxyName;
}

Future<File> nodeMetadataFile(int profileId) async =>
    File('${await appPath.getProfilePath(profileId.toString())}.nodes.json');

final fastaiNodeMetadataProvider =
    FutureProvider<Map<String, Map<String, dynamic>>>((ref) async {
      final profile = ref.watch(currentProfileProvider);
      if (profile == null) return {};
      try {
        final sidecar = await nodeMetadataFile(profile.id);
        if (!await sidecar.exists()) return {};
        final payload =
            jsonDecode(await sidecar.readAsString()) as Map<String, dynamic>;
        final yaml = await (await profile.file).readAsBytes();
        if (payload['yamlHash'] != sha256.convert(yaml).toString()) return {};
        return decodeNodeMetadata(payload['nodes']);
      } on FileSystemException {
        return {};
      } on FormatException {
        return {};
      } on TypeError {
        return {};
      }
    });

class NodeRegionFlag extends StatelessWidget {
  const NodeRegionFlag({
    super.key,
    required this.regionCode,
    required this.fallback,
  });
  final String? regionCode;
  final Widget fallback;
  @override
  Widget build(BuildContext context) {
    final region = regionCode?.toLowerCase();
    final code = region == 'tw' ? 'cn' : region;
    if (code == null || !RegExp(r'^[a-z]{2}$').hasMatch(code)) return fallback;
    return SvgPicture.asset(
      'assets/images/flags/$code.svg',
      width: 28,
      height: 28,
      semanticsLabel: code.toUpperCase(),
      errorBuilder: (context, error, stack) => fallback,
    );
  }
}
