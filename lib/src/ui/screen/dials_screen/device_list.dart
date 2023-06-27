import 'package:flutter/material.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';

import '../../../app/model/dials/request/dials_wearable_model.dart';
import '../../../app/navigation/routes.dart';
import '../../../common/constants.dart';

class DialsDeviceList extends StatelessWidget {
  const DialsDeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose wearable'),
        // centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: ListView.builder(
        itemCount: DialsWearableModel.list.length,
        itemBuilder: (context, index) {
          DialsWearableModel dial = DialsWearableModel.list[index];

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 4.0,
              shape: Styles().getRectangleBorder(context),
              child: ListTile(
                title: Text(
                  dial.deviceName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(dial.deviceAlias),
                leading: const Icon(Icons.watch),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.dials,
                      arguments: dial,
                    );
                  },
                  icon: const Icon(Icons.open_in_new),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
