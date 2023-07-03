import 'firmware_request_model.dart';

class FirmwareResponseModel {
  FirmwareResponseModel({
    required this.deviceName,
    required this.deviceIconName,
    required this.firmwareApp,
    required this.deviceSource,
    required this.productionSource,
    this.firmwareVersion,
    this.firmwareUrl,
    this.resourceVersion,
    this.resourceUrl,
    this.baseResourceVersion,
    this.baseResourceUrl,
    this.fontVersion,
    this.fontUrl,
    this.gpsVersion,
    this.gpsUrl,
    this.changeLog,
    this.lang,
  });

  String deviceName;
  String deviceIconName;
  FirmwareRequestApp firmwareApp;
  int deviceSource, productionSource;
  String? firmwareVersion, firmwareUrl;
  int? resourceVersion;
  String? resourceUrl;
  int? baseResourceVersion;
  String? baseResourceUrl;
  int? fontVersion;
  String? fontUrl;
  String? gpsVersion, gpsUrl;
  String? changeLog;
  String? lang;
}

extension JsonToFirmwareResponse on Map<String, dynamic> {
  FirmwareResponseModel toFirmwareResponse({
    required String deviceName,
    required String deviceIconName,
    required FirmwareRequestApp firmwareApp,
  }) =>
      FirmwareResponseModel(
        deviceName: deviceName,
        deviceIconName: deviceIconName,
        firmwareApp: firmwareApp,
        deviceSource: this['deviceSource'],
        productionSource: this['productionSource'],
        firmwareVersion: this['firmwareVersion'],
        firmwareUrl: this['firmwareUrl'],
        resourceVersion: this['resourceVersion'],
        resourceUrl: this['resourceUrl'],
        baseResourceVersion: this['baseResourceVersion'],
        baseResourceUrl: this['baseResourceUrl'],
        fontVersion: this['fontVersion'],
        fontUrl: this['fontUrl'],
        gpsVersion: this['gpsVersion'],
        gpsUrl: this['gpsUrl'],
        changeLog: this['changeLog'],
        lang: this['lang'],
      );
}
