import 'dart:ffi';
import 'dart:io';

import 'package:fastai/common/common.dart';
import 'package:fastai/state.dart';
import 'package:fastai/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api.dart';
import 'config.dart';

String get fastaiArchitecture => switch (Abi.current()) {
  Abi.androidArm || Abi.linuxArm => 'arm',
  Abi.androidArm64 ||
  Abi.linuxArm64 ||
  Abi.macosArm64 ||
  Abi.windowsArm64 => 'arm64',
  Abi.androidIA32 || Abi.linuxIA32 || Abi.windowsIA32 => 'x86',
  _ => 'x64',
};

class FastaiRelease {
  FastaiRelease.fromJson(V10Object data)
    : latestVersion = data['latestVersion'] as String,
      latestBuild = data['latestBuild'] as int,
      minimumVersion = data['minimumVersion'] as String,
      downloadUrl = Uri.parse(data['downloadUrl'] as String),
      sha256 = data['sha256'] as String,
      notes = data['releaseNotes'] as String? ?? '' {
    final version = RegExp(r'^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$');
    if (!version.hasMatch(latestVersion) ||
        !version.hasMatch(minimumVersion) ||
        latestBuild <= 0 ||
        compareVersions(minimumVersion, latestVersion) > 0 ||
        downloadUrl.scheme != 'https' ||
        downloadUrl.host.isEmpty ||
        downloadUrl.userInfo.isNotEmpty ||
        !RegExp(r'^[a-f0-9]{64}$').hasMatch(sha256)) {
      throw const FormatException('Invalid release');
    }
  }

  final String latestVersion;
  final int latestBuild;
  final String minimumVersion;
  final Uri downloadUrl;
  final String sha256;
  final String notes;

  bool requiredFor(String version) =>
      compareVersions(version, minimumVersion) < 0;

  bool availableFor(String version, int build) =>
      compareVersions(version, latestVersion) < 0 ||
      (compareVersions(version, latestVersion) == 0 && build < latestBuild);

  bool get required => requiredFor(globalState.packageInfo.version);

  Future<void> download() async {
    if (!await launchUrl(downloadUrl, mode: LaunchMode.externalApplication)) {
      throw const V2BoardProblem('request_failed');
    }
  }
}

class FastaiReleaseState extends Notifier<FastaiRelease?> {
  DateTime? _lastCheck;

  @override
  FastaiRelease? build() => null;

  Future<FastaiRelease?> check({bool force = false}) async {
    if (!force &&
        _lastCheck != null &&
        DateTime.now().difference(_lastCheck!) < const Duration(hours: 6)) {
      return state;
    }
    final api = V2BoardApi(V2BoardConfig.panelUrl)
      ..version = globalState.packageInfo.version
      ..language = ref.read(appSettingProvider).locale ?? Platform.localeName;
    try {
      final data = await api.request(
        'GET',
        '/public/fastai/releases/latest',
        query: {
          'platform': Platform.operatingSystem,
          'architecture': fastaiArchitecture,
        },
      );
      if (!ref.mounted) return null;
      if (data is! V10Object ||
          data['platform'] != Platform.operatingSystem ||
          data['architecture'] != fastaiArchitecture ||
          data['channel'] != 'stable') {
        throw const FormatException('Invalid release target');
      }
      final release = FastaiRelease.fromJson(data);
      _lastCheck = DateTime.now();
      return state = release;
    } finally {
      api.close();
    }
  }
}

final fastaiReleaseProvider =
    NotifierProvider<FastaiReleaseState, FastaiRelease?>(
      FastaiReleaseState.new,
    );

Future<void> checkFastaiUpdate(BuildContext context, WidgetRef ref) async {
  try {
    final release = await ref
        .read(fastaiReleaseProvider.notifier)
        .check(force: true);
    if (!context.mounted) return;
    final l = context.appLocalizations;
    final info = globalState.packageInfo;
    if (release == null ||
        !release.availableFor(
          info.version,
          int.tryParse(info.buildNumber) ?? 0,
        )) {
      context.showNotifier(l.fdLatestVersion);
      return;
    }
    final accepted = await dialogs.showMessage(
      title: release.required ? l.fdUpdateRequired : l.discoverNewVersion,
      message: TextSpan(
        text:
            '${release.latestVersion}\n${release.notes}\n\nSHA-256: ${release.sha256}',
      ),
      confirmText: l.goDownload,
    );
    if (accepted == true) await release.download();
  } catch (_) {
    if (context.mounted) {
      context.showNotifier(context.appLocalizations.checkUpdateError);
    }
  }
}
