class ClientConfigCache {
  ClientConfigCache({
    required this.client,
    required this.profileId,
    required this.hash,
    required this.version,
    required this.syncedAt,
    this.core = 'mihomo',
    this.coreFeatures = '',
  });

  final Object client;
  final String core;
  final String coreFeatures;
  final int profileId;
  final String hash;
  final String version;
  final DateTime syncedAt;

  bool reusable({
    required Object client,
    required int? profileId,
    required String version,
    required DateTime now,
    String core = 'mihomo',
    String coreFeatures = '',
  }) {
    final age = now.difference(syncedAt);
    return this.core == core &&
        this.coreFeatures == coreFeatures &&
        identical(this.client, client) &&
        this.profileId == profileId &&
        this.version == version &&
        !age.isNegative &&
        age < const Duration(minutes: 5);
  }
}
