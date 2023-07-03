import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miyolla/src/app/model/dials/request/dials_wearable_model.dart';
import 'package:miyolla/src/app/model/dials/response/dial_item_model.dart';
import 'package:miyolla/src/app/utils/extensions/list_distinct_extension.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/common/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TargetDeviceDials extends StatefulWidget {
  const TargetDeviceDials(this.dialModel, {super.key});

  final DialsWearableModel dialModel;

  @override
  State<TargetDeviceDials> createState() => _TargetDeviceDialsState();
}

class _TargetDeviceDialsState extends State<TargetDeviceDials> {
  Future<http.Response> get futureDialsData async {
    return await http
        .get(
          Uri.https(
            'watch-appstore.iot.mi.com',
            '/api/watchface/prize/tabs',
            {
              'model': widget.dialModel.deviceAlias,
            },
          ),
          // headers: {
          //   'Watch-Appstore-Common': '_locale=en_US&_language=en',
          // },
        )
        .timeout(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dialModel.deviceName),
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: FutureBuilder(
        future: futureDialsData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error has occurred'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data?.statusCode != 200) {
            return const Center(child: Text('Error has occurred'));
          }
          if (snapshot.data!.body.isEmpty) {
            return const Center(child: Text('Body is empty'));
          }

          List<DialItemModel> dials = [];

          Map<String, dynamic> jsonResponse = jsonDecode(snapshot.data!.body);
          List<dynamic> data = jsonResponse['data'];

          for (var d in data) {
            for (var l in d['list']) {
              dials.add(
                DialItemModel(
                  title: l['display_name'],
                  iconUrl: l['icon'],
                  downloadUrl: l['config_file'],
                ),
              );
            }
          }

          // Remove duplicates
          dials = dials.unique((dial) => dial.downloadUrl);

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 256,
            ),
            itemCount: dials.length,
            itemBuilder: (context, index) {
              return Card(
                shape: Styles.getRectangleBorder(context),
                elevation: 4.0,
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: Dimens.borderRadius,
                  onTap: () {
                    launchUrl(
                      Uri.parse(dials[index].downloadUrl),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tooltip(
                      message: dials[index].title,
                      child: Image.network(
                        dials[index].iconUrl,
                        loadingBuilder: (context, child, loadingProgress) {
                          var loaded = loadingProgress?.cumulativeBytesLoaded;
                          var expected = loadingProgress?.expectedTotalBytes;

                          if (loaded == expected) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
