import '../repositories/download_manager_repository.dart';

class DownloadFile {
  DownloadFile(this.repository);

  final DownloadManagerRepository repository;

  void call(String url, {String? fileName}) =>
      repository.downloadFile(url, fileName: fileName);
}
