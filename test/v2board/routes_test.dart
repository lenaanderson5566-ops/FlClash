import 'package:flutter/services.dart';
import 'package:fastai/v2board/node_metadata.dart';
import 'package:fastai/v2board/routes.dart';
import 'package:fastai/models/models.dart';
import 'package:fastai/enum/enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fastai/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import '../helpers/test_app.dart';
import '../helpers/test_profiles.dart';

void main() {
  test('route selection exposes real nodes while retaining engine groups', () {
    const root = Group(
      name: 'FastDog',
      type: GroupType.Selector,
      all: [
        Proxy(name: 'DIRECT', type: 'Direct'),
        Proxy(name: 'REJECT', type: 'Reject'),
        Proxy(name: 'Automatic', type: 'URLTest'),
        Proxy(name: 'Fallback', type: 'Fallback'),
        Proxy(name: 'Tokyo', type: 'AnyTLS'),
        Proxy(name: 'Seoul', type: 'Vless'),
      ],
    );
    const groups = [
      Group(name: 'GLOBAL', type: GroupType.Selector),
      root,
      Group(name: 'Automatic', type: GroupType.URLTest),
      Group(name: 'Fallback', type: GroupType.Fallback),
    ];
    expect(primaryRouteGroup(groups), root);
    expect(selectableRoutes(root, groups).map((p) => p.name), [
      'Tokyo',
      'Seoul',
    ]);
    expect(groups.first.name, 'GLOBAL');
  });
  test('configuration without a selectable managed group has no root', () {
    expect(
      primaryRouteGroup([
        const Group(name: 'GLOBAL', type: GroupType.Selector),
      ]),
      isNull,
    );
  });
  testWidgets(
    'nodes retain subscription order without region filters or pinning',
    (tester) async {
      final container = ProviderContainer(
        overrides: [
          profilesProvider.overrideWith(() => TestProfiles([])),
          groupsProvider.overrideWithBuild(
            (_, _) => const [
              Group(
                name: 'FastDog',
                type: GroupType.Selector,
                now: 'node_2',
                all: [
                  Proxy(name: 'node_1', type: 'Vless'),
                  Proxy(name: 'node_2', type: 'AnyTLS'),
                ],
              ),
            ],
          ),
          fastaiNodeMetadataProvider.overrideWith(
            (ref) async => {
              'node_1': {
                'regionCode': 'US',
                'displayNames': {'en-US': 'United States · San Jose'},
                'tags': ['Streaming'],
              },
              'node_2': {
                'regionCode': 'JP',
                'displayNames': {'en-US': 'Japan · Tokyo'},
                'tags': ['Low latency'],
              },
            },
          ),
        ],
      );
      addTearDown(container.dispose);
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: TestApp(
            child: Scaffold(body: FastaiRoutesView(onSync: () async {})),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Current route'), findsNothing);
      expect(find.byType(TextField), findsNothing);
      expect(find.byType(ChoiceChip), findsNothing);
      expect(find.text('Japan · Tokyo'), findsOneWidget);
      expect(find.text('United States · San Jose'), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('United States · San Jose')).dy,
        lessThan(tester.getTopLeft(find.text('Japan · Tokyo')).dy),
      );
      expect(find.byTooltip('Delay test'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
  testWidgets('route page shows nodes without engine labels', (tester) async {
    final container = ProviderContainer(
      overrides: [
        profilesProvider.overrideWith(() => TestProfiles([])),
        groupsProvider.overrideWithBuild(
          (_, _) => const [
            Group(name: 'GLOBAL', type: GroupType.Selector),
            Group(
              name: 'FastDog',
              type: GroupType.Selector,
              now: 'Auto',
              all: [
                Proxy(name: 'DIRECT', type: 'Direct'),
                Proxy(name: 'REJECT', type: 'Reject'),
                Proxy(name: 'Auto', type: 'URLTest'),
                Proxy(name: 'Tokyo', type: 'AnyTLS'),
              ],
            ),
            Group(name: 'Auto', type: GroupType.URLTest),
          ],
        ),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: TestApp(
          child: Scaffold(body: FastaiRoutesView(onSync: () async {})),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Automatic selection'), findsOneWidget);
    expect(find.text('Tokyo'), findsOneWidget);
    for (final label in [
      'GLOBAL',
      'DIRECT',
      'REJECT',
      'FastDog',
      'URLTest',
      'AnyTLS',
    ]) {
      expect(find.text(label), findsNothing);
    }
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
  testWidgets('Route page displays translated names, bundled flags and tags', (
    tester,
  ) async {
    const group = Group(
      name: 'FastDog',
      type: GroupType.Selector,
      all: [Proxy(name: 'node_v2node_123', type: 'Vless')],
    );
    final container = ProviderContainer(
      overrides: [
        profilesProvider.overrideWith(() => TestProfiles([])),
        groupsProvider.overrideWithBuild((_, _) => [group]),
        fastaiNodeMetadataProvider.overrideWith(
          (ref) async => {
            'node_v2node_123': {
              'name': 'Japan-A',
              'regionCode': 'JP',
              'tags': ['premium'],
              'displayNames': {
                'en-US': 'Japan · Tokyo · A',
                'zh-CN': '日本 · 东京 · A',
              },
            },
          },
        ),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: TestApp(
          locale: const Locale('zh', 'CN'),
          child: Scaffold(body: FastaiRoutesView(onSync: () async {})),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('日本 · 东京 · A'), findsOneWidget);
    expect(find.text('premium'), findsOneWidget);
    expect(find.text('node_v2node_123'), findsNothing);
    expect(
      find.descendant(
        of: find.byType(ListTile),
        matching: find.byType(NodeRegionFlag),
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
  test('TW SVG contains the Chinese flag', () async {
    expect(
      await rootBundle.loadString('assets/images/flags/tw.svg'),
      await rootBundle.loadString('assets/images/flags/cn.svg'),
    );
  });
  testWidgets('TW uses the bundled Chinese flag', (tester) async {
    final semantics = tester.ensureSemantics();
    try {
      await tester.pumpWidget(
        const TestApp(
          child: NodeRegionFlag(regionCode: 'TW', fallback: SizedBox()),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.bySemanticsLabel('CN'), findsOneWidget);
      expect(tester.takeException(), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      semantics.dispose();
    }
  });
}
