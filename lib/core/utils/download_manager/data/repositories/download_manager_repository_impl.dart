import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../domain/repositories/download_manager_repository.dart';
import '../targets/android/download_manager_android.dart';
import '../targets/common/download_manager_common.dart';
import '../targets/web/download_manager_web.dart';

class DownloadManagerRepositoryImpl implements DownloadManagerRepository {
  DownloadManagerRepositoryImpl(
    this.downloadManagerCommon,
    this.downloadManagerWeb,
    this.downloadManagerAndroid,
  );

  final DownloadManagerCommon downloadManagerCommon;
  final DownloadManagerWeb downloadManagerWeb;
  final DownloadManagerAndroid downloadManagerAndroid;

  @override
  void downloadFile(String url, {String? fileName}) {
    if (kIsWeb) {
      downloadManagerWeb.downloadFile(url);
      return;
    }

    if (Platform.isAndroid) {
      downloadManagerAndroid.downloadFile(url, fileName: fileName);
      return;
    }

    downloadManagerCommon.downloadFile(url);
  }
}
