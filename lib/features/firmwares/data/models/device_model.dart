import '../../domain/entities/device.dart';
import 'firmware_model.dart';

class DeviceModel {
  DeviceModel({required this.name, required this.firmwareModelList});

  final String name;
  final List<FirmwareModel> firmwareModelList;

  Device toDevice() {
    var firmwareList = firmwareModelList
        .map(
          (model) => model.toFirmware(),
        )
        .toList();

    return Device(name, firmwareList: firmwareList);
  }

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    List<dynamic> firmwares = json['firmwares'];

    var firmwareModelList = firmwares
        .map((firmware) => FirmwareModel.fromJson(firmware))
        .toList();

    return DeviceModel(name: name, firmwareModelList: firmwareModelList);
  }
}
