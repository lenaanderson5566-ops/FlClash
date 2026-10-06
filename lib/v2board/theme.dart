import 'package:material_ui/material_ui.dart';

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
      surface: Colors.white,
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: const Color(0xFFF5F7FA),
      surfaceContainer: const Color(0xFFEEF2F7),
      surfaceContainerHigh: const Color(0xFFE8EDF4),
      surfaceContainerHighest: const Color(0xFFE0E7F0),
    );
