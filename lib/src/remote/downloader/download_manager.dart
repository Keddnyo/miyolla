import 'dart:io';

import 'package:android_download_manager/android_download_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants.dart';

class DownloadManager {
  static void downloadFirmware(
      {required url, required String deviceName}) async {
    if (Platform.isAndroid) {
      String fileName = url.split('/').last;

      await AndroidDownloadManager.enqueue(
        downloadUrl: url,
        downloadPath:
            "/sdcard/Download/${Constants.appName}/Firmwares/$deviceName",
        fileName: fileName,
      );
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  static void downloadDial({
    required url,
    required String deviceName,
    required String fileName,
  }) async {
    if (Platform.isAndroid) {
      await AndroidDownloadManager.enqueue(
        downloadUrl: url,
        downloadPath:
            "/sdcard/Download/${Constants.appName}/Dials/$deviceName.bin",
        fileName: fileName.replaceAll(' ', '_'),
      );
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
