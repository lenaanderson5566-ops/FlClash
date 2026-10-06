import 'package:fastai/common/common.dart';
import 'package:fastai/common/theme.dart';
import 'package:fastai/core/controller.dart';
import 'package:fastai/core/interface.dart';
import 'package:fastai/enum/enum.dart';
import 'package:fastai/l10n/l10n.dart';
import 'package:fastai/providers/action.dart';
import 'package:fastai/providers/app.dart';
import 'package:fastai/providers/core.dart';
import 'package:fastai/state.dart';
import 'package:fastai/manager/status_manager.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCoreHandlerInterface extends Mock implements CoreHandlerInterface {}

Future<ProviderContainer> _pumpGeoResourceAction(
  WidgetTester tester,
  CoreHandlerInterface coreInterface,
) async {
  final container = ProviderContainer(
    overrides: [
      coreHandlerProvider.overrideWithValue(
        CoreController.scoped(coreInterface),
      ),
    ],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        navigatorKey: globalState.navigatorKey,
        localizationsDelegates: const [AppLocalizations.delegate],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        builder: (context, child) {
          globalState.measure = Measure.of(context, 1);
          globalState.theme = CommonTheme.of(context, 1);
          return StatusManager(child: child!);
        },
        home: const SizedBox(),
      ),
    ),
  );
  return container;
}

void main() {
  testWidgets('manual updates are blocked without calling the Core', (
    tester,
  ) async {
    final coreInterface = _MockCoreHandlerInterface();
    final container = await _pumpGeoResourceAction(tester, coreInterface);
    await expectLater(
      container
          .read(geoResourceActionProvider.notifier)
          .updateGeoResource(GeoResource.MMDB),
      throwsStateError,
    );
    verifyNever(() => coreInterface.updateGeoData(any()));
    expect(
      container.read(isUpdatingProvider(GeoResource.MMDB.updatingKey)),
      isFalse,
    );
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('passive updates change progress without surfacing messages', (
    tester,
  ) async {
    final coreInterface = _MockCoreHandlerInterface();
    final container = await _pumpGeoResourceAction(tester, coreInterface);
    final action = container.read(geoResourceActionProvider.notifier);
    final key = GeoResource.MMDB.updatingKey;
    final subscription = container.listen<bool>(
      isUpdatingProvider(key),
      (_, _) {},
    );
    addTearDown(subscription.close);

    action.handleCoreUpdate('MMDB', true, false, null);

    expect(container.read(isUpdatingProvider(key)), isTrue);

    action.handleCoreUpdate('MMDB', false, false, 'background failure');
    await tester.pump();

    expect(container.read(isUpdatingProvider(key)), isFalse);
    expect(find.text('background failure'), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
