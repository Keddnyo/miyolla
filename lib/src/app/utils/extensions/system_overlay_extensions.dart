import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ColorizeSystemBars on BuildContext {
  SystemUiOverlayStyle get colorizeBars {
    var background = Theme.of(this).colorScheme.surface;
    var isDarkMode = MediaQuery.of(this).platformBrightness == Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: background,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    );
  }
}
