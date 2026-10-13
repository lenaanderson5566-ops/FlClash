import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:fastai/models/models.dart';

import 'api.dart';
import 'singbox_rules.dart';

Map<String, dynamic> singboxProfile(Map<String, dynamic> configuration) {
  final outbounds = configuration['outbounds'];
  if (outbounds is! List || outbounds.isEmpty) {
    throw const FormatException('Missing sing-box outbounds');
  }
  final nodes = <Map<String, dynamic>>[];
  final groups = <Map<String, dynamic>>[];
  final names = <String>{};
  for (final outbound in outbounds) {
    if (outbound is! Map ||
        outbound['tag'] is! String ||
        outbound['type'] is! String ||
        !names.add(outbound['tag'] as String)) {
      throw const FormatException('Invalid sing-box outbound');
    }
    final type = outbound['type'];
    if (type == 'selector' || type == 'urltest') {
      if (outbound['outbounds'] is! List) {
        throw const FormatException('Missing sing-box group members');
      }
      groups.add({
        'name': outbound['tag'],
        'type': type == 'selector' ? 'select' : 'url-test',
        'proxies': outbound['outbounds'],
      });
    } else {
      nodes.add({'name': outbound['tag'], 'type': type});
    }
  }
  return {
    'fastai-core': 'sing-box',
    'configuration': configuration,
    'proxies': nodes,
    'proxy-groups': groups,
  };
}

({Map<String, dynamic> profile, Set<String> removed}) compatibleSingboxProfile(
  Map<String, dynamic> configuration, {
  required Iterable<String> features,
}) {
  final original = singboxProfile(configuration);
  if (features.contains('naive')) {
    return (profile: original, removed: <String>{});
  }
  final removed = (configuration['outbounds'] as List)
      .cast<Map>()
      .where((node) => node['type'] == 'naive')
      .map((node) => node['tag'] as String)
      .toSet();
  if (removed.isEmpty) return (profile: original, removed: removed);
  final copy = jsonDecode(jsonEncode(configuration)) as Map<String, dynamic>;
  final outbounds = (copy['outbounds'] as List).cast<Map<String, dynamic>>();
  var changed = true;
  while (changed) {
    changed = false;
    for (final node in outbounds) {
      if (removed.contains(node['tag'])) continue;
      if (removed.contains(node['detour'])) {
        changed = removed.add(node['tag'] as String) || changed;
        continue;
      }
      if (node['type'] == 'selector' || node['type'] == 'urltest') {
        final members = (node['outbounds'] as List)
            .where((name) => !removed.contains(name))
            .toList();
        node['outbounds'] = members;
        if (removed.contains(node['default'])) node.remove('default');
        if (members.isEmpty) {
          changed = removed.add(node['tag'] as String) || changed;
        }
      }
    }
  }
  outbounds.removeWhere((node) => removed.contains(node['tag']));
  if (!outbounds.any(
        (node) => !const {
          'direct',
          'block',
          'dns',
          'selector',
          'urltest',
        }.contains(node['type']),
      ) ||
      _referencesRemoved(copy['route'], removed) ||
      _referencesRemoved(copy['dns'], removed)) {
    throw const V2BoardProblem('unsupported_protocol');
  }
  copy['outbounds'] = outbounds;
  return (profile: singboxProfile(copy), removed: removed);
}

bool _referencesRemoved(dynamic value, Set<String> removed) {
  if (value is List) {
    return value.any((item) => _referencesRemoved(item, removed));
  }
  if (value is Map) {
    return value.entries.any(
      (entry) =>
          (const {'outbound', 'detour', 'final'}.contains(entry.key) &&
              removed.contains(entry.value)) ||
          _referencesRemoved(entry.value, removed),
    );
  }
  return false;
}

({String yaml, String md5}) singboxRuntimeProfile(
  Map<String, dynamic> profile,
  PatchClashConfig patch, {
  required bool safeMode,
  bool android = false,
  bool macos = false,
}) {
  final config = withDefaultSingboxRules(
    Map<String, dynamic>.from(profile['configuration'] as Map),
    ipv6: patch.ipv6,
  );
  config['inbounds'] = [
    if (!safeMode && patch.mixedPort > 0)
      {
        'type': 'mixed',
        'tag': 'fastai-mixed',
        'listen': patch.allowLan ? '0.0.0.0' : '127.0.0.1',
        'listen_port': patch.mixedPort,
      },
    if (!safeMode && !android && patch.tun.enable)
      {
        'type': 'tun',
        'tag': 'fastai-tun',
        if (!macos) 'interface_name': 'FastAI',
        'address': ['172.19.0.1/30', if (patch.ipv6) 'fdfe:dcba:9876::1/126'],
        'mtu': 1500,
        'auto_route': true,
        'strict_route': true,
        'stack': 'mixed',
        if (patch.tun.routeAddress.isNotEmpty)
          'route_address': patch.tun.routeAddress,
      },
  ];
  config['experimental'] = {
    'clash_api': {
      'default_mode': switch (patch.mode.name) {
        'global' => 'Global',
        'direct' => 'Direct',
        _ => 'Rule',
      },
    },
  };
  final content = jsonEncode({
    'fastai-core': 'sing-box',
    'configuration': config,
  });
  return (yaml: content, md5: md5.convert(utf8.encode(content)).toString());
}
