import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:miyolla/src/app/model/firmwares/firmware_request_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';

class FeedCard extends StatefulWidget {
  const FeedCard({super.key, required this.firmware});

  final FirmwareResponseModel firmware;

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  late final String releaseNotes;

  @override
  void initState() {
    super.initState();
    releaseNotes = widget.firmware.changeLog?.split('###summary###').first ??
        '- Fix some known issues';
  }

  @override
  Widget build(BuildContext context) {
    List<String> languages = [];

    if (widget.firmware.lang != null) {
      for (var languageCode in widget.firmware.lang!.split(',')) {
        String? languageName = LocaleNames.of(context)!.nameOf(languageCode);
        if (languageName != null) {
          languages.add(languageName.capitalize);
        }
      }
    }

    List<String> firmwareLinks = [];

    if (widget.firmware.firmwareUrl != null) {
      firmwareLinks.add(widget.firmware.firmwareUrl!);
    }
    if (widget.firmware.resourceUrl != null) {
      firmwareLinks.add(widget.firmware.resourceUrl!);
    }
    if (widget.firmware.baseResourceUrl != null) {
      firmwareLinks.add(widget.firmware.baseResourceUrl!);
    }
    if (widget.firmware.fontUrl != null) {
      firmwareLinks.add(widget.firmware.fontUrl!);
    }
    if (widget.firmware.gpsUrl != null) {
      firmwareLinks.add(widget.firmware.gpsUrl!);
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 8.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Tooltip(
                  message:
                      'deviceSource: ${widget.firmware.deviceSource}, productionSource: ${widget.firmware.productionSource}',
                  child: Text(
                    widget.firmware.deviceName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (widget.firmware.firmwareVersion != null &&
                        widget.firmware.firmwareVersion!.isNotEmpty)
                      _FirmwareChip(
                        label:
                            '${AppLocalizations.of(context)!.firmware}: ${widget.firmware.firmwareVersion}',
                      ),
                    if (widget.firmware.resourceVersion != null)
                      _FirmwareChip(
                        label:
                            '${AppLocalizations.of(context)!.resource}: ${widget.firmware.resourceVersion}',
                      ),
                    if (widget.firmware.baseResourceVersion != null)
                      _FirmwareChip(
                        label:
                            '${AppLocalizations.of(context)!.baseResource}: ${widget.firmware.baseResourceVersion}',
                      ),
                    if (widget.firmware.fontVersion != null)
                      _FirmwareChip(
                        label:
                            '${AppLocalizations.of(context)!.font}: ${widget.firmware.fontVersion}',
                      ),
                    if (widget.firmware.gpsVersion != null &&
                        widget.firmware.gpsVersion!.isNotEmpty)
                      _FirmwareChip(
                        label: 'GPS: ${widget.firmware.gpsVersion}',
                      ),
                  ],
                ),
              ),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 0.5,
                  ),
                ),
                child: Image.asset(
                  widget.firmware.firmwareApp == FirmwareRequestApp.zeppLife
                      ? 'images/mi_fit.png'
                      : 'images/zepp.png',
                ),
              ),
            ),
          ),
          if (languages.isNotEmpty)
            Divider(
              color: Theme.of(context).colorScheme.onBackground,
              thickness: 0.5,
              height: 0.5,
            ),
          if (languages.isNotEmpty)
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  AppLocalizations.of(context)!.firmwareLanguages,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Wrap(
                children: [
                  for (String language in languages)
                    _FirmwareChip(label: language)
                ],
              ),
            ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                AppLocalizations.of(context)!.firmwareReleaseNotes,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(releaseNotes),
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
                  onPressed: () {
                    for (var url in firmwareLinks) {
                      launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations.of(context)!.firmwareDownload),
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
          label: Text(label),
        ),
      );
}
