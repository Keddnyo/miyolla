import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/firmwares/firmware_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, required this.firmware});

  final FirmwareResponseModel firmware;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(firmware.deviceName),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (firmware.firmwareVersion != null)
                Text('FW: ${firmware.firmwareVersion}'),
              if (firmware.resourceVersion != null)
                Text('RES: ${firmware.resourceVersion}'),
              if (firmware.baseResourceVersion != null)
                Text('BaseRES: ${firmware.baseResourceVersion}'),
              if (firmware.fontVersion != null)
                Text('FT: ${firmware.fontVersion}'),
              if (firmware.gpsVersion != null)
                Text('BaseRES: ${firmware.gpsVersion}'),
              const SizedBox(height: 24),
              Text('deviceSource: ${firmware.deviceSource}'),
              Text('productionSource: ${firmware.productionSource}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text('Download'),
              onPressed: () {
                launchUrl(
                  Uri.parse(firmware.firmwareUrl!),
                  mode: LaunchMode.externalApplication,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
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
              leading: Image.asset(
                firmware.firmwareApp == FirmwareRequestApp.zeppLife
                    ? 'images/zepp_life.png'
                    : 'images/zepp.png',
              ),
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
            subtitle: Text(
              firmware.changeLog?.split('###summary###').first ??
                  '- Fix some known issues',
            ),
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
                FilledButton(
                    onPressed: () => _dialogBuilder(context),
                    child: const Text('More')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
