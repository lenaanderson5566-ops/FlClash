enum NetworkCheck { dns, website, proxy, settings, systemProxy, route }

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
    NetworkCheck.website => const [
      'check_clock',
      'open_official_website',
      'contact_support',
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
