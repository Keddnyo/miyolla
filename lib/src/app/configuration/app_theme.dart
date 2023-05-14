import 'package:flutter/material.dart';

import '../../common/constants.dart';

class MiYollaTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: Constants.useMaterial3,
  );

  static final ThemeData dark = ThemeData.dark(
    useMaterial3: Constants.useMaterial3,
  );
}
