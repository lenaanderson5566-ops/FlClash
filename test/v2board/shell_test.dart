import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/common/common.dart';
import 'package:fastai/common/theme.dart';
import 'package:fastai/state.dart';
import 'package:fastai/v2board/update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:typed_data';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/session.dart';
import 'package:fastai/v2board/shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../helpers/test_profiles.dart';

class _Session extends V2BoardSession {
  const _Session(this.api);
  final V2BoardApi? api;

  @override
  Future<V2BoardApi?> restore() async => api;
}

class _Api extends V2BoardApi {
  _Api(this.available) : super('https://example.com');
  final bool available;

  @override
  Future<Uint8List> clientConfig({
    required String version,
    required String platform,
    String? architecture,
  }) async {
    throw const V2BoardProblem('subscription_failed');
  }

  @override
  Future<V10Object> object(
    String method,
    String path, {
    V10Object? body,
  }) async => path == '/me'
      ? {
          'email': 'test@example.com',
          'accountStatus': {
            'available': available,
            'state': available ? 'active' : 'new',
          },
        }
      : {
          'active': available,
          'plan': {'name': 'Test plan'},
        };
}

class _Setup extends SetupAction {
  @override
  void build() {}

  @override
  Future<bool> setRunning(bool running, {bool initialize = false}) async =>
      true;
}

class _Release extends FastaiReleaseState {
  _Release(this.initial);
  final FastaiRelease? initial;

  @override
  FastaiRelease? build() => initial;
  @override
  Future<FastaiRelease?> check({bool force = false}) async => state;
}

void main() {
  setUpAll(() {
    globalState.packageInfo = PackageInfo(
      appName: 'FastAI',
      packageName: 'ws.fastdog.fastai',
      version: '1.0.0',
      buildNumber: '2026100601',
    );
  });
  Future<void> show(
    WidgetTester tester,
    V2BoardApi? api, {
    FastaiRelease? release,
    bool desktopLayout = false,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          setupActionProvider.overrideWith(_Setup.new),
          fastaiReleaseProvider.overrideWith(() => _Release(release)),
          profilesProvider.overrideWith(() => TestProfiles([])),
          runTimeProvider.overrideWithBuild((_, _) => null),
        ],
        child: MaterialApp(
          builder: (context, child) {
            globalState.measure = Measure.of(context, 1);
            globalState.theme = CommonTheme.of(context, 1);
            return child!;
          },
          theme: ThemeData(brightness: Brightness.dark),
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          home: V2BoardShell(
            session: _Session(api),
            desktopLayout: desktopLayout,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('login shows fastai with only email and password fields', (
    tester,
  ) async {
    await show(tester, null);
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    expect(find.text('FastAI'), findsNWidgets(2));
    final theme = Theme.of(tester.element(find.byType(TextFormField).first));
    expect(theme.brightness, Brightness.light);
    expect(theme.colorScheme.primary, const Color(0xFF153B70));
    expect(theme.scaffoldBackgroundColor, Colors.white);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('desktop guests browse navigation and sign in only to connect', (
    tester,
  ) async {
    await show(tester, null, desktopLayout: true);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(
      tester.widget<NavigationRail>(find.byType(NavigationRail)).extended,
      isTrue,
    );
    await tester.tap(find.byKey(const ValueKey('sidebar-toggle')));
    await tester.pumpAndSettle();
    expect(
      tester.widget<NavigationRail>(find.byType(NavigationRail)).extended,
      isFalse,
    );
    await tester.tap(find.byKey(const ValueKey('sidebar-toggle')));
    await tester.pumpAndSettle();
    expect(
      tester.widget<NavigationRail>(find.byType(NavigationRail)).extended,
      isTrue,
    );
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byType(TextFormField), findsNothing);
    expect(find.widgetWithText(FilledButton, 'Connect'), findsOneWidget);
    await tester.tap(find.text('Proxies'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNWidgets(2));
    await tester.tap(find.text('Connection').first);
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Backup and Restore'), findsNothing);
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('FastAI'), findsWidgets);
    expect(find.text('Check for updates'), findsOneWidget);
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.text('Connection').first);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'mandatory update preserves account access and disables connection',
    (tester) async {
      await show(
        tester,
        _Api(true),
        release: FastaiRelease.fromJson({
          'latestVersion': '2.0.0',
          'latestBuild': 2,
          'minimumVersion': '2.0.0',
          'downloadUrl': 'https://fastdog.ws/download/FastAI.exe',
          'sha256': List.filled(64, 'a').join(),
        }),
      );
      expect(
        find.text('Update required to continue connecting'),
        findsOneWidget,
      );
      expect(
        tester
            .widget<FilledButton>(find.widgetWithText(FilledButton, 'Connect'))
            .onPressed,
        isNull,
      );
      expect(find.byType(NavigationDestination), findsNWidgets(5));
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('branded login fits a narrow window with larger text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 700);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 1.4;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await show(tester, null);
    await tester.ensureVisible(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('account keeps website services and settings easy to find', (
    tester,
  ) async {
    await show(tester, _Api(true));
    await tester.tap(find.byType(NavigationDestination).at(2));
    await tester.pumpAndSettle();
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('Manage on website'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.widgetWithText(ListTile, 'Settings'),
      120,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.widgetWithText(ListTile, 'Settings'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('unpaid account can sign in but cannot connect or see nodes', (
    tester,
  ) async {
    await show(tester, _Api(false));
    expect(find.byType(NavigationDestination), findsNWidgets(5));
    final connect = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Connect'),
    );
    expect(connect.onPressed, isNull);
    await tester.scrollUntilVisible(
      find.text('Manage on website'),
      160,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Manage on website'), findsOneWidget);
    await tester.tap(find.byType(NavigationDestination).at(1));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'No available subscription. Manage your account on the website.',
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'paid account exposes connect and functional modes without a shop tab',
    (tester) async {
      await show(tester, _Api(true));
      final connect = tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Connect'),
      );
      expect(connect.onPressed, isNotNull);
      await tester.scrollUntilVisible(
        find.byType(SegmentedButton<Mode>),
        120,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byType(SegmentedButton<Mode>), findsOneWidget);
      expect(find.byType(NavigationDestination), findsNWidgets(5));
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
}
