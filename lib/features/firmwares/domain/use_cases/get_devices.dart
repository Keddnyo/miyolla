import '../entities/device.dart';
import '../repositories/firmware_repository.dart';

class GetDevices {
  GetDevices(this.repository);

  final FirmwareRepository repository;

  Future<List<Device>> call({required String api}) =>
      repository.getDevices(api: api);
}
