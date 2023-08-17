import 'firmware.dart';

class Device {
  Device(this.name, {required this.firmwareList});

  final String name;
  final List<Firmware> firmwareList;
}
