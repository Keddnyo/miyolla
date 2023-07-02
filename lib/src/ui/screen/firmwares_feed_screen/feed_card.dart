import 'package:flutter/material.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, required this.firmware});

  final FirmwareResponseModel firmware;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      shape: Styles().getRectangleBorder(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                firmware.deviceName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                firmware.firmwareVersion ?? 'Unknown firmware version',
              ),
              leading: Image.asset('images/zepp.png'),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          ListTile(
            title: const Text(
              'Release notes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(firmware.changeLog ?? '- Fix some known issues'),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(onPressed: () {}, child: const Text('More')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
