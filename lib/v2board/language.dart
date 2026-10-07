String clientLanguage(String value) {
  final tag = value.replaceAll('_', '-').toLowerCase();
  final base = tag.split('-').first;
  if (base == 'zh') {
    return tag.split('-').any({'tw', 'hk', 'mo', 'hant'}.contains)
        ? 'zh-TW'
        : 'zh-CN';
  }
  return const {
        'en': 'en-US',
        'ja': 'ja-JP',
        'ko': 'ko-KR',
        'vi': 'vi-VN',
        'ru': 'ru-RU',
        'fa': 'fa-IR',
      }[base] ??
      'en-US';
}
