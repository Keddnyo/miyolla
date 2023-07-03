import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';

class FirmwareInfoScreen extends StatelessWidget {
  const FirmwareInfoScreen({
    super.key,
    required this.firmware,
    required this.releaseNotes,
    required this.languages,
  });

  final FirmwareResponseModel firmware;
  final String releaseNotes;
  final List languages;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            firmware.deviceName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: Styles().getRectangleBorder(context),
                elevation: 8.0,
                child: ListTile(
                  title: const Text(
                    'Release notes:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(releaseNotes),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: Styles().getRectangleBorder(context),
                elevation: 8.0,
                child: ListTile(
                  title: const Text(
                    'Firmware version:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Wrap(
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
                          label:
                              'Base resource: ${firmware.baseResourceVersion}',
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
                ),
              ),
            ),
            if (languages.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: Styles().getRectangleBorder(context),
                  elevation: 8.0,
                  child: ListTile(
                    title: const Text(
                      'Languages:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Wrap(
                      children: [
                        for (String language in languages)
                          _FirmwareChip(label: language)
                      ],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: Styles().getRectangleBorder(context),
                elevation: 8.0,
                child: ListTile(
                  title: const Text(
                    'Meta-data:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Wrap(
                    children: [
                      _FirmwareChip(
                        label: 'deviceSource: ${firmware.deviceSource}',
                      ),
                      _FirmwareChip(
                        label: 'productionSource: ${firmware.productionSource}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 128),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          shape: Styles().getRectangleBorder(context),
          onPressed: () => launchUrl(
            Uri.parse(firmware.firmwareUrl!),
            mode: LaunchMode.externalApplication,
          ),
          icon: const Icon(Icons.download),
          label: const Text('Download'),
        ),
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
        child: Chip(
          label: Text(label),
        ),
      );
}
