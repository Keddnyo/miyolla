import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/entities/device.dart';
import '../../models/device_model.dart';
import 'firmware_remote_data_source.dart';

class FirmwareRemoteDataSourceImpl implements FirmwareRemoteDataSource {
  @override
  Future<List<Device>> getDevices({required String api}) async {
    var response = await http.get(Uri.parse(api));
    Map<String, dynamic> json = jsonDecode(response.body);
    var deviceList = json.values.toList();

    return deviceList
        .map((deviceJson) => DeviceModel.fromJson(deviceJson))
        .map((deviceModel) => deviceModel.toDevice())
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
  }
}
