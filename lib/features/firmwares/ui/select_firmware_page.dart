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
  late final String _deviceName;
  late final List<Firmware> _firmwareList;

  late final AppLocalizations _translation;
  late final String _messageIsLatest, _messageIsUnsuitable;

  @override
  void initState() {
    super.initState();
    _deviceName = widget.device.name;
    _firmwareList = widget.device.firmwareList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translation = GetLocalizations.of(context);
    _messageIsLatest = _translation.firmwareLatestMsg;
    _messageIsUnsuitable = _translation.firmwareUnsuitableMsg;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SimpleAppBar(
          title: _deviceName,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            var firmware = _firmwareList[index];
            var firmwareVersion = firmware.firmwareVersion;

            var isLatest = index == 0;
            var isSuitable = firmware.isSystemLocaleSupported(context);

            void downloadFirmware() {
              DownloadManager.downloadFile(
                firmware.downloadUrl,
                fileName: '${_deviceName}_FW_$firmwareVersion',
              );

              ShowSnackbar.call(
                context: context,
                message: _translation.firmwareDownloadMsg(firmwareVersion),
              );
            }

            return Column(
              children: [
                FirmwareCard(
                  title: firmwareVersion,
                  subtitle: !isSuitable
                      ? _messageIsUnsuitable
                      : isLatest
                          ? _messageIsLatest
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
