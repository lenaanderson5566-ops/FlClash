import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fastai/common/common.dart';
import 'package:fastai/core/controller.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/state.dart';
import 'package:fastai/v2board/access.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../helpers/test_profiles.dart';

class _Core extends Mock implements CoreController {}

class _Paths extends PathProviderPlatform {
  _Paths(this.root);
  final String root;
  @override
  Future<String?> getTemporaryPath() async => root;
  @override
  Future<String?> getApplicationSupportPath() async => root;
  @override
  Future<String?> getApplicationCachePath() async => root;
}

class _Api extends V2BoardApi {
  _Api() : super('https://panel.example');
  final requested = Completer<void>();
  final response = Completer<Uint8List>();

  @override
  Future<Uint8List> clientConfig({
    required String version,
    required String platform,
    String? architecture,
    String core = 'sing-box',
  }) {
    requested.complete();
    return response.future;
  }
}

class _Setup extends SetupAction {
  final starts = <bool>[];
  @override
  void build() {}
  @override
  Future<bool> setRunning(bool running, {bool initialize = false}) async {
    starts.add(running);
    return true;
  }
}

void main() {
  late Directory root;
  late Uint8List configuration;
  late V2BoardProfile profile;
  late WidgetRef widgetRef;
  late ProviderContainer container;
  late _Core core;
  late _Setup setup;

  setUpAll(() async {
    root = Directory.systemTemp.createTempSync('profile_lifecycle_');
    PathProviderPlatform.instance = _Paths(root.path);
    await Future.wait([
      appPath.dataDir.future,
      appPath.tempDir.future,
      appPath.cacheDir.future,
    ]);
    globalState.packageInfo = PackageInfo(
      appName: 'FastAI',
      packageName: 'test',
      version: '1.0.0',
      buildNumber: '1',
    );
    final fixture =
        jsonDecode(File('core/testdata/fastai-singbox.json').readAsStringSync())
            as Map;
    configuration = Uint8List.fromList(
      utf8.encode(
        jsonEncode({
          'data': {
            'core': 'sing-box',
            'configVersion': '3',
            'configuration': fixture['configuration'],
            'nodes': [],
          },
        }),
      ),
    );
  });
  tearDownAll(() => root.deleteSync(recursive: true));

  Future<void> mount(WidgetTester tester) async {
    core = _Core();
    setup = _Setup();
    when(() => core.singboxFeatures()).thenAnswer((_) async => []);
    when(() => core.validateConfig(any())).thenAnswer((_) async => '');
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          coreHandlerProvider.overrideWithValue(core),
          setupActionProvider.overrideWith(() => setup),
          profilesProvider.overrideWith(() => TestProfiles()),
        ],
        child: Consumer(
          builder: (context, ref, _) {
            widgetRef = ref;
            profile = V2BoardProfile(ref);
            container = ProviderScope.containerOf(context);
            return const SizedBox();
          },
        ),
      ),
    );
  }

  testWidgets('logout does not wait for a download or allow a late connect', (
    tester,
  ) async {
    await mount(tester);
    final api = _Api();
    addTearDown(api.close);
    final connecting = profile.connect(api);
    await api.requested.future;
    await profile.clear();
    api.response.complete(configuration);
    await connecting;
    expect(setup.starts, [false]);
    expect(container.read(profilesProvider), isEmpty);
    expect(container.read(v2BoardAccessProvider), isFalse);
    verifyNever(() => core.validateConfig(any()));
  });

  testWidgets(
    'unmount during capability lookup does not access disposed providers',
    (tester) async {
      await mount(tester);
      final features = Completer<List<String>>();
      when(() => core.singboxFeatures()).thenAnswer((_) => features.future);
      final api = _Api();
      addTearDown(api.close);
      final connecting = profile.connect(api);
      await tester.pumpWidget(const SizedBox());
      features.complete([]);
      await connecting;
      expect(api.requested.isCompleted, isFalse);
      expect(setup.starts, isEmpty);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('clear during native validation cleans unpublished files', (
    tester,
  ) async {
    await mount(tester);
    await tester.runAsync(() async {
      profile = V2BoardProfile(widgetRef);
      final entered = Completer<String>();
      final validation = Completer<String>();
      when(() => core.validateConfig(any())).thenAnswer((call) {
        entered.complete(call.positionalArguments.single as String);
        return validation.future;
      });
      final api = _Api();
      addTearDown(api.close);
      final syncing = profile.sync(api, apply: false);
      await api.requested.future;
      api.response.complete(configuration);
      final stagingPath = await Future.any([
        entered.future,
        syncing.then<String>(
          (_) => throw StateError('sync ended before validation'),
        ),
      ]).timeout(const Duration(seconds: 10));
      final clearing = profile.clear();
      validation.complete('');
      await Future.wait([syncing, clearing]);
      expect(await File(stagingPath).parent.exists(), isFalse);
      expect(root.listSync(recursive: true).whereType<File>(), isEmpty);
      expect(container.read(profilesProvider), isEmpty);
      expect(container.read(v2BoardAccessProvider), isFalse);
      expect(setup.starts, [false]);
      when(() => core.validateConfig(any())).thenAnswer((_) async => '');
      final fresh = _Api();
      addTearDown(fresh.close);
      final retry = profile.sync(fresh, apply: false);
      await fresh.requested.future;
      fresh.response.complete(configuration);
      await retry;
      expect(container.read(profilesProvider), hasLength(1));
      expect(container.read(v2BoardAccessProvider), isTrue);
    });
  });

  testWidgets('newer sync supersedes an older response before validation', (
    tester,
  ) async {
    await mount(tester);
    final oldApi = _Api();
    final newApi = _Api();
    addTearDown(oldApi.close);
    addTearDown(newApi.close);
    final oldSync = profile.sync(oldApi, apply: false);
    await oldApi.requested.future;
    final newSync = profile.sync(newApi, apply: false);
    await newApi.requested.future;
    oldApi.response.complete(configuration);
    await oldSync;
    verifyNever(() => core.validateConfig(any()));
    profile.invalidate();
    newApi.response.complete(configuration);
    await newSync;
    expect(container.read(profilesProvider), isEmpty);
  });
}
