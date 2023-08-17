import 'package:url_launcher/url_launcher.dart';

openUrl(String url) async =>
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
