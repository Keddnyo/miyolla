class FirmwareResponseModel {
  FirmwareResponseModel({
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

  String deviceSource, productionSource;
  String? firmwareVersion, firmwareUrl;
  String? resourceVersion, resourceUrl;
  String? baseResourceVersion, baseResourceUrl;
  String? fontVersion, fontUrl;
  String? gpsVersion, gpsUrl;
  String? changeLog;
  String? lang;

  // static FirmwareResponseModel toFirmwareResponse(Map<String, dynamic> json) {
  //   return FirmwareResponseModel(
  //     deviceSource: json['deviceSource'],
  //     productionSource: json['productionSource'],
  //     firmwareVersion: json['firmwareVersion'],
  //     firmwareUrl: json['firmwareUrl'],
  //     resourceVersion: json['resourceVersion'],
  //     resourceUrl: json['resourceUrl'],
  //     baseResourceVersion: json['baseResourceVersion'],
  //     baseResourceUrl: json['baseResourceUrl'],
  //     fontVersion: json['fontVersion'],
  //     fontUrl: json['fontUrl'],
  //     gpsVersion: json['gpsVersion'],
  //     gpsUrl: json['gpsUrl'],
  //     changeLog: json['changeLog'],
  //     lang: json['lang'],
  //   );
  // }
}

extension JsonToFirmwareResponse on Map<String, dynamic> {
  FirmwareResponseModel toFirmwareResponse() => FirmwareResponseModel(
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
