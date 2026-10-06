const _metadataLabels = <String>[
  '剩余流量',
  '套餐到期',
  '计划重置',
  '剩餘流量',
  '方案到期',
  '預定重置',
  'Remaining data',
  'Plan expires',
  'Scheduled reset',
  '残りの容量',
  'プラン有効期限',
  '次回リセット',
  '남은 데이터',
  '요금제 만료',
  '예정된 초기화',
  'Dung lượng còn lại',
  'Gói hết hạn',
  'Đặt lại theo lịch',
  'Остаток трафика',
  'Срок тарифа',
  'Плановый сброс',
  'ترافیک باقی‌مانده',
  'انقضای طرح',
  'بازنشانی زمان‌بندی‌شده',
  'Remaining Traffic',
  'Plan Expiry',
  '重置时间',
  '流量重置',
  '到期时间',
];

Set<String> removeSubscriptionMetadata(Map<String, dynamic> config) {
  final removed = <String>{};
  final proxies = config['proxies'];
  if (proxies is! List) return removed;
  config['proxies'] = proxies.where((proxy) {
    if (proxy is! Map || proxy['name'] is! String) return true;
    final name = (proxy['name'] as String).trim();
    final metadata = _metadataLabels.any(
      (label) => RegExp(
        '^${RegExp.escape(label)}\\s*[:：]',
        caseSensitive: false,
      ).hasMatch(name),
    );
    if (metadata) removed.add(proxy['name'] as String);
    return !metadata;
  }).toList();
  if (removed.isEmpty) return removed;
  for (final group in (config['proxy-groups'] as List? ?? const [])) {
    if (group is! Map || group['proxies'] is! List) continue;
    group['proxies'] = (group['proxies'] as List)
        .where((name) => !removed.contains(name))
        .toList();
  }
  return removed;
}
