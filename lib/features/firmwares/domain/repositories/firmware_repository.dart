import '../entities/device.dart';

abstract class FirmwareRepository {
  Future<List<Device>> getDevices({required String api});
}
