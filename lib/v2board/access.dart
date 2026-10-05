import 'package:flutter_riverpod/flutter_riverpod.dart';

class V2BoardAccess extends Notifier<bool> {
  @override
  bool build() => false;

  void setAvailable(bool available) => state = available;
}

final v2BoardAccessProvider = NotifierProvider<V2BoardAccess, bool>(
  V2BoardAccess.new,
);
