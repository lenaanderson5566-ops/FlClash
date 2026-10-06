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
}
