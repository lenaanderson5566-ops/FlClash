import 'package:fastai/common/snowflake.dart';

import 'api.dart';

class UsageResetSummary {
  UsageResetSummary(this.data);
  final V10Object data;

  int get available => data['available'] is int && data['available'] >= 0
      ? data['available'] as int
      : 0;
  bool get canReset => data['canReset'] == true && available > 0;
  String? get disabledReason => data['disabledReason'] as String?;
}

class UsageResetOperation {
  String? _requestKey;
  Future<void>? _pending;
  bool get hasPendingRequest => _requestKey != null;

  Future<void> consume(V2BoardApi api) =>
      _pending ??= _consume(api).whenComplete(() => _pending = null);

  Future<void> _consume(V2BoardApi api) async {
    _requestKey ??= uuidV4;
    try {
      final result = await api.object(
        'POST',
        '/me/usage-resets/consumptions',
        body: {'requestKey': _requestKey},
      );
      if (!const ['reset', 'already_redeemed'].contains(result['outcome'])) {
        throw const V2BoardProblem('invalid_response');
      }
    } on V2BoardProblem catch (error) {
      if (error.status != null &&
          error.status! >= 400 &&
          error.status! < 500 &&
          error.status != 429) {
        _requestKey = null;
      }
      rethrow;
    }
    _requestKey = null;
  }
}
