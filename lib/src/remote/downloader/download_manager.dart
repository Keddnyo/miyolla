import 'dart:io';

import 'package:android_download_manager/android_download_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/constants.dart';

class DownloadManager {
  static void downloadFirmware({
    required BuildContext context,
    required String url,
    required String deviceName,
  }) async {
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
    required BuildContext context,
    required String url,
    required String deviceName,
    required String fileName,
  }) async {
    if (Platform.isAndroid) {
      await AndroidDownloadManager.enqueue(
        downloadUrl: url,
        downloadPath: "/sdcard/Download/${Constants.appName}/Dials/$deviceName",
        fileName: '${fileName.replaceAll(' ', '_')}.bin',
      );
    } else {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
