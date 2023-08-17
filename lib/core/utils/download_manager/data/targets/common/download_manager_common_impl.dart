import '../../../../../../shared/utils/open_url.dart';
import 'download_manager_common.dart';

class DownloadManagerCommonImpl implements DownloadManagerCommon {
  @override
  void downloadFile(String url) => openUrl(url);
}
