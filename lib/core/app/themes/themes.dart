import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class Themes {
  static const Color _lightColor = Colors.indigo;
  static const Color _darkColor = Colors.green;

  static final theme = FlexColorScheme.light(
    lightIsWhite: true,
    useMaterial3: true,
    primary: _lightColor,
    primaryContainer: _lightColor,
    secondaryContainer: _lightColor,
  ).toTheme;

  static final darkTheme = FlexColorScheme.dark(
    darkIsTrueBlack: true,
    useMaterial3: true,
    primary: _darkColor,
    primaryContainer: _darkColor,
    secondaryContainer: _darkColor,
  ).toTheme;
}
