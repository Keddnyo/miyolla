import 'data/repositories/download_manager_repository_impl.dart';
import 'data/targets/android/download_manager_android_impl.dart';
import 'data/targets/common/download_manager_common_impl.dart';
import 'data/targets/web/download_manager_web_impl.dart';
import 'domain/use_cases/download_file.dart';

class DownloadManager {
  static void downloadFile(String url, {String? fileName}) async {
    var downloadManagerCommon = DownloadManagerCommonImpl();
    var downloadManagerWeb = DownloadManagerWebImpl();
    var downloadManagerAndroid = DownloadManagerAndroidImpl();
    var repository = DownloadManagerRepositoryImpl(
        downloadManagerCommon, downloadManagerWeb, downloadManagerAndroid);
    DownloadFile(repository)(url, fileName: fileName);
  }
}
