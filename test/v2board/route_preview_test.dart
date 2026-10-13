import 'package:fastai/common/common.dart';
import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/v2board/api.dart';
import 'package:fastai/v2board/route_preview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

class _Api extends V2BoardApi {
  _Api() : super('https://panel.example');
  int calls = 0;
  bool fail = false;
  List<V10Object> nodes = [
    {
      'nodeId': 'v2node_1',
      'proxyName': 'node_v2node_1',
      'name': 'Preview route',
      'tags': [],
      'displayNames': {},
    },
  ];

  @override
  Future<List<V10Object>> list(String path, {int page = 1}) async {
    expect(path, '/me/node-previews');
    calls++;
    if (fail) throw const V2BoardProblem('network_error');
    return nodes;
  }
}

void main() {
  Future<void> show(
    WidgetTester tester,
    _Api api, {
    Future<void> Function()? onRefresh,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        locale: const Locale('en'),
        home: Scaffold(
          body: FastaiRoutePreview(
            api: api,
            notice: const Text('Subscription expired'),
            onRefresh: onRefresh ?? () async {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'preview shows disabled routes without connect or latency actions',
    (tester) async {
      final api = _Api();
      addTearDown(api.close);
      await show(tester, api);
      expect(find.text('Preview route'), findsOneWidget);
      expect(find.text('Subscription expired'), findsOneWidget);
      final row = tester.widget<ListTile>(find.byType(ListTile));
      expect(row.enabled, isFalse);
      expect(row.onTap, isNull);
      expect(find.byType(FilledButton), findsNothing);
      expect(find.byType(IconButton), findsOneWidget);
      expect(api.calls, 1);
    },
  );

  testWidgets('preview accepts nodes with null tags from the server', (
    tester,
  ) async {
    final api = _Api();
    api.nodes.add({
      'nodeId': 'v2node_2',
      'proxyName': 'node_v2node_2',
      'name': 'Route without tags',
      'tags': null,
      'displayNames': {},
    });
    addTearDown(api.close);
    await show(tester, api);
    expect(find.text('Preview route'), findsOneWidget);
    expect(find.text('Route without tags'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('preview request failure can retry without an upsell', (
    tester,
  ) async {
    final api = _Api()..fail = true;
    addTearDown(api.close);
    await show(tester, api);
    final l = tester.element(find.byType(FastaiRoutePreview)).appLocalizations;
    expect(find.text(l.fdSyncFailed), findsOneWidget);
    api.fail = false;
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.text('Preview route'), findsOneWidget);
    expect(find.text(l.fdSyncFailed), findsNothing);
    expect(api.calls, 2);
  });

  testWidgets('account refresh failure releases the preview refresh button', (
    tester,
  ) async {
    final api = _Api();
    addTearDown(api.close);
    await show(
      tester,
      api,
      onRefresh: () async => throw const V2BoardProblem('network_error'),
    );
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(
      tester.widget<IconButton>(find.byType(IconButton)).onPressed,
      isNotNull,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'empty preview explains missing routes without blaming entitlement',
    (tester) async {
      final api = _Api()..nodes = [];
      addTearDown(api.close);
      await show(tester, api);
      final l = tester
          .element(find.byType(FastaiRoutePreview))
          .appLocalizations;
      expect(find.text(l.fdRoutesEmpty), findsOneWidget);
      expect(find.text(l.fdNodesUnavailable), findsNothing);
    },
  );
}
