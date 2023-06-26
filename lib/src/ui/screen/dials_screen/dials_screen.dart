import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dial_model.dart';
import 'package:miyolla/src/ui/screen/dials_screen/device_list.dart';
import 'package:miyolla/src/ui/screen/dials_screen/target_device_dials.dart';

class DialsScreen extends StatelessWidget {
  const DialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return (args is DialModel)
        ? TargetDeviceDials(args)
        : const DialsDeviceList();
  }
}
