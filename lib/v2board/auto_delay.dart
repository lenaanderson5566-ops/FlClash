class AutoDelayGate {
  String? _key;
  DateTime? _lastRun;
  bool _busy = false;

  bool begin(String key, DateTime now) {
    if (_busy ||
        (_key == key &&
            _lastRun != null &&
            now.difference(_lastRun!) < const Duration(minutes: 2))) {
      return false;
    }
    _busy = true;
    _key = key;
    _lastRun = now;
    return true;
  }

  void finish() => _busy = false;
  void reset() {
    _key = null;
    _lastRun = null;
  }
}
