import '../../domain/entities/device.dart';
import '../../domain/repositories/firmware_repository.dart';
import '../sources/remote/firmware_remote_data_source.dart';

class FirmwareRepositoryImpl implements FirmwareRepository {
  FirmwareRepositoryImpl(this.remoteDataSource);

  final FirmwareRemoteDataSource remoteDataSource;

  @override
  Future<List<Device>> getDevices({required String api}) async {
    try {
      return await remoteDataSource.getDevices(api: api);
    } catch (e) {
      return [];
    }
  }
}
