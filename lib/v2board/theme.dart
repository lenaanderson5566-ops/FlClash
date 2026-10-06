import 'package:material_ui/material_ui.dart';
import 'package:fastai/common/shape.dart';

ColorScheme fastaiColorScheme() =>
    ColorScheme.fromSeed(
      seedColor: const Color(0xFF153B70),
      brightness: Brightness.light,
    ).copyWith(
      primary: const Color(0xFF153B70),
      onPrimary: Colors.white,
      primaryContainer: const Color(0xFFE8EFF8),
      onPrimaryContainer: const Color(0xFF102D55),
      secondary: const Color(0xFF153B70),
      onSurface: const Color(0xFF182638),
      onSurfaceVariant: const Color(0xFF687789),
      outline: const Color(0xFFBAC6D4),
      outlineVariant: const Color(0xFFE4EAF1),
      surface: Colors.white,
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: const Color(0xFFF5F7FA),
      surfaceContainer: const Color(0xFFEEF2F7),
      surfaceContainerHigh: const Color(0xFFE8EDF4),
      surfaceContainerHighest: const Color(0xFFE0E7F0),
    );

ThemeData fastaiTheme(ThemeData base) {
  final colors = fastaiColorScheme();
  final text = base.textTheme.apply(
    bodyColor: colors.onSurface,
    displayColor: colors.onSurface,
  );
  return base.copyWith(
    brightness: Brightness.light,
    colorScheme: colors,
    scaffoldBackgroundColor: Colors.white,
    textTheme: text.copyWith(
      headlineMedium: text.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.6,
      ),
      headlineSmall: text.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
      ),
      titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: Colors.white,
      foregroundColor: colors.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: base.cardTheme.copyWith(
      elevation: 0,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: AppShape.lg.copyWith(
        side: BorderSide(color: colors.outlineVariant),
      ),
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: colors.surfaceContainerLow,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: base.filledButtonTheme.style?.copyWith(
        minimumSize: const WidgetStatePropertyAll(Size(64, 44)),
      ),
    ),
    listTileTheme: base.listTileTheme.copyWith(
      iconColor: colors.onSurfaceVariant,
      textColor: colors.onSurface,
      selectedColor: colors.primary,
      selectedTileColor: colors.primaryContainer,
    ),
    dividerTheme: base.dividerTheme.copyWith(
      color: colors.outlineVariant,
      thickness: 1,
    ),
    navigationRailTheme: base.navigationRailTheme.copyWith(
      indicatorColor: colors.primaryContainer,
      selectedLabelTextStyle: text.labelLarge?.copyWith(
        color: colors.primary,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: text.labelLarge?.copyWith(
        color: colors.onSurfaceVariant,
      ),
    ),
  );
}
