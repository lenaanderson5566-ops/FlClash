import 'package:fastai/views/config/general.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import '../helpers/test_app.dart';

void main() {
  testWidgets('desktop settings have no startup or window behavior controls', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TestApp(
          child: GeneralSettings(isDesktop: true, isAndroid: false),
        ),
      ),
    );
    expect(find.byType(Switch), findsNothing);
    expect(find.text('Auto launch'), findsNothing);
    expect(find.text('Start minimized'), findsNothing);
    expect(find.text('Connect automatically on startup'), findsNothing);
    expect(find.text('Keep running when the window is closed'), findsNothing);
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
