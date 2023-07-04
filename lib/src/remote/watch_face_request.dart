import 'package:http/http.dart' as http;

class WatchFaceRequest {
  static Future<http.Response> fetchFirmware(String deviceAlias) async {
    return await http
        .get(
          Uri.https(
            'watch-appstore.iot.mi.com',
            '/api/watchface/prize/tabs',
            {
              'model': deviceAlias,
            },
          ),
          // headers: {
          //   'Watch-Appstore-Common': '_locale=en_US&_language=en',
          // },
        )
        .timeout(
          const Duration(seconds: 5),
        );
  }
}
