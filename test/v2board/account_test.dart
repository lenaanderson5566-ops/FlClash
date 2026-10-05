import 'package:flutter_test/flutter_test.dart';

import 'package:fl_clash/v2board/account.dart';

void main() {
  test('expired period allowance is unavailable even with unused bytes', () {
    final expired = V2BoardAccount({}, {
      'active': false,
      'quotaBytes': 1000,
      'uploadedBytes': 100,
    });
    final current = V2BoardAccount({}, {
      'active': true,
      'quotaBytes': 1000,
      'uploadedBytes': 100,
    });
    expect(expired.remainingBytes, 0);
    expect(current.remainingBytes, 900);
  });
  test(
    'credit balance is remaining credit and is not reduced by period usage',
    () {
      final account = V2BoardAccount(
        {
          'accountStatus': {'state': 'active', 'available': true},
        },
        {
          'quotaBytes': 1000,
          'uploadedBytes': 800,
          'downloadedBytes': 400,
          'creditBytes': 500,
          'expiresAt': '2020-01-01T00:00:00Z',
          'active': false,
        },
      );
      expect(account.remainingBytes, 0);
      expect(account.creditBytes, 500);
      expect(account.active, isTrue);
      expect(account.status, 'active');
    },
  );

  test('server quota exhaustion overrides period entitlement', () {
    final account = V2BoardAccount(
      {
        'accountStatus': {
          'state': 'active',
          'available': false,
          'quotaExhausted': true,
        },
      },
      {'active': true},
    );
    expect(account.active, isFalse);
    expect(account.status, 'exhausted');
  });

  test(
    'banned and new accounts never become connectable from stale subscription',
    () {
      expect(
        V2BoardAccount({'banned': true}, {'active': true}).status,
        'banned',
      );
      final account = V2BoardAccount(
        {
          'accountStatus': {'state': 'new', 'available': false},
        },
        {'active': true},
      );
      expect(account.status, 'noPlan');
      expect(account.active, isFalse);
    },
  );

  test('missing status fails closed and byte counts never become negative', () {
    final account = V2BoardAccount({}, {'quotaBytes': -1, 'creditBytes': -10});
    expect(account.active, isFalse);
    expect(account.remainingBytes, 0);
    expect(account.creditBytes, 0);
  });
}
