import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  Future<void> _showAdvancedInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.firmware.deviceName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.firmware.firmwareVersion != null)
                Text(
                  '${AppLocalizations.of(context)!.firmware}: ${widget.firmware.firmwareVersion}',
                ),
              if (widget.firmware.resourceVersion != null)
                Text(
                  '${AppLocalizations.of(context)!.resource}: ${widget.firmware.resourceVersion}',
                ),
              if (widget.firmware.baseResourceVersion != null)
                Text(
                  '${AppLocalizations.of(context)!.baseResource}: ${widget.firmware.baseResourceVersion}',
                ),
              if (widget.firmware.fontVersion != null)
                Text(
                  '${AppLocalizations.of(context)!.font}: ${widget.firmware.fontVersion}',
                ),
              if (widget.firmware.gpsVersion != null)
                Text(
                  'GPS: ${widget.firmware.gpsVersion}',
                ),
              const SizedBox(height: 12),
              Text('deviceSource: ${widget.firmware.deviceSource}'),
              Text('productionSource: ${widget.firmware.productionSource}'),
            ],
          ),
          actions: <Widget>[
            FilledButton(
              child: Text(AppLocalizations.of(context)!.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  late final String releaseNotes;

  @override
  void initState() {
    super.initState();
    releaseNotes = widget.firmware.changeLog?.split('###summary###').first ??
        '- Fix some known issues';
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
      margin: const EdgeInsets.all(12.0),
      elevation: 2.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListTile(
              title: Text(
                widget.firmware.deviceName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.firmware.firmwareVersion!),
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
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    widget.firmware.firmwareApp == FirmwareRequestApp.zeppLife
                        ? 'images/mi_fit.png'
                        : 'images/zepp.png',
                  ),
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
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => _showAdvancedInfo(context),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.info_outlined),
                  ),
                ),
                const SizedBox(width: 12),
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
