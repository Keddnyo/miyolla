import 'package:universal_html/html.dart' as html;

import 'download_manager_web.dart';

class DownloadManagerWebImpl implements DownloadManagerWeb {
  @override
  void downloadFile(String url) {
    var anchor = html.AnchorElement(href: url);
    anchor.download = url;
    anchor.click();
  }
}
