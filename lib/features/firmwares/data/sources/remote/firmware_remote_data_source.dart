import '../../../domain/entities/device.dart';

abstract class FirmwareRemoteDataSource {
  Future<List<Device>> getDevices({required String url});
}
