class FirmwareResponseModel {
  FirmwareResponseModel({
    required this.deviceName,
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
  int deviceSource, productionSource;
  String? firmwareVersion, firmwareUrl;
  int? resourceVersion;
  String? resourceUrl;
  String? baseResourceVersion, baseResourceUrl;
  int? fontVersion;
  String? fontUrl;
  String? gpsVersion, gpsUrl;
  String? changeLog;
  String? lang;
}

extension JsonToFirmwareResponse on Map<String, dynamic> {
  FirmwareResponseModel toFirmwareResponse({required String deviceName}) =>
      FirmwareResponseModel(
        deviceName: deviceName,
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
