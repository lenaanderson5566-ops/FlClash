import 'api.dart';

class V2BoardAccount {
  V2BoardAccount(this.account, this.subscription);

  final V10Object account;
  final V10Object subscription;

  int get usedBytes =>
      _integer(subscription['uploadedBytes']) +
      _integer(subscription['downloadedBytes']);
  int get totalBytes => _integer(subscription['quotaBytes']);
  int get creditBytes => _integer(subscription['creditBytes']);
  bool get periodActive => subscription['active'] == true;
  int get availableBytes => remainingBytes + creditBytes;
  DateTime? get resetAt =>
      DateTime.tryParse(subscription['resetAt'] as String? ?? '');
  int get remainingBytes => subscription['active'] == true
      ? (totalBytes - usedBytes).clamp(0, totalBytes)
      : 0;
  String get email => account['email'] as String? ?? '';
  String get planName =>
      (subscription['plan'] as Map?)?['name'] as String? ?? '';
  DateTime? get expiresAt =>
      DateTime.tryParse(subscription['expiresAt'] as String? ?? '');
  bool get banned => account['banned'] == true;
  Map get _status => account['accountStatus'] as Map? ?? const {};
  bool get active => !banned && _status['available'] == true;
  String get status {
    if (banned) return 'banned';
    if (_status['quotaExhausted'] == true) return 'exhausted';
    if (_status['state'] == 'new') return 'noPlan';
    if (active) return 'active';
    return 'expired';
  }

  static int _integer(dynamic value) => value is int && value >= 0 ? value : 0;
}
