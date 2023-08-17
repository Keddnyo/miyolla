import '../../domain/entities/firmware.dart';

class FirmwareModel {
  FirmwareModel({
    required this.fw,
    required this.res,
    required this.ft,
    required this.languages,
    required this.changelog,
    required this.downloadUrl,
    required this.downloadLength,
  });

  final String fw, languages, downloadUrl;
  final String? res, ft, changelog;
  final int downloadLength;

  Firmware toFirmware() => Firmware(
      firmwareVersion: fw, languages: languages, downloadUrl: downloadUrl);

  factory FirmwareModel.fromJson(Map<String, dynamic> json) => FirmwareModel(
        fw: json['fw'],
        res: json['res'],
        ft: json['ft'],
        languages: json['languages'],
        changelog: json['changelog'],
        downloadUrl: json['downloadUrl'],
        downloadLength: json['downloadLength'],
      );
}
