import 'dart:io';

import 'package:android_download_manager/android_download_manager.dart';
import 'package:miyolla/src/app/model/downloader/download_file_type.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants.dart';

class DownloadManager {
  static void downloadFile(
    String url,
    String deviceName,
    DownloadFileType filetype,
  ) async {
    if (Platform.isAndroid) {
      String fileName = url.split('/').last;

      await AndroidDownloadManager.enqueue(
        downloadUrl: url,
        downloadPath:
            "/sdcard/Download/${Constants.appName}/${filetype.title}/$deviceName",
        fileName: fileName,
      );
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
