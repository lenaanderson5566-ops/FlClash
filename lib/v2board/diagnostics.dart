import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientRequestDiagnostic {
  ClientRequestDiagnostic({
    required this.method,
    required String path,
    required String code,
    required String requestId,
    required this.status,
    required this.duration,
  }) : endpoint =
           const {
             '/auth/sessions',
             '/me',
             '/me/subscription',
             '/me/client-config',
             '/me/session',
             '/me/login-links',
             '/me/usage-resets',
             '/me/usage-resets/consumptions',
           }.contains(path)
           ? path
           : '/other',
       code = RegExp(r'^[a-zA-Z0-9_]{1,64}$').hasMatch(code)
           ? code
           : 'request_failed',
       requestId = RegExp(r'^[a-zA-Z0-9_-]{1,80}$').hasMatch(requestId)
           ? requestId
           : '',
       timestamp = DateTime.now();

  final String method;
  final String endpoint;
  final String code;
  final String requestId;
  final int? status;
  final Duration duration;
  final DateTime timestamp;

  String get summary =>
      '$method $endpoint · ${status ?? code} · ${duration.inMilliseconds} ms';
}

class ClientDiagnostics extends Notifier<List<ClientRequestDiagnostic>> {
  @override
  List<ClientRequestDiagnostic> build() => const [];

  void record(ClientRequestDiagnostic event) =>
      state = [event, ...state.take(29)];

  void clear() => state = const [];
}

final clientDiagnosticsProvider =
    NotifierProvider<ClientDiagnostics, List<ClientRequestDiagnostic>>(
      ClientDiagnostics.new,
    );
