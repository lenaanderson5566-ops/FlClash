class ClientConfigCache {
  ClientConfigCache({
    required this.client,
    required this.profileId,
    required this.hash,
    required this.version,
    required this.syncedAt,
  });

  final Object client;
  final int profileId;
  final String hash;
  final String version;
  final DateTime syncedAt;

  bool reusable({
    required Object client,
    required int? profileId,
    required String version,
    required DateTime now,
  }) {
    final age = now.difference(syncedAt);
    return identical(this.client, client) &&
        this.profileId == profileId &&
        this.version == version &&
        !age.isNegative &&
        age < const Duration(minutes: 5);
  }
}
