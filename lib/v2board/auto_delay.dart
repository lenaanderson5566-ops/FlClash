class AutoDelayGate {
  static const interval = Duration(minutes: 10);
  String? _key;
  DateTime? _lastRun;
  bool _busy = false;

  bool begin(String key, DateTime now) {
    if (_busy ||
        (_key == key &&
            _lastRun != null &&
            now.difference(_lastRun!) < interval)) {
      return false;
    }
    _busy = true;
    _key = key;
    _lastRun = now;
    return true;
  }

  Duration? retryAfter(String key, DateTime now) {
    if (_busy) return null;
    if (_key != key || _lastRun == null) return Duration.zero;
    final remaining = interval - now.difference(_lastRun!);
    return remaining > Duration.zero ? remaining : Duration.zero;
  }

  void finish() => _busy = false;
  void reset() {
    _key = null;
    _lastRun = null;
  }
}
