import 'package:flutter/material.dart';

import '../../../features/firmwares/domain/entities/device.dart';
import '../../../features/firmwares/ui/select_device_page.dart';
import '../../../features/firmwares/ui/select_firmware_page.dart';
import '../../ui/error_page.dart';

class AppNavigation {
  static const String routeDevices = '/devices';
  static const String routeFirmwares = '/firmwares';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;

    switch (settings.name) {
      case AppNavigation.routeDevices:
        page = const SelectDevicePage();
        break;
      case AppNavigation.routeFirmwares:
        page = SelectFirmwarePage(device: settings.arguments as Device);
        break;
      default:
        return null;
    }

    // Disable swipe gestures for iOS PWA app
    Future<bool> onWillPop(BuildContext context) async =>
        !Navigator.of(context).userGestureInProgress;

    return MaterialPageRoute(
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () => onWillPop(context),
        child: page,
      ),
    );
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (_) => const ErrorPage());
}
