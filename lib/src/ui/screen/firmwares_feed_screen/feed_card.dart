import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/firmwares/firmware_response_model.dart';
import '../../../common/constants.dart';
import 'feed_firmware_info_screen.dart';

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

  Future<void> _showAboutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var languages = [];

        if (widget.firmware.lang != null) {
          for (var languageCode in widget.firmware.lang!.split(',')) {
            String? languageName =
                LocaleNames.of(context)!.nameOf(languageCode);
            if (languageName != null) {
              languages.add(languageName);
            }
          }
        }

        return FirmwareInfoScreen(
            firmware: widget.firmware, languages: languages);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      shape: Styles.getRectangleBorder(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                widget.firmware.deviceName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.firmware.firmwareVersion!,
              ),
              leading: SizedBox(
                width: 48,
                height: 48,
                child: Image.asset(
                  'images/${widget.firmware.deviceIconName}.png',
                  height: 36,
                  width: 36,
                ),
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.firmwareReleaseNotes,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(releaseNotes),
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
                OutlinedButton(
                  onPressed: () => _showAboutDialog(context),
                  child: const Icon(Icons.info_outlined),
                ),
                const SizedBox(width: 12.0),
                FilledButton(
                  onPressed: () {
                    for (var url in firmwareLinks) {
                      launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.firmwareDownload),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
