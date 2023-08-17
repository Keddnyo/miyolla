import 'package:flutter/material.dart';

import '../../data/api/firmware_api.dart';
import '../../data/repositories/firmware_repository_impl.dart';
import '../../data/sources/remote/firmware_remote_data_source_impl.dart';
import '../../domain/entities/device.dart';
import '../../domain/use_cases/get_devices.dart';

class FirmwareController extends ChangeNotifier {
  Future<List<Device>> fetchData() async {
    var internalApi = FirmwareApi.internal;
    var externalApi = FirmwareApi.external;

    var remoteDataSource = FirmwareRemoteDataSourceImpl();
    var repository = FirmwareRepositoryImpl(remoteDataSource);

    var response = await GetDevices(repository)(api: internalApi);

    if (response.isEmpty) {
      response = await GetDevices(repository)(api: externalApi);
    }

    return response;
  }
}
