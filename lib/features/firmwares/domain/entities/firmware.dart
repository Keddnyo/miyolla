import 'package:flutter/material.dart';

class Firmware {
  Firmware({
    required this.firmwareVersion,
    required this.languages,
    required this.downloadUrl,
  });

  final String firmwareVersion, languages, downloadUrl;

  bool isSystemLocaleSupported(BuildContext context) {
    String systemLocale = Localizations.localeOf(context).languageCode;
    List<String>? localeList = languages.split(',');
    return localeList.any((locale) => locale.contains(systemLocale));
  }
}
