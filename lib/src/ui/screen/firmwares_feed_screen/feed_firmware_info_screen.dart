import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';

class FirmwareInfoScreen extends StatelessWidget {
  const FirmwareInfoScreen({
    super.key,
    required this.firmware,
    required this.languages,
  });

  final FirmwareResponseModel firmware;
  final List languages;

  @override
  Widget build(BuildContext context) {
    List<String> firmwareLinks = [];

    if (firmware.firmwareUrl != null) {
      firmwareLinks.add(firmware.firmwareUrl!);
    }
    if (firmware.resourceUrl != null) {
      firmwareLinks.add(firmware.resourceUrl!);
    }
    if (firmware.baseResourceUrl != null) {
      firmwareLinks.add(firmware.baseResourceUrl!);
    }
    if (firmware.fontUrl != null) {
      firmwareLinks.add(firmware.fontUrl!);
    }
    if (firmware.gpsUrl != null) {
      firmwareLinks.add(firmware.gpsUrl!);
    }

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            firmware.deviceName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shadowColor: Colors.black,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: Styles.getRectangleBorder(context),
                elevation: 8.0,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.firmwareVersion,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Wrap(
                    children: [
                      if (firmware.firmwareVersion != null &&
                          firmware.firmwareVersion!.isNotEmpty)
                        _FirmwareChip(
                          label:
                              '${AppLocalizations.of(context)!.firmware}: ${firmware.firmwareVersion}',
                        ),
                      if (firmware.resourceVersion != null)
                        _FirmwareChip(
                          label:
                              '${AppLocalizations.of(context)!.resource}: ${firmware.resourceVersion}',
                        ),
                      if (firmware.baseResourceVersion != null)
                        _FirmwareChip(
                          label:
                              '${AppLocalizations.of(context)!.baseResource}: ${firmware.baseResourceVersion}',
                        ),
                      if (firmware.fontVersion != null)
                        _FirmwareChip(
                          label:
                              '${AppLocalizations.of(context)!.font}: ${firmware.fontVersion}',
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
                  shape: Styles.getRectangleBorder(context),
                  elevation: 8.0,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.firmwareLanguages,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                shape: Styles.getRectangleBorder(context),
                elevation: 8.0,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.firmwareMetaData,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Wrap(
                    children: [
                      _FirmwareChip(
                        label: 'deviceSource: ${firmware.deviceSource}',
                      ),
                      _FirmwareChip(
                        label: 'productionSource: ${firmware.productionSource}',
                      ),
                      _FirmwareChip(
                        label: 'appname: ${firmware.firmwareApp.appname}',
                      ),
                      _FirmwareChip(
                        label: 'appVersion: ${firmware.firmwareApp.appVersion}',
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
          shape: Styles.getRectangleBorder(context),
          onPressed: () {
            for (var url in firmwareLinks) {
              launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              );
            }
          },
          icon: const Icon(Icons.download),
          label: Text(AppLocalizations.of(context)!.firmwareDownload),
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
