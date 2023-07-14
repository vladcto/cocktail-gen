import 'package:flutter/material.dart';

sealed class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      // Primary.
      primary: Color.fromRGBO(186, 195, 255, 1),
      onPrimary: Color.fromRGBO(22, 39, 122, 1),
      primaryContainer: Color.fromRGBO(48, 63, 145, 1),
      onPrimaryContainer: Color.fromRGBO(222, 224, 255, 1),
      // Secondary
      secondary: Color.fromRGBO(111, 219, 169, 1),
      secondaryContainer: Color.fromRGBO(0, 82, 54, 1),
      // Background
      background: Color.fromRGBO(27, 27, 27, 1),
      onBackground: Color.fromRGBO(228, 225, 230, 1),
      // Surface
      surface: Color.fromRGBO(27, 27, 31, 1),
      onSurface: Color.fromRGBO(228, 225, 230, 1),
      surfaceVariant: Color.fromRGBO(35, 36, 42, 1),
      onSurfaceVariant: Color.fromRGBO(199, 197, 208, 1),
    ),
  );
}
