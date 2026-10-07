enum NetworkCheck {
  dns,
  website,
  proxy,
  settings,
  systemProxy,
  route,
  tcp,
  tls,
  reference,
}

enum NetworkCheckStatus { passed, failed, skipped, unverified }

class NetworkCheckResult {
  const NetworkCheckResult(
    this.check,
    this.status, {
    this.detail,
    this.parameters = const {},
  });
  final Map<String, String> parameters;
  final String? detail;
  final NetworkCheck check;
  final NetworkCheckStatus status;
}

class DiagnosticSnapshot {
  DiagnosticSnapshot({
    required this.startedAt,
    required this.finishedAt,
    required List<NetworkCheckResult> results,
  }) : results = List.unmodifiable(
         results.map(
           (r) => NetworkCheckResult(
             r.check,
             r.status,
             detail: r.detail,
             parameters: Map.unmodifiable(r.parameters),
           ),
         ),
       );
  final DateTime startedAt;
  final DateTime finishedAt;
  final List<NetworkCheckResult> results;

  Map<String, Object> toJson() => {
    'schemaVersion': 1,
    'startedAt': startedAt.toUtc().toIso8601String(),
    'finishedAt': finishedAt.toUtc().toIso8601String(),
    'elapsedMs': finishedAt.difference(startedAt).inMilliseconds,
    'checks': [
      for (final result in results)
        {
          'id': result.check.name,
          'status': result.status.name,
          'evidence': result.parameters,
          'suggestedActions': diagnosticActionCodes(result),
          'assessment': 'observation_not_root_cause',
        },
    ],
    'automaticRepair': false,
    'scope': 'client_connection_snapshot',
    'pathComparison': diagnosticPathComparison(results),
    'limitations': [
      'not_all_services_tested',
      'not_a_dns_leak_test',
      'no_firewall_or_organization_policy_inspection',
    ],
  };
}

List<String> diagnosticActionCodes(NetworkCheckResult result) {
  if (result.status == NetworkCheckStatus.passed) return const [];
  if (result.status == NetworkCheckStatus.skipped) {
    return const ['connect_then_recheck'];
  }
  if (result.status == NetworkCheckStatus.unverified) {
    return const ['verify_manually', 'recheck'];
  }
  return switch (result.check) {
    NetworkCheck.dns => const [
      'check_network_sign_in',
      'try_another_network',
      'contact_support',
    ],
    NetworkCheck.website || NetworkCheck.tls => const [
      'check_clock',
      'open_official_website',
      'contact_support',
    ],
    NetworkCheck.tcp => const [
      'review_dns',
      'try_another_network',
      'review_firewall',
    ],
    NetworkCheck.reference => const [
      'check_network_sign_in',
      'try_another_network',
    ],
    NetworkCheck.proxy => const ['reconnect', 'restart_app', 'contact_support'],
    NetworkCheck.settings => const [
      'check_account',
      'refresh_routes',
      'check_tun_permission',
    ],
    NetworkCheck.systemProxy => const [
      'review_system_proxy',
      'review_other_vpn',
      'reconnect',
    ],
    NetworkCheck.route => const [
      'try_another_route',
      'review_dns_and_proxy',
      'contact_support',
    ],
  };
}

String diagnosticPathComparison(List<NetworkCheckResult> results) {
  final system = results
      .where((r) => r.check == NetworkCheck.reference)
      .firstOrNull;
  final route = results.where((r) => r.check == NetworkCheck.route).firstOrNull;
  if (system == null ||
      route == null ||
      system.parameters['target'] == null ||
      system.parameters['target'] != route.parameters['target']) {
    return 'not_comparable';
  }
  if (system.status == NetworkCheckStatus.passed &&
      route.status == NetworkCheckStatus.passed) {
    return 'both_passed';
  }
  if (system.status == NetworkCheckStatus.passed &&
      route.status == NetworkCheckStatus.failed) {
    return 'route_failed';
  }
  if (system.status == NetworkCheckStatus.failed &&
      route.status == NetworkCheckStatus.passed) {
    return 'system_failed';
  }
  if (system.status == NetworkCheckStatus.failed &&
      route.status == NetworkCheckStatus.failed) {
    return 'both_failed';
  }
  return 'not_comparable';
}
