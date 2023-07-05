import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'MiYolla';
  static const String appDeveloper = 'Keddnyo';
}

class Dimens {
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(16.0));
}

class Styles {
  static RoundedRectangleBorder getOutlinedBorder(BuildContext context) => RoundedRectangleBorder(
    side: BorderSide(
      color: Theme.of(context).colorScheme.onBackground,
      width: 0.5,
    ),
    borderRadius: Dimens.borderRadius,
  );
}