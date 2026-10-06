class V2BoardConfig {
  static const enabled = bool.fromEnvironment(
    'V2BOARD_ENABLED',
    defaultValue: true,
  );
  static const appName = String.fromEnvironment(
    'V2BOARD_NAME',
    defaultValue: 'FastAI',
  );
  static const panelUrl = String.fromEnvironment(
    'V2BOARD_URL',
    defaultValue: 'https://fastdog.ws',
  );
  static const websiteUrl = String.fromEnvironment(
    'V2BOARD_WEBSITE',
    defaultValue: 'https://fastdog.ws',
  );
  static const allowProfileImports = !enabled;
  static const managedProfileLabel = '$appName · managed';

  static Uri origin(String value) {
    final uri = Uri.tryParse(value.trim());
    if (uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty ||
        uri.hasQuery ||
        uri.hasFragment ||
        (uri.path.isNotEmpty && uri.path != '/')) {
      throw const FormatException('invalid_panel_origin');
    }
    return uri.replace(path: '');
  }
}
