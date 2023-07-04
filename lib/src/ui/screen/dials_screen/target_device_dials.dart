import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dials/request/dials_wearable_model.dart';
import 'package:miyolla/src/app/model/dials/response/dial_item_model.dart';
import 'package:miyolla/src/app/utils/extensions/list_distinct_extension.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/common/constants.dart';
import 'package:miyolla/src/remote/watch_face_request.dart';

import '../../../remote/downloader/download_manager.dart';

class TargetDeviceDials extends StatefulWidget {
  const TargetDeviceDials(this.dialModel, {super.key});

  final DialsWearableModel dialModel;

  @override
  State<TargetDeviceDials> createState() => _TargetDeviceDialsState();
}

class _TargetDeviceDialsState extends State<TargetDeviceDials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dialModel.deviceName),
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: FutureBuilder(
        future: WatchFaceRequest.fetchFirmware(widget.dialModel.deviceAlias),
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
              var dial = dials[index];

              return Card(
                elevation: 2.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: Dimens.borderRadius,
                ),
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: Dimens.borderRadius,
                  onTap: () {
                    DownloadManager.downloadDial(
                      url: dial.downloadUrl,
                      deviceName: widget.dialModel.deviceName,
                      fileName: dial.title,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tooltip(
                      message: dial.title,
                      child: Image.network(
                        dial.iconUrl,
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
