import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:miyolla/src/app/model/firmwares/firmware_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, required this.firmware});

  final FirmwareResponseModel firmware;

  Future<void> _showAboutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var languages = [];

        if (firmware.lang != null) {
          for (var languageCode in firmware.lang!.split(',')) {
            var languageName = LocaleNames.of(context)!.nameOf(languageCode);
            languages.add(languageName);
          }
        }

        return AlertDialog(
          scrollable: true,
          title: Text(
            firmware.deviceName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.info),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 384),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  children: [
                    _FirmwareChip(
                      label: 'deviceSource: ${firmware.deviceSource}',
                    ),
                    _FirmwareChip(
                      label: 'productionSource: ${firmware.productionSource}',
                    ),
                  ],
                ),
                const Divider(),
                Wrap(
                  children: [
                    if (firmware.firmwareVersion != null &&
                        firmware.firmwareVersion!.isNotEmpty)
                      _FirmwareChip(
                        label: 'Firmware: ${firmware.firmwareVersion}',
                      ),
                    if (firmware.resourceVersion != null)
                      _FirmwareChip(
                        label: 'Resource: ${firmware.resourceVersion}',
                      ),
                    if (firmware.baseResourceVersion != null)
                      _FirmwareChip(
                        label: 'Base resource: ${firmware.baseResourceVersion}',
                      ),
                    if (firmware.fontVersion != null)
                      _FirmwareChip(
                        label: 'Font: ${firmware.fontVersion}',
                      ),
                    if (firmware.gpsVersion != null &&
                        firmware.gpsVersion!.isNotEmpty)
                      _FirmwareChip(
                        label: 'GPS: ${firmware.gpsVersion}',
                      ),
                  ],
                ),
                const Divider(),
                if (languages.isNotEmpty)
                  Wrap(
                    children: [
                      for (String? language in languages)
                        _FirmwareChip(label: language ?? '<?>')
                    ],
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
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
              trailing: IconButton(
                onPressed: () => _showAboutDialog(context),
                icon: const Icon(Icons.info),
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
                  onPressed: () => launchUrl(
                    Uri.parse(firmware.firmwareUrl!),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: const Text('Download'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FirmwareChip extends StatelessWidget {
  const _FirmwareChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(label: Text(label)),
      );
}
