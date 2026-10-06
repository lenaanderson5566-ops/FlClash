import 'package:flutter_riverpod/flutter_riverpod.dart';

class V2BoardAccess extends Notifier<bool> {
  bool _versionRejected = false;

  @override
  bool build() => false;

  void setAvailable(bool available) => state = available && !_versionRejected;

  void rejectVersion() {
    _versionRejected = true;
    state = false;
  }

  void acceptVersion() => _versionRejected = false;
}

final v2BoardAccessProvider = NotifierProvider<V2BoardAccess, bool>(
  V2BoardAccess.new,
);
