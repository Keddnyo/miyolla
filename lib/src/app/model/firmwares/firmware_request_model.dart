class FirmwareRequestModel {
  FirmwareRequestModel({
    required this.deviceName,
    required this.deviceSource,
    required this.productionSource,
    required this.firmwareApp,
    this.firmwareLocale = FirmwareRequestLocale.en,
  });

  final String deviceName, deviceSource, productionSource;
  final FirmwareRequestApp firmwareApp;
  final FirmwareRequestLocale firmwareLocale;

  static List<FirmwareRequestModel> get list => [
        FirmwareRequestModel(
          deviceName: 'Mi Band 3i',
          deviceSource: '31',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
        ),
        FirmwareRequestModel(
          deviceName: 'Mi Band 4 GL',
          deviceSource: '25',
          productionSource: '257',
          firmwareApp: FirmwareRequestApp.zeppLife,
        ),
        FirmwareRequestModel(
          deviceName: 'Mi Band 4 NFC',
          deviceSource: '24',
          productionSource: '256',
          firmwareApp: FirmwareRequestApp.zeppLife,
        ),
      ];
}

enum FirmwareRequestApp {
  zepp('com.huami.midong', '7.8.5-play_101072'),
  zeppLife('com.xiaomi.hm.health', '6.7.1_50703');

  const FirmwareRequestApp(this.appname, this.appVersion);
  final String appname, appVersion;
}

enum FirmwareRequestLocale {
  en('en_US', 'US'),
  zh('zh_CH', 'CH');

  const FirmwareRequestLocale(this.lang, this.country);
  final String lang, country;
}
