import 'package:fastai/common/common.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaml/yaml.dart';
import 'package:fastai/v2board/config.dart';

const _profileDns = <String, dynamic>{
  'enable': true,
  'listen': '0.0.0.0:53',
  'nameserver': ['9.9.9.9'],
  'fallback-filter': {
    'geoip': false,
    'domain': ['keep.me'],
  },
};

const _patchConfig = PatchClashConfig(
  dns: Dns(
    listen: ':1053',
    ipv6: true,
    nameserver: ['1.1.1.1'],
    fallbackFilter: FallbackFilter(geoip: true),
  ),
  dnsOverrideKeys: {
    DnsOverrideKey.nameserver,
    DnsOverrideKey.fallbackFilterGeoip,
    DnsOverrideKey.ipv6,
  },
);

Future<YamlMap> _dnsOf({
  required Map<String, dynamic> rawConfig,
  required bool overrideDns,
  bool appendSystemDns = false,
  bool safeMode = false,
}) async {
  final result = await makeRealProfileTask(
    MakeRealProfileState(
      profilesPath: '/profiles',
      profileId: 1,
      rawConfig: rawConfig,
      realPatchConfig: _patchConfig,
      overrideDns: overrideDns,
      overrideNtp: false,
      appendSystemDns: appendSystemDns,
      safeMode: safeMode,
      proxyGroups: const [],
      rules: const [],
      addedRules: const [],
      defaultUA: 'FastAI-Test',
    ),
  );
  final config = loadYaml(result.yaml) as YamlMap;
  return config['dns'] as YamlMap;
}

void main() {
  if (V2BoardConfig.enabled) {
    test(
      'managed DNS preserves service policy despite stale overrides',
      () async {
        final serviceDns = {
          ..._profileDns,
          'respect-rules': true,
          'nameserver': ['https://cloudflare-dns.com/dns-query#FastAI'],
          'proxy-server-nameserver': [
            'https://dns.alidns.com/dns-query#DIRECT',
          ],
          'nameserver-policy': {
            'geosite:cn': ['https://doh.pub/dns-query#DIRECT'],
          },
        };
        final dns = await _dnsOf(
          rawConfig: {'dns': serviceDns},
          overrideDns: true,
          appendSystemDns: true,
        );
        expect(dns, {...serviceDns, 'listen': '127.0.0.1:1053', 'ipv6': false});
      },
    );
    test('managed safe mode disables DNS listener', () async {
      final dns = await _dnsOf(
        rawConfig: {'dns': _profileDns},
        overrideDns: false,
        safeMode: true,
      );
      expect(dns, {..._profileDns, 'listen': '', 'ipv6': false});
    });
    test('managed missing DNS does not apply legacy user overrides', () async {
      final dns = await _dnsOf(rawConfig: {}, overrideDns: true);
      expect(dns['enable'], true);
      expect(dns['enhanced-mode'], 'fake-ip');
      expect(dns['nameserver'], defaultDns.nameserver);
      expect(dns.containsKey('fallback-filter'), false);
      expect(dns['listen'], '127.0.0.1:1053');
      expect(dns['ipv6'], false);
    });
    return;
  }
  test('overrides only the selected DNS keys of an enabled profile', () async {
    final dns = await _dnsOf(
      rawConfig: {'dns': _profileDns},
      overrideDns: true,
    );

    expect(dns['nameserver'], ['1.1.1.1']);
    expect(dns['ipv6'], true);
    expect(dns['listen'], '0.0.0.0:53');
    expect(dns['fallback-filter'], {
      'geoip': true,
      'domain': ['keep.me'],
    });
  });

  test('leaves an enabled profile alone while the override is off', () async {
    final dns = await _dnsOf(
      rawConfig: {'dns': _profileDns},
      overrideDns: false,
    );

    expect(dns['nameserver'], ['9.9.9.9']);
    expect(dns.containsKey('ipv6'), isFalse);
    expect(dns['fallback-filter'], {
      'geoip': false,
      'domain': ['keep.me'],
    });
  });

  test(
    'fills the minimal defaults plus overrides for a profile without DNS',
    () async {
      final dns = await _dnsOf(rawConfig: {}, overrideDns: false);

      expect(dns, {
        'enable': true,
        'enhanced-mode': 'fake-ip',
        'nameserver': ['1.1.1.1'],
        'ipv6': true,
        'fallback-filter': {'geoip': true},
      });
    },
  );
}
