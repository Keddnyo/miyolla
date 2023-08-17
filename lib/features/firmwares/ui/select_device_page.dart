import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/app/navigation/navigation.dart';
import '../../../shared/constants.dart';
import '../../../shared/ui/widgets/error_message.dart';
import '../../../shared/utils/get_localizations.dart';
import '../domain/entities/device.dart';
import 'controllers/firmware_controller.dart';
import 'controllers/firmware_provider.dart';
import 'widgets/app_bar.dart';
import 'widgets/app_drawer.dart';
import 'widgets/firmware_card.dart';

class SelectDevicePage extends StatefulWidget {
  const SelectDevicePage({super.key});

  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  late final AppLocalizations _translation;
  late final String _errorMessage, _errorButtonTitle;

  late final FirmwareController _controller;
  late final Future<List<Device>> _future;

  late final String _firmwaresRoute;

  @override
  void initState() {
    _translation = GetLocalizations.of(context);
    _errorMessage = _translation.firmwaresAreUnavailable;
    _errorButtonTitle = _translation.retry;

    _controller = FirmwareProvider.getController(context)!;
    _future = _controller.fetchData();

    _firmwaresRoute = AppNavigation.firmwareListRoute;
    super.initState();
  }

  _refreshData() => setState(() => _future = _controller.fetchData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Constants.appName,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          final Widget child;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              child = const Center(child: CircularProgressIndicator());
              break;
            default:
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final deviceList = snapshot.data!;

                child = ListView.builder(
                  itemBuilder: (context, index) {
                    final device = deviceList[index];

                    final title = device.name;
                    final subtitle = device.firmwareList[0].firmwareVersion;

                    void onTap() =>
                        Navigator.pushNamed(context, _firmwaresRoute,
                            arguments: device);

                    return FirmwareCard(
                        title: title, subtitle: subtitle, onTap: onTap);
                  },
                  itemCount: deviceList.length,
                );
              } else {
                child = Center(
                  child: ErrorMessage(
                    icon: Icons.memory,
                    message: snapshot.hasError
                        ? snapshot.error.toString()
                        : _errorMessage,
                    buttonTitle: _errorButtonTitle,
                    onButtonPressed: _refreshData,
                  ),
                );
              }
          }

          return child;
        },
      ),
      drawer: const AppDrawer(),
    );
  }
}
