class FirmwareRequestModel {
  FirmwareRequestModel({
    required this.deviceName,
    required this.deviceSource,
    required this.productionSource,
    required this.firmwareApp,
  });

  final String deviceName, deviceSource, productionSource;
  final FirmwareRequestApp firmwareApp;

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
  zepp('7.8.5-play', '101072'),
  zeppLife('6.7.1', '50703');

  const FirmwareRequestApp(this.appname, this.appVersion);
  final String appname, appVersion;
}
