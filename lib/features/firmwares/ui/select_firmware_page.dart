import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/download_manager/download_manager.dart';
import '../../../shared/ui/show_snack_bar.dart';
import '../../../shared/utils/get_localizations.dart';
import '../domain/entities/device.dart';
import '../domain/entities/firmware.dart';
import 'widgets/app_bar.dart';
import 'widgets/firmware_card.dart';

class SelectFirmwarePage extends StatefulWidget {
  const SelectFirmwarePage({super.key, required this.device});

  final Device device;

  @override
  State<SelectFirmwarePage> createState() => _SelectFirmwarePageState();
}

class _SelectFirmwarePageState extends State<SelectFirmwarePage> {
  late final AppLocalizations _translation;
  late final String _unsuitableMessage, _latestMessage;

  late final String _deviceName;
  late final List<Firmware> _firmwareList;

  @override
  void initState() {
    _translation = GetLocalizations.of(context);
    _unsuitableMessage = _translation.unsuitableFirmware;
    _latestMessage = _translation.latestFirmware;

    _deviceName = widget.device.name;
    _firmwareList = widget.device.firmwareList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: _deviceName),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var firmware = _firmwareList[index];
          var version = firmware.firmwareVersion;

          var isLatest = index == 0;
          var isSuitable = firmware.isSystemLocaleSupported(context);

          void downloadFirmware() {
            var fileName = '${_deviceName}_FW_$version';

            DownloadManager.downloadFile(
              firmware.downloadUrl,
              fileName: fileName,
            );

            ShowSnackbar.call(
              context: context,
              message: _translation.downloadingFirmware(version),
            );
          }

          return Column(
            children: [
              FirmwareCard(
                title: version,
                subtitle: !isSuitable
                    ? _unsuitableMessage
                    : isLatest
                        ? _latestMessage
                        : null,
                onTap: downloadFirmware,
                hasError: !isSuitable,
              ),
              if (isLatest) const Divider(),
            ],
          );
        },
        itemCount: _firmwareList.length,
      ),
    );
  }
}
