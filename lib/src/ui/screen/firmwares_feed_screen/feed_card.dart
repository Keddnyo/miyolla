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
          title: Text(firmware.deviceName),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 384),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _FirmwareChip(
                        label: 'deviceSource: ${firmware.deviceSource}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: _FirmwareChip(
                        label: 'productionSource: ${firmware.productionSource}',
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Wrap(
                  children: [
                    if (firmware.firmwareVersion != null)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _FirmwareChip(
                          label: 'Firmware: ${firmware.firmwareVersion}',
                        ),
                      ),
                    if (firmware.resourceVersion != null)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _FirmwareChip(
                          label: 'Resource: ${firmware.resourceVersion}',
                        ),
                      ),
                    if (firmware.baseResourceVersion != null)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _FirmwareChip(
                          label:
                              'Base resource: ${firmware.baseResourceVersion}',
                        ),
                      ),
                    if (firmware.fontVersion != null)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _FirmwareChip(
                          label: 'Font: ${firmware.fontVersion}',
                        ),
                      ),
                    if (firmware.gpsVersion != null)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _FirmwareChip(
                          label: 'GPS: ${firmware.gpsVersion}',
                        ),
                      ),
                  ],
                ),
                const Divider(),
                if (languages.isNotEmpty)
                  Wrap(
                    children: [
                      for (String? language in languages)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: _FirmwareChip(label: language ?? '<Unknown>'),
                        )
                    ],
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            FilledButton(
              child: const Text('Close'),
              onPressed: () {
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
      margin: const EdgeInsets.all(16.0),
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => _showAboutDialog(context),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.info_outlined),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.share_outlined),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                OutlinedButton(
                  onPressed: () => launchUrl(
                    Uri.parse(firmware.firmwareUrl!),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.download),
                  ),
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
  Widget build(BuildContext context) => Chip(label: Text(label));
}
