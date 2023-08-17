import 'package:android_download_manager/android_download_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'download_manager_android.dart';

class DownloadManagerAndroidImpl implements DownloadManagerAndroid {
  @override
  void downloadFile(String url, {String? fileName}) async {
    var appPath = await getExternalStorageDirectory().then((d) => d?.path);
    var storagePath = appPath?.substring(0, appPath.indexOf('/Android'));

    var defaultFileName = url.split('/').last;
    var fileExtension = url.split('.').last;

    await AndroidDownloadManager.enqueue(
      downloadUrl: url,
      downloadPath: '$storagePath/Download',
      fileName: fileName != null
          ? '${fileName.trim().replaceAll(' ', '_')}.$fileExtension'
          : defaultFileName,
    );
  }
}
