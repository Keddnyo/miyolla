import 'package:flutter/material.dart';

import 'firmware_controller.dart';

class FirmwareProvider extends InheritedNotifier {
  const FirmwareProvider({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(
          key: key,
          notifier: controller,
          child: child,
        );

  final FirmwareController controller;

  static FirmwareController? getController(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<FirmwareProvider>()!
      .controller;
}
