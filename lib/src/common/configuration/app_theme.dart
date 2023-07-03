import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class MiYollaTheme {
  static final ThemeData light = FlexColorScheme.light(
    lightIsWhite: true,
    useMaterial3: true,
    primary: Colors.indigo,
    primaryContainer: Colors.indigo,
    secondaryContainer: Colors.indigo,
  ).toTheme;

  static final ThemeData dark = FlexColorScheme.dark(
    darkIsTrueBlack: true,
    useMaterial3: true,
    primary: Colors.pink,
    primaryContainer: Colors.pink,
    secondaryContainer: Colors.pink,
  ).toTheme;
}
