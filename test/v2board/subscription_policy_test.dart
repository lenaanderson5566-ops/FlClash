import 'package:fastai/v2board/subscription_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('removes exact metadata prefixes and dangling group selections', () {
    final config = <String, dynamic>{
      'proxies': [
        {'name': '剩余流量: 10 GB'},
        {'name': '套餐到期：2026-12-01'},
        {'name': 'Remaining data: 10 GB'},
        {'name': '东京 · 01'},
        {'name': '剩余流量优化线路'},
      ],
      'proxy-groups': [
        {
          'name': '线路',
          'proxies': [
            '剩余流量: 10 GB',
            '套餐到期：2026-12-01',
            'Remaining data: 10 GB',
            '东京 · 01',
            'DIRECT',
          ],
        },
      ],
    };
    expect(removeSubscriptionMetadata(config).length, 3);
    expect((config['proxies'] as List).map((p) => p['name']), [
      '东京 · 01',
      '剩余流量优化线路',
    ]);
    expect(config['proxy-groups'][0]['proxies'], ['东京 · 01', 'DIRECT']);
    expect(removeSubscriptionMetadata(config), isEmpty);
  });
}
