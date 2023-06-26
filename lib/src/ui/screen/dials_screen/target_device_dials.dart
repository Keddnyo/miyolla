import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miyolla/src/app/model/dials/request/dials_wearable_model.dart';
import 'package:miyolla/src/app/model/dials/response/dial_item_model.dart';
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
    return await http.get(
      Uri.https(
        'watch-appstore.iot.mi.com',
        '/api/watchface/prize/tabs',
        {
          'model': widget.dialModel.deviceAlias,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dialModel.deviceName),
        // centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: FutureBuilder(
        future: futureDialsData,
        builder: (context, snapshot) {
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

          for (var d = 0; d < data.length; d++) {
            List<dynamic> list = data[d]['list'];
            for (var l = 0; l < list.length; l++) {
              dials.add(
                DialItemModel(
                  title: list[l]['display_name'],
                  iconUrl: list[l]['icon'],
                  downloadUrl: list[l]['config_file'],
                ),
              );
            }
          }

          return GridView.builder(
            itemCount: dials.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 256,
            ),
            itemBuilder: (context, index) {
              return Card(
                shape: Styles().getRectangleBorder(context),
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
                    child: Image.network(dials[index].iconUrl),
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
