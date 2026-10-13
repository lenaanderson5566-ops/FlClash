import 'dart:convert';

import 'package:fastai/models/models.dart';
import 'package:fastai/v2board/singbox.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/config_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'new and legacy preferences default to sing-box while explicit fallback persists',
    () {
      expect(const AppSettingProps().proxyCore, 'sing-box');
      expect(AppSettingProps.fromJson({}).proxyCore, 'sing-box');
      final saved = AppSettingProps.fromJson({'proxyCore': 'mihomo'});
      expect(saved.proxyCore, 'mihomo');
      expect(AppSettingProps.fromJson(saved.toJson()).proxyCore, 'mihomo');
    },
  );
  final config = <String, dynamic>{
    'outbounds': [
      {'type': 'direct', 'tag': 'DIRECT'},
      {'type': 'shadowsocks', 'tag': 'node_v2box_1'},
      {
        'type': 'selector',
        'tag': 'GLOBAL',
        'outbounds': ['node_v2box_1'],
      },
    ],
    'route': {'final': 'GLOBAL'},
  };

  test('native JSON keeps protocol settings and stable metadata names', () {
    final profile = singboxProfile(config);
    expect(profile['fastai-core'], 'sing-box');
    expect(profile['configuration'], same(config));
    expect((profile['proxy-groups'] as List).single['type'], 'select');
    expect((profile['proxies'] as List).last['name'], 'node_v2box_1');
  });

  test('safe mode never opens sing-box listeners or controller', () {
    final profile = singboxProfile(config);
    final result = singboxRuntimeProfile(
      profile,
      const PatchClashConfig(tun: Tun(enable: true)),
      safeMode: true,
    );
    final runtime = (jsonDecode(result.yaml) as Map)['configuration'] as Map;
    expect(runtime['inbounds'], isEmpty);
    expect(runtime['experimental']['clash_api']['external_controller'], isNull);
    expect(config.containsKey('inbounds'), isFalse);
  });

  test('macOS allocates a free utun and safe mode opens no listeners', () {
    for (final safe in [false, true]) {
      final result = singboxRuntimeProfile(
        singboxProfile(config),
        const PatchClashConfig(tun: Tun(enable: true)),
        safeMode: safe,
        macos: true,
      );
      final runtime = (jsonDecode(result.yaml) as Map)['configuration'] as Map;
      final inbounds = runtime['inbounds'] as List;
      if (safe) {
        expect(inbounds, isEmpty);
      } else {
        final tun = inbounds.singleWhere((e) => e['type'] == 'tun') as Map;
        expect(tun.containsKey('interface_name'), isFalse);
        expect(tun['auto_route'], isTrue);
        expect(tun['address'], contains('172.19.0.1/30'));
      }
    }
  });

  test('Android leaves TUN creation to the native VPN service', () {
    final profile = singboxProfile(config);
    final result = singboxRuntimeProfile(
      profile,
      const PatchClashConfig(tun: Tun(enable: true)),
      safeMode: false,
      android: true,
    );
    final runtime = (jsonDecode(result.yaml) as Map)['configuration'] as Map;
    expect(
      (runtime['inbounds'] as List).where((e) => e['type'] == 'tun'),
      isEmpty,
    );
    expect((runtime['inbounds'] as List).single['type'], 'mixed');
    expect(runtime['experimental']['clash_api']['external_controller'], isNull);
  });

  test('duplicate outbound identities fail before replacing the profile', () {
    expect(
      () => singboxProfile({
        'outbounds': [
          {'type': 'direct', 'tag': 'same'},
          {'type': 'direct', 'tag': 'same'},
        ],
      }),
      throwsFormatException,
    );
  });

  test('legacy Mihomo cache cannot be reused by sing-box', () {
    final client = Object();
    final now = DateTime.now();
    final cache = ClientConfigCache(
      client: client,
      profileId: 1,
      hash: 'hash',
      version: '1',
      syncedAt: now,
      core: 'mihomo',
    );
    expect(
      cache.reusable(client: client, profileId: 1, version: '1', now: now),
      isFalse,
    );
  });
  test('cached profile is invalidated when runtime capabilities change', () {
    final client = Object();
    final now = DateTime.now();
    final cache = ClientConfigCache(
      client: client,
      profileId: 1,
      hash: 'hash',
      version: '1',
      syncedAt: now,
      core: 'sing-box',
      coreFeatures: 'naive',
    );
    expect(
      cache.reusable(
        client: client,
        profileId: 1,
        version: '1',
        now: now,
        core: 'sing-box',
      ),
      isFalse,
    );
    expect(
      cache.reusable(
        client: client,
        profileId: 1,
        version: '1',
        now: now,
        core: 'sing-box',
        coreFeatures: 'naive',
      ),
      isTrue,
    );
  });
  Map<String, dynamic> mixedConfig() => {
    'outbounds': [
      {'type': 'direct', 'tag': 'DIRECT'},
      {'type': 'naive', 'tag': 'naive'},
      {'type': 'shadowsocks', 'tag': 'ss'},
      {
        'type': 'urltest',
        'tag': 'empty',
        'outbounds': ['naive'],
      },
      {
        'type': 'selector',
        'tag': 'GLOBAL',
        'outbounds': ['empty', 'naive', 'ss'],
        'default': 'naive',
      },
    ],
    'route': {'final': 'GLOBAL'},
  };

  test(
    'client filters unavailable protocols and dependent groups without mutating input',
    () {
      final input = mixedConfig();
      final result = compatibleSingboxProfile(input, features: []);
      expect(result.removed, {'naive', 'empty'});
      final output = result.profile['configuration'] as Map;
      final outbounds = output['outbounds'] as List;
      expect(outbounds.last['outbounds'], ['ss']);
      expect(outbounds.last.containsKey('default'), isFalse);
      expect((input['outbounds'] as List).last['default'], 'naive');
      expect((input['outbounds'] as List), hasLength(5));
    },
  );

  test('available Naive is preserved without backend negotiation', () {
    final input = mixedConfig();
    final result = compatibleSingboxProfile(input, features: ['naive']);
    expect(result.removed, isEmpty);
    expect(result.profile['configuration'], same(input));
  });

  test('unavailable-only and custom dependencies fail closed', () {
    final input = mixedConfig();
    (input['outbounds'] as List).removeAt(2);
    final group = (input['outbounds'] as List).last as Map;
    group['outbounds'] = ['naive', 'empty'];
    final references = mixedConfig();
    references['dns'] = {
      'servers': [
        {'tag': 'dns', 'detour': 'naive'},
      ],
    };
    for (final config in [input, references]) {
      expect(
        () => compatibleSingboxProfile(config, features: []),
        throwsA(
          isA<V2BoardProblem>().having(
            (error) => error.code,
            'code',
            'unsupported_protocol',
          ),
        ),
      );
    }
  });
}
