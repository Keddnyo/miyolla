import 'package:flutter/material.dart';

import '../../../features/firmwares/domain/entities/device.dart';
import '../../../features/firmwares/ui/controllers/firmware_controller.dart';
import '../../../features/firmwares/ui/controllers/firmware_provider.dart';
import '../../../features/firmwares/ui/select_device_page.dart';
import '../../../features/firmwares/ui/select_firmware_page.dart';
import '../../ui/error_page.dart';

class AppNavigation {
  static const String deviceListRoute = '/devices';
  static const String firmwareListRoute = '/firmwares';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;

    switch (settings.name) {
      case AppNavigation.deviceListRoute:
        page = FirmwareProvider(
          controller: FirmwareController(),
          child: const SelectDevicePage(),
        );
        break;
      case AppNavigation.firmwareListRoute:
        page = SelectFirmwarePage(device: settings.arguments as Device);
        break;
      default:
        return null;
    }

    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (_) => const ErrorPage());
}
