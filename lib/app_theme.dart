import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(36, 161, 156, 1),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color.fromRGBO(147, 216, 213, 1),
  onSecondary: Color(0xFF000000),
  surface: Color.fromRGBO(246, 247, 249, 1),
  onSurface: Color.fromRGBO(27, 28, 31, 1),
  error: Color.fromRGBO(255, 72, 106, 1),
  onError: Color(0xFFFFFFFF),
  tertiary: Color.fromRGBO(23, 161, 161, 1),
  onTertiary: Color(0xFFFFFFFF),
  outline: Color.fromRGBO(254, 193, 136, 1),
);

final appThemeLightData = ThemeData(
  scaffoldBackgroundColor: lightColorScheme.onPrimary,
  useMaterial3: true,
  colorScheme: lightColorScheme,
);

// final ColorScheme colorSchemeDark = ColorScheme.fromSeed(
//   seedColor: const Color.fromRGBO(36, 161, 156, 1), // Основной цвет
//   brightness: Brightness.dark, // Светлая тема
// );

// final appThemeDarkData = ThemeData(
//   useMaterial3: true,
//   colorScheme: colorSchemeDark,
// );
