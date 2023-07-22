import 'package:flutter/material.dart';

sealed class AppTheme {
  // TODO: Убрать повторения цветов.
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(186, 195, 255, 1),
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
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.black,
      elevation: 8,
      surfaceTintColor: Color.fromRGBO(27, 27, 31, 1),
    ),
  );

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(73, 88, 171, 1),
    cardColor: const Color.fromRGBO(236, 235, 239, 1),
    colorScheme: const ColorScheme.light(
      // Primary.
      primary: Color.fromRGBO(73, 88, 171, 1),
      onPrimary: Color.fromRGBO(255, 255, 255, 1),
      primaryContainer: Color.fromRGBO(222, 224, 255, 1),
      onPrimaryContainer: Color.fromRGBO(0, 16, 92, 1),
      // Secondary
      secondary: Color.fromRGBO(0, 108, 73, 1),
      secondaryContainer: Color.fromRGBO(114, 219, 170, 1),
      // Background
      background: Color.fromRGBO(254, 251, 255, 1),
      onBackground: Color.fromRGBO(27, 27, 31, 1),
      // Surface
      surface: Color.fromRGBO(235, 231, 235, 1),
      onSurface: Color.fromRGBO(27, 27, 31, 1),
      surfaceVariant: Color.fromRGBO(236, 235, 239, 1),
      onSurfaceVariant: Color.fromRGBO(70, 70, 79, 1),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.black,
      elevation: 8,
      surfaceTintColor: Color.fromRGBO(236, 235, 239, 1),
    ),
  );
}
