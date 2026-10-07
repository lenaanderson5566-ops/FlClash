import 'dart:async';
import 'dart:convert';
import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/common/common.dart';
import 'package:fastai/common/theme.dart';
import 'package:fastai/state.dart';
import 'package:fastai/v2board/update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:typed_data';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/providers.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/access.dart';
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
  bool available;
  Completer<V10Object>? pendingAccount;
  Completer<Uint8List>? pendingConfig;
  V10Object subscription = {};
  V10Object resets = {
    'available': 0,
    'canReset': false,
    'disabledReason': 'reset_no_credit',
  };
  int resetPosts = 0;
  int accountGets = 0;

  @override
  Future<Uint8List> clientConfig({
    required String version,
    required String platform,
    String? architecture,
  }) async {
    if (pendingConfig != null) return pendingConfig!.future;
    throw const V2BoardProblem('subscription_failed');
  }

  @override
  Future<V10Object> object(
    String method,
    String path, {
    V10Object? body,
  }) async {
    if (path == '/me') accountGets++;
    if (path == '/me' && pendingAccount != null) return pendingAccount!.future;
    if (path == '/me/usage-resets') return resets;
    if (path == '/me/usage-resets/consumptions') {
      resetPosts++;
      resets = {
        'available': 0,
        'canReset': false,
        'disabledReason': 'reset_empty',
      };
      subscription = {
        ...subscription,
        'uploadedBytes': 0,
        'downloadedBytes': 0,
      };
      return {'outcome': 'reset'};
    }
    return path == '/me'
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
            ...subscription,
          };
  }
}

class _Probes extends ProxiesAction {
  int calls = 0;
  @override
  void build() {}
  @override
  Future<void> delayTest(List<Proxy> proxies, [String? testUrl]) async {
    calls++;
  }
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
    Locale locale = const Locale('en'),
    _Probes? probes,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          if (probes != null) ...[
            proxiesActionProvider.overrideWith(() => probes),
            safeModeProvider.overrideWithValue(true),
            coreStatusProvider.overrideWithBuild(
              (_, _) => CoreStatus.connected,
            ),
            appVisibleProvider.overrideWithBuild((_, _) => true),
            groupsProvider.overrideWithBuild(
              (_, _) => const [
                Group(
                  name: 'FastAI',
                  type: GroupType.Selector,
                  all: [Proxy(name: 'node_1', type: 'Vless')],
                ),
              ],
            ),
          ],
          setupActionProvider.overrideWith(_Setup.new),
          fastaiReleaseProvider.overrideWith(() => _Release(release)),
          profilesProvider.overrideWith(() => TestProfiles([])),
          viewSizeProvider.overrideWithBuild(
            (_, _) => tester.view.physicalSize / tester.view.devicePixelRatio,
          ),
          runTimeProvider.overrideWithBuild((_, _) => null),
        ],
        child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          builder: (context, child) {
            globalState.measure = Measure.of(context, 1);
            globalState.theme = CommonTheme.of(context, 1);
            return child!;
          },
          theme: ThemeData(brightness: Brightness.dark),
          locale: locale,
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

  testWidgets(
    'safe-mode routes probe automatically without one-minute repeats',
    (tester) async {
      final probes = _Probes();
      await show(tester, null, probes: probes);
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();
      expect(probes.calls, 1);
      await tester.pump(const Duration(minutes: 1));
      expect(probes.calls, 1);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('automatic probes wait for an existing manual probe to finish', (
    tester,
  ) async {
    final probes = _Probes();
    await show(tester, null, probes: probes);
    final container = ProviderScope.containerOf(
      tester.element(find.byType(V2BoardShell)),
    );
    final pending = container.read(pendingDelayTestsProvider.notifier);
    pending.apply(acquired: ['manual-probe']);
    await tester.pump(const Duration(seconds: 1));
    expect(probes.calls, 0);
    pending.apply(released: ['manual-probe']);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    expect(probes.calls, 1);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('account polling waits five minutes instead of one', (
    tester,
  ) async {
    final api = _Api(false);
    await show(tester, api);
    expect(api.accountGets, 1);
    await tester.pump(const Duration(minutes: 1));
    await tester.pumpAndSettle();
    expect(api.accountGets, 1);
    await tester.pump(const Duration(minutes: 4));
    await tester.pumpAndSettle();
    expect(api.accountGets, 2);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'desktop account lives at the bottom and keeps its avatar when collapsed',
    (tester) async {
      await show(tester, _Api(false), desktopLayout: true);
      final entry = find.byKey(const ValueKey('sidebar-account'));
      expect(
        tester
            .widget<NavigationRail>(find.byType(NavigationRail))
            .trailingAtBottom,
        isTrue,
      );
      expect(find.text('T'), findsOneWidget);
      expect(
        find.descendant(of: entry, matching: find.text('te***@example.com')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: entry, matching: find.text('test@example.com')),
        findsNothing,
      );
      expect(find.byTooltip('test@example.com'), findsNothing);

      expect(
        tester.getCenter(entry).dy,
        greaterThan(
          tester.view.physicalSize.height / tester.view.devicePixelRatio * 0.7,
        ),
      );
      await tester.tap(find.byKey(const ValueKey('sidebar-toggle')));
      await tester.pumpAndSettle();
      expect(find.text('T'), findsOneWidget);
      await tester.tap(entry);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ListView),
          matching: find.text('test@example.com'),
        ),
        findsOneWidget,
      );
      expect(
        tester
            .widget<NavigationRail>(find.byType(NavigationRail))
            .selectedIndex,
        isNull,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );

  for (final locale in AppLocalizations.delegate.supportedLocales) {
    testWidgets('account layout fits a narrow window in $locale', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(420, 720);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.3;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await show(tester, _Api(false), locale: locale, desktopLayout: true);
      await tester.tap(find.byKey(const ValueKey('sidebar-account')));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ListView),
          matching: find.text('test@example.com'),
        ),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets(
    'background account refresh does not block navigation or show global errors',
    (tester) async {
      final api = _Api(false);
      await show(tester, api, desktopLayout: true);
      api.pendingAccount = Completer<V10Object>();
      await tester.pump(const Duration(minutes: 5));
      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(
        tester
            .widget<NavigationRail>(find.byType(NavigationRail))
            .onDestinationSelected,
        isNotNull,
      );
      await tester.tap(find.text('Account'));
      await tester.pumpAndSettle();
      api.pendingAccount!.completeError(const V2BoardProblem('network_error'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Unable to reach the panel. Check your network and try again.',
        ),
        findsNothing,
      );
      await tester.scrollUntilVisible(
        find.text(
          'Account information could not be refreshed. Connect will check your account again.',
        ),
        180,
        scrollable: find.byType(Scrollable).first,
      );
      expect(
        find.text(
          'Account information could not be refreshed. Connect will check your account again.',
        ),
        findsOneWidget,
      );
      api.pendingAccount = null;
      await tester.scrollUntilVisible(
        find.byTooltip('Refresh'),
        -180,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Refresh'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Account information could not be refreshed. Connect will check your account again.',
        ),
        findsNothing,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets(
    'invalid config provides support rather than asking for another node',
    (tester) async {
      final api = _Api(true);
      await show(tester, api, desktopLayout: true);
      api.pendingConfig = Completer<Uint8List>();
      await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
      await tester.pump();
      api.pendingConfig!.completeError(
        const V2BoardProblem('invalid_response', requestId: 'req-config-123'),
      );
      await tester.pumpAndSettle();
      expect(
        find.textContaining('The server returned an invalid configuration.'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Reference ID: req-config-123'),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(TextButton, 'Manage on website'),
        findsOneWidget,
      );
      expect(find.widgetWithText(TextButton, 'Choose a route'), findsNothing);
      expect(find.text('Enter an HTTPS domain without a path'), findsNothing);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets(
    'client disabled preserves account access but revokes connection access',
    (tester) async {
      final api = _Api(true);
      await show(tester, api, desktopLayout: true);
      api.pendingConfig = Completer<Uint8List>();
      await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
      await tester.pump();
      api.pendingConfig!.completeError(
        const V2BoardProblem('CLIENT_DISABLED', status: 403),
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          'FastAI is temporarily unavailable. Contact support on the website.',
        ),
        findsOneWidget,
      );
      final container = ProviderScope.containerOf(
        tester.element(find.byType(V2BoardShell)),
      );
      expect(container.read(v2BoardAccessProvider), isFalse);
      await tester.tap(find.text('Account'));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ListView),
          matching: find.text('test@example.com'),
        ),
        findsOneWidget,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets(
    'invalid YAML and encoding failures never report an invalid website URL',
    (tester) async {
      for (final bytes in [
        Uint8List.fromList([0xff, 0xfe]),
        Uint8List.fromList(utf8.encode('proxies: [broken')),
        Uint8List.fromList(utf8.encode('proxies: wrong\nproxy-groups: []\n')),
      ]) {
        final api = _Api(true);
        await show(tester, api, desktopLayout: true);
        api.pendingConfig = Completer<Uint8List>();
        await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
        await tester.pump();
        api.pendingConfig!.complete(bytes);
        await tester.pumpAndSettle();
        expect(
          find.text(
            'The server returned an invalid configuration. Sync again or contact support.',
          ),
          findsOneWidget,
        );
        expect(find.text('Enter an HTTPS domain without a path'), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox.shrink());
      }
    },
  );

  testWidgets(
    'account separates independent traffic and confirms a reset before submitting',
    (tester) async {
      final api = _Api(true)
        ..subscription = {
          'quotaBytes': 1073741824 * 10,
          'uploadedBytes': 1073741824 * 2,
          'creditBytes': 1073741824 * 5,
          'resetAt': '2026-11-01T00:00:00Z',
        }
        ..resets = {'available': 1, 'canReset': true};
      await show(tester, api, desktopLayout: true);
      await tester.tap(find.text('Account'));
      await tester.pumpAndSettle();
      expect(find.text('Independent traffic remaining'), findsOneWidget);
      expect(find.text('5.00 GB'), findsOneWidget);
      expect(find.text('8.00 GB'), findsOneWidget);
      expect(
        find.textContaining('Next automatic reset (local time)'),
        findsOneWidget,
      );
      await tester.scrollUntilVisible(
        find.widgetWithText(OutlinedButton, 'Use one reset'),
        180,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(OutlinedButton, 'Use one reset'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Use one available reset to clear your current period usage? Independent traffic, your plan and subscription expiry will remain unchanged.',
        ),
        findsOneWidget,
      );
      expect(api.resetPosts, 0);
      await tester.tap(find.widgetWithText(TextButton, 'Use one reset'));
      await tester.pumpAndSettle();
      expect(api.resetPosts, 1);
      expect(api.subscription['creditBytes'], 1073741824 * 5);
      expect(find.text('10.00 GB'), findsOneWidget);
      expect(find.textContaining('0.00 GB / 10.00 GB'), findsOneWidget);
      expect(
        tester
            .widget<OutlinedButton>(
              find.widgetWithText(OutlinedButton, 'Use one reset'),
            )
            .onPressed,
        isNull,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('connection shows sync progress and provides recovery actions', (
    tester,
  ) async {
    final api = _Api(true);
    await show(tester, api, desktopLayout: true);
    api.pendingConfig = Completer<Uint8List>();
    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Syncing routes…'), findsWidgets);
    final button = tester.widget<FilledButton>(find.byType(FilledButton).first);
    expect(button.onPressed, isNull);
    api.pendingConfig!.completeError(const V2BoardProblem('connection_failed'));
    await tester.pumpAndSettle();
    expect(
      find.text('Connection failed. Retry or choose another route.'),
      findsOneWidget,
    );
    expect(find.widgetWithText(TextButton, 'Retry'), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Choose a route'), findsOneWidget);
    expect(find.text('Syncing routes…'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
  testWidgets('login shows fastai with only email and password fields', (
    tester,
  ) async {
    await show(tester, null);
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
    await tester.pumpAndSettle();
    expect(find.text('FastAI'), findsOneWidget);
    final theme = Theme.of(tester.element(find.byType(TextFormField).first));
    expect(theme.brightness, Brightness.light);
    expect(theme.colorScheme.primary, const Color(0xFF153B70));
    expect(theme.scaffoldBackgroundColor, Colors.white);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
    'login supports password visibility, next focus and email validation',
    (tester) async {
      await show(tester, null);
      await tester.tap(find.widgetWithText(FilledButton, 'Connect'));
      await tester.pumpAndSettle();
      final fields = find.byType(TextFormField);
      await tester.enterText(fields.first, 'invalid-email');
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();
      expect(
        tester
            .widget<EditableText>(find.byType(EditableText).last)
            .focusNode
            .hasFocus,
        isTrue,
      );
      await tester.enterText(fields.last, 'example-password');
      expect(
        tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
        isTrue,
      );
      await tester.ensureVisible(find.byTooltip('Show password'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(
        tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
        isFalse,
      );
      await tester.tap(find.byTooltip('Hide password'));
      await tester.pump();
      await tester.ensureVisible(find.widgetWithText(FilledButton, 'Sign in'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
      await tester.pumpAndSettle();
      expect(find.text('Enter a valid email address'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );

  testWidgets('desktop guests browse navigation and sign in only to connect', (
    tester,
  ) async {
    await show(tester, null, desktopLayout: true);
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(AppBar), findsNothing);
    final rail = tester.widget<NavigationRail>(find.byType(NavigationRail));
    expect(rail.destinations.map((item) => (item.label as Text).data), [
      'Home',
      'Connection',
      'Settings',
      'About',
    ]);
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
    expect(find.text('System proxy'), findsOneWidget);
    await tester.tap(find.text('Connection').first);
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNWidgets(2));
    await tester.tap(find.text('Home').first);
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('General'), findsNothing);
    expect(find.text('System proxy'), findsNothing);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Backup and Restore'), findsNothing);
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('FastAI'), findsWidgets);
    expect(find.text('Check for updates'), findsOneWidget);
    expect(find.text('Auto check for updates'), findsOneWidget);
    expect(find.byType(TextFormField), findsNothing);
    await tester.tap(find.text('Home').first);
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

  for (final locale in const [
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
    Locale('vi'),
    Locale('ru'),
    Locale('fa'),
  ]) {
    testWidgets('login fits a narrow window in $locale', (tester) async {
      tester.view.physicalSize = const Size(360, 700);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.4;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await show(tester, null, locale: locale);
      await tester.tap(find.byType(NavigationDestination).at(3));
      await tester.pumpAndSettle();
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }

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

  testWidgets('account keeps website services without duplicating settings', (
    tester,
  ) async {
    await show(tester, _Api(true));
    await tester.tap(find.byType(NavigationDestination).at(3));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(ListView),
        matching: find.text('test@example.com'),
      ),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Manage on website'),
      180,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Manage on website'), findsOneWidget);
    expect(find.text('Support and account services'), findsNothing);
    expect(find.widgetWithText(ListTile, 'Settings'), findsNothing);
    await tester.tap(find.byType(NavigationDestination).at(4));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Official website'),
      120,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Official website'), findsOneWidget);
    expect(find.text('Manage on website'), findsNothing);
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
    await tester.tap(find.byType(NavigationDestination).at(3));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Manage on website'),
      160,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.scrollUntilVisible(
      find.text('Manage on website'),
      180,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Manage on website'), findsOneWidget);
    await tester.tap(find.byType(NavigationDestination).at(1));
    await tester.pumpAndSettle();
    expect(
      find.text('No routes are available. Check your account on the website.'),
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
        find.byType(DropdownButton<Mode>),
        120,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.byType(DropdownButton<Mode>), findsOneWidget);
      expect(find.byType(NavigationDestination), findsNWidgets(5));
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
}
