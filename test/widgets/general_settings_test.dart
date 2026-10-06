import 'package:fastai/providers/providers.dart';
import 'package:fastai/views/config/general.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import '../helpers/test_app.dart';

void main() {
  testWidgets('minimized startup depends on launch at startup', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const TestApp(
          child: SingleChildScrollView(
            child: GeneralSettings(isDesktop: true, isAndroid: false),
          ),
        ),
      ),
    );
    await tester.pump();
    final switches = find.byType(Switch);
    expect(tester.widget<Switch>(switches.at(1)).onChanged, isNull);
    container
        .read(appSettingProvider.notifier)
        .update((s) => s.copyWith(autoLaunch: true));
    await tester.pump();
    expect(tester.widget<Switch>(switches.at(1)).onChanged, isNotNull);
    await tester.tap(find.text('Start minimized'));
    await tester.pump();
    expect(container.read(appSettingProvider).silentLaunch, isTrue);
    await tester.tap(find.text('Auto launch'));
    await tester.pump();
    expect(container.read(appSettingProvider).autoLaunch, isFalse);
    expect(container.read(appSettingProvider).silentLaunch, isFalse);
    expect(find.text('On demand'), findsNothing);
  });

  testWidgets('Android groups background and notification settings', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TestApp(
          child: SingleChildScrollView(
            child: GeneralSettings(isDesktop: false, isAndroid: true),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Background and notifications'), findsOneWidget);
    expect(find.text('Start minimized'), findsNothing);
    expect(find.text('Keep running when the window is closed'), findsNothing);
  });
}
