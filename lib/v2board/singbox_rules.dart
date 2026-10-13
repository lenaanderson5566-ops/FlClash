Map<String, dynamic> withDefaultSingboxRules(
  Map<String, dynamic> source, {
  bool ipv6 = true,
}) {
  final route = Map<String, dynamic>.from(source['route'] as Map? ?? {});
  final sets = route['rule_set'] as List? ?? const [];
  if (sets.isNotEmpty) return source;
  final outbounds = (source['outbounds'] as List).whereType<Map>();
  final proxy = route['final'];
  if (proxy is! String ||
      !outbounds.any((o) => o['tag'] == proxy) ||
      !outbounds.any((o) => o['tag'] == 'DIRECT' && o['type'] == 'direct')) {
    return source;
  }
  final dns = Map<String, dynamic>.from(source['dns'] as Map? ?? {});
  final servers = (dns['servers'] as List? ?? const [])
      .whereType<Map>()
      .toList();
  const directDns = 'fastai-dns-direct';
  const proxyDns = 'fastai-dns-proxy';
  if (servers.any((s) => {directDns, proxyDns}.contains(s['tag']))) {
    throw const FormatException('Reserved FastAI DNS tag');
  }
  dns['servers'] = [
    ...servers,
    {'type': 'local', 'tag': directDns},
    {
      'type': 'https',
      'tag': proxyDns,
      'server': '1.1.1.1',
      'path': '/dns-query',
      'detour': proxy,
    },
  ];
  dns['rules'] = [
    {'clash_mode': 'Direct', 'action': 'route', 'server': directDns},
    {'clash_mode': 'Global', 'action': 'route', 'server': proxyDns},
    ...dns['rules'] as List? ?? const [],
    {
      'domain_suffix': ['lan', 'local'],
      'action': 'route',
      'server': directDns,
    },
    {
      'rule_set': ['fastai-geosite-cn'],
      'action': 'route',
      'server': directDns,
    },
  ];
  dns['final'] = proxyDns;
  dns['independent_cache'] = true;
  dns['strategy'] = ipv6 ? 'prefer_ipv4' : 'ipv4_only';
  route['default_domain_resolver'] ??= {'server': directDns};
  route['rule_set'] = [
    for (final kind in ['geosite', 'geoip'])
      {
        'type': 'remote',
        'tag': 'fastai-$kind-cn',
        'format': 'binary',
        'url':
            'https://raw.githubusercontent.com/SagerNet/sing-$kind/rule-set/$kind-cn.srs',
        'initial_path': 'fastai-bundled:$kind-cn.srs',
        'http_client': {'detour': proxy, 'connect_timeout': '10s'},
        'update_interval': '5d',
      },
  ];
  final existingRules = route['rules'] as List? ?? const [];
  route['rules'] = [
    for (final mode in ['Direct', 'Global'])
      if (!existingRules.whereType<Map>().any((r) => r['clash_mode'] == mode))
        {
          'clash_mode': mode,
          'action': 'route',
          'outbound': mode == 'Direct' ? 'DIRECT' : proxy,
        },
    ...existingRules,
    {
      'domain_suffix': ['lan', 'local'],
      'action': 'route',
      'outbound': 'DIRECT',
    },
    {
      'rule_set': ['fastai-geosite-cn'],
      'action': 'route',
      'outbound': 'DIRECT',
    },
    {'action': 'resolve', 'strategy': ipv6 ? 'prefer_ipv4' : 'ipv4_only'},
    {'ip_is_private': true, 'action': 'route', 'outbound': 'DIRECT'},
    {
      'rule_set': ['fastai-geoip-cn'],
      'action': 'route',
      'outbound': 'DIRECT',
    },
  ];
  return {...source, 'route': route, 'dns': dns};
}
