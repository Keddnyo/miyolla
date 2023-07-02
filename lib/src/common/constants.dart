import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'MiYolla';
  static const String appDescription = 'All-in-one tool for Huami wearables';
  static const String appDeveloper = 'Keddnyo';
}

class Dimens {
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(16.0));
}

class Styles {
  getRectangleBorder(BuildContext context) => RoundedRectangleBorder(
        side: BorderSide(
          width: 0.5,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        borderRadius: Dimens.borderRadius,
      );
}
