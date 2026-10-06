import 'package:fastai/enum/enum.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/providers/app.dart';
import 'package:fastai/providers/config.dart';
import 'package:fastai/providers/database.dart';
import 'package:fastai/providers/state.dart';
import 'package:fastai/state.dart';
import 'package:fastai/views/config/general.dart';
import 'package:fastai/views/config/on_demand.dart';
import 'package:fastai/views/proxies/list.dart';
import 'package:fastai/views/proxies/tab.dart';
import 'package:fastai/views/proxies/setting.dart';
import 'package:fastai/views/views.dart';
import 'package:fastai/views/diagnostics.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_app.dart';
import '../helpers/test_database_providers.dart';
import '../helpers/test_profiles.dart';

void main() {
  final cases = <String, Widget>{
    'dashboard': const DashboardView(),
    'proxies': const ProxiesView(),
    'profiles': const ProfilesView(),
    'logs': const LogsView(),
    'tools': const ToolsView(),
    'on demand config': const OnDemandView(),
    'access control': const AccessView(),
    'proxy filtering': const Material(child: ProxiesSetting()),
  };

  for (final entry in cases.entries) {
    testWidgets('${entry.key} renders its default state', (tester) async {
      tester.view.physicalSize = const Size(1400, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final container = ProviderContainer(
        overrides: [
          profilesProvider.overrideWith(TestProfiles.new),
          scriptsProvider.overrideWith(TestScripts.new),
          globalRulesProvider.overrideWith(TestGlobalRules.new),
        ],
      );
      addTearDown(container.dispose);
      globalState.container = container;

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: TestApp(child: entry.value),
        ),
      );
      await tester.pump();
      if (entry.key == 'proxy filtering') {
        expect(find.text('Style'), findsNothing);
        expect(find.text('Layout'), findsNothing);
        expect(find.text('Size'), findsNothing);
      }
      if (entry.key == 'tools') {
        expect(find.text('Backup and Restore'), findsNothing);
        expect(find.text('About'), findsNothing);
        expect(find.text('Advanced configuration'), findsNothing);
        expect(find.text('DNS queries'), findsNothing);
        expect(find.text('Recent requests'), findsNothing);
        expect(find.text('Network detection'), findsOneWidget);
        expect(find.text('General'), findsNothing);
        expect(find.byType(GeneralSettings), findsOneWidget);
        expect(find.text('System proxy'), findsNothing);
        expect(find.text('Auto check for updates'), findsOneWidget);
      }
      if (entry.key == 'access control') {
        await tester.pump(const Duration(milliseconds: 301));
      }
      final scrollables = find.byType(Scrollable);
      if (scrollables.evaluate().isNotEmpty) {
        for (var index = 0; index < 8; index++) {
          await tester.drag(scrollables.first, const Offset(0, -700));
          await tester.pump();
        }
      }

      expect(find.byWidget(entry.value), findsOneWidget);
      expect(tester.takeException(), null);

      await tester.pumpWidget(const SizedBox.shrink());
    });
  }

  final toolDestinations = <String, Type>{'Network detection': DiagnosticsView};

  for (final entry in toolDestinations.entries) {
    testWidgets('tools opens ${entry.key}', (tester) async {
      tester.view.physicalSize = const Size(1400, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final container = ProviderContainer(
        overrides: [profilesProvider.overrideWith(TestProfiles.new)],
      );
      addTearDown(container.dispose);
      globalState.container = container;
      container
          .read(viewSizeProvider.notifier)
          .update((_) => const Size(1400, 1000));

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const TestApp(child: ToolsView()),
        ),
      );
      await tester.pump();

      expect(find.text('Theme'), findsNothing);
      final target = find.text(entry.key);
      await tester.scrollUntilVisible(
        target,
        500,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(target);
      await tester.pumpAndSettle();

      expect(find.byType(entry.value), findsOneWidget);
      expect(tester.takeException(), null);
    });
  }

  testWidgets('proxies renders populated tab and list layouts', (tester) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final profile = Profile.normal().copyWith(
      currentGroupName: 'Selector',
      selectedMap: {'Selector': 'Proxy 1'},
      unfoldSet: {'Selector'},
    );
    final proxies = List.generate(
      24,
      (index) => Proxy(name: 'Proxy $index', type: 'Direct'),
    );
    final group = Group(
      name: 'Selector',
      type: GroupType.Selector,
      hidden: false,
      now: 'Proxy 1',
      all: proxies,
    );
    final container = ProviderContainer(
      overrides: [
        profilesProvider.overrideWith(() => TestProfiles([profile])),
        currentProfileIdProvider.overrideWithBuild((_, _) => profile.id),
        currentGroupsStateProvider.overrideWithValue(
          GroupsState(value: [group]),
        ),
        groupsProvider.overrideWithValue([group]),
      ],
    );
    addTearDown(container.dispose);
    globalState.container = container;
    container
        .read(viewSizeProvider.notifier)
        .update((_) => const Size(1400, 1000));

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const TestApp(child: ProxiesView()),
      ),
    );
    await tester.pump();

    expect(container.read(proxiesTabStateProvider).groups, [group]);
    expect(find.byType(ProxiesTabView), findsOneWidget);
    expect(find.byType(ProxyGroupView), findsOneWidget);

    container
        .read(proxiesStyleSettingProvider.notifier)
        .update((state) => state.copyWith(type: ProxiesType.list));
    await tester.pump();
    expect(find.byType(ProxiesListView), findsOneWidget);

    final scrollables = find.byType(Scrollable);
    for (var index = 0; index < 8; index++) {
      await tester.drag(
        scrollables.last,
        const Offset(0, -700),
        warnIfMissed: false,
      );
      await tester.pump();
    }
    expect(tester.takeException(), null);
  });
}
