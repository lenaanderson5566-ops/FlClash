import 'dart:convert';
import 'dart:io';

import 'package:fastai/models/models.dart';
import 'package:fastai/v2board/singbox.dart';
import 'package:fastai/v2board/singbox_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> template() =>
      (jsonDecode(File('core/testdata/fastai-singbox.json').readAsStringSync())
              as Map)['configuration']
          as Map<String, dynamic>;

  test('default routing preserves modes and adds offline China rules', () {
    final source = template();
    final before = jsonEncode(source);
    final config = withDefaultSingboxRules(source);
    expect(jsonEncode(source), before);
    final route = config['route'] as Map;
    final rules = route['rules'] as List;
    final firstChina = rules.indexWhere(
      (r) => (r as Map).containsKey('rule_set'),
    );
    for (final mode in ['Direct', 'Global']) {
      expect(
        rules.indexWhere((r) => r['clash_mode'] == mode),
        allOf(greaterThanOrEqualTo(0), lessThan(firstChina)),
      );
    }
    expect(route['final'], source['route']['final']);
    expect(
      rules.indexWhere((r) => r['action'] == 'resolve'),
      lessThan(
        rules.indexWhere(
          (r) => (r['rule_set'] as List? ?? []).contains('fastai-geoip-cn'),
        ),
      ),
    );
    final sets = route['rule_set'] as List;
    expect(sets, hasLength(2));
    for (final set in sets) {
      expect(set['initial_path'], startsWith('fastai-bundled:'));
      expect(
        set['url'],
        startsWith('https://raw.githubusercontent.com/SagerNet/'),
      );
      expect(set['http_client']['detour'], route['final']);
      expect(set['download_detour'], isNull);
      expect(set['update_interval'], '5d');
    }
    final dns = config['dns'] as Map;
    final dnsRules = dns['rules'] as List;
    expect(dnsRules.first['clash_mode'], 'Direct');
    expect(dnsRules[1]['clash_mode'], 'Global');
    expect(dnsRules.last['rule_set'], ['fastai-geosite-cn']);
    expect(dnsRules.last['server'], 'fastai-dns-direct');
    expect(dns['final'], 'fastai-dns-proxy');
    final fixture =
        (jsonDecode(
              File(
                'core/testdata/fastai-singbox-rules.json',
              ).readAsStringSync(),
            )
            as Map)['configuration'];
    expect(config, fixture);
  });

  test('disabled IPv6 also applies to rule resolution and DNS', () {
    final config = withDefaultSingboxRules(template(), ipv6: false);
    expect(config['dns']['strategy'], 'ipv4_only');
    final resolve = (config['route']['rules'] as List).singleWhere(
      (r) => r['action'] == 'resolve',
    );
    expect(resolve['strategy'], 'ipv4_only');
  });

  test(
    'server-supplied rule sets stay authoritative and injection is idempotent',
    () {
      final once = withDefaultSingboxRules(template());
      expect(withDefaultSingboxRules(once), same(once));
      final custom = template();
      custom['route']['rule_set'] = [
        {'type': 'inline', 'tag': 'custom', 'rules': []},
      ];
      expect(withDefaultSingboxRules(custom), same(custom));
    },
  );

  test(
    'runtime defaults work offline in safe mode without opening listeners',
    () {
      final content = singboxRuntimeProfile(
        singboxProfile(template()),
        const PatchClashConfig(),
        safeMode: true,
      );
      final config = (jsonDecode(content.yaml) as Map)['configuration'] as Map;
      expect(config['inbounds'], isEmpty);
      expect(config['route']['rule_set'], hasLength(2));
      expect(
        config['experimental']['clash_api']['external_controller'],
        isNull,
      );
    },
  );
}
