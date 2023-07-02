import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:miyolla/src/app/model/firmwares/firmware_request_model.dart';
import 'package:miyolla/src/app/model/firmwares/firmware_response_model.dart';

class FirmwareRequest {
  static Future<FirmwareResponseModel?> fetchFirmware(
    FirmwareRequestModel firmware,
  ) async {
    String host = 'api-mifit-us2.huami.com';

    var response = await http.get(
      Uri.https(
        host,
        '/devices/ALL/hasNewVersion',
        {
          // 'productId': '0',
          // 'vendorSource': '0',
          'resourceVersion': '0',
          // 'firmwareFlag': '0',
          // 'vendorId': '0',
          // 'resourceFlag': '0',
          'productionSource': firmware.productionSource,
          // 'userid': '0',
          'userId': '0',
          'deviceSource': firmware.deviceSource,
          'fontVersion': '0',
          // 'fontFlag': '0',
          'appVersion': firmware.firmwareApp.appVersion,
          // 'appid': '0',
          // 'callid': '0',
          // 'channel': '0',
          // 'country': '0',
          // 'cv': '0',
          // 'device': '0',
          // 'deviceType': 'All',
          // 'device_type': 'android_phone',
          'firmwareVersion': '0',
          // 'hardwareVersion': '0',
          // 'lang': '0',
          'support8Bytes': 'true',
          // 'timezone': '0',
          // 'v': '0',
          'gpsVersion': '0',
          'baseResourceVersion': '0',
        },
      ),
      headers: {
        // 'hm-privacy-diagnostics': 'false',
        'country': firmware.firmwareLocale.country,
        'appplatform': 'android_phone',
        // 'hm-privacy-ceip': '0',
        // 'x-request-id': '0',
        // 'timezone': '0',
        // 'channel': '0',
        // 'user-agent': '0',
        // 'cv': '0',
        'appname': firmware.firmwareApp.appname,
        // 'v': '0',
        'apptoken': '0',
        'lang': firmware.firmwareLocale.lang,
        // 'Host': host,
        'Connection': 'Keep-Alive',
        'accept-encoding': 'identity',
      },
    ).timeout(
      const Duration(seconds: 10),
    );

    var responseBody = response.body;
    print(responseBody);

    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

    return jsonResponse.toFirmwareResponse(deviceName: firmware.deviceName);
  }
}
