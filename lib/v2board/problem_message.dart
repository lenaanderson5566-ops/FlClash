import 'package:fastai/l10n/l10n.dart';

import 'api.dart';

String clientProblemMessage(
  V2BoardProblem problem,
  AppLocalizations l, {
  required bool hadSession,
}) => switch (problem.code) {
  'CLIENT_VERSION_TOO_LOW' => l.fdUpdateRequired,
  'CLIENT_DISABLED' => l.fdClientUnavailable,
  'SUBSCRIPTION_UNAVAILABLE' => l.fdNodesUnavailable,
  'connection_failed' => l.fdConnectionFailed,
  'subscription_failed' => l.fdSyncFailed,
  'invalid_config' || 'invalid_response' => l.fdInvalidConfig,
  'request_timeout' => l.fdRequestTimeout,
  'certificate_error' => l.fdCertificateError,
  'network_error' => l.fdNetworkError,
  _ => switch (problem.status) {
    401 => hadSession ? l.fdSessionExpired : l.fdInvalidCredentials,
    403 => l.fdBanned,
    422 => l.fdValidationError,
    429 => l.fdRateLimited,
    _ => l.fdRequestFailed,
  },
};
