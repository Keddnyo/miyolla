import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/app/navigation/navigation.dart';
import '../../../shared/constants.dart';
import '../../../shared/ui/widgets/app_bar.dart';
import '../../../shared/ui/widgets/app_drawer.dart';
import '../../../shared/ui/widgets/error_message.dart';
import '../../../shared/utils/get_localizations.dart';
import '../data/api/firmware_api.dart';
import '../data/repositories/firmware_repository_impl.dart';
import '../data/sources/remote/firmware_remote_data_source_impl.dart';
import '../domain/entities/device.dart';
import '../domain/use_cases/get_devices.dart';
import 'widgets/firmware_card.dart';

class SelectDevicePage extends StatefulWidget {
  const SelectDevicePage({super.key});

  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  late final AppLocalizations _translation;
  late final String _errorMessage, _errorButtonTitle;
  late final Future<List<Device>> _future;

  Future<List<Device>> fetchData() async {
    var remoteDataSource = FirmwareRemoteDataSourceImpl();
    var repository = FirmwareRepositoryImpl(remoteDataSource);

    var response = await GetDevices(repository)(api: FirmwareApi.internal);
    if (response.isEmpty) {
      response = await GetDevices(repository)(api: FirmwareApi.external);
    }

    return response;
  }

  _refreshData() => setState(() => _future = fetchData());

  @override
  void initState() {
    super.initState();
    _future = fetchData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translation = GetLocalizations.of(context);
    _errorMessage = _translation.firmwareLoadingErrorMsg;
    _errorButtonTitle = _translation.retry;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                child = const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  var deviceList = snapshot.data!;

                  child = ListView.builder(
                    itemBuilder: (context, index) {
                      final device = deviceList[index];

                      void onTap() => Navigator.pushNamed(
                            context,
                            AppNavigation.routeFirmwares,
                            arguments: device,
                          );

                      return FirmwareCard(
                        title: device.name,
                        subtitle: device.firmwareList[0].firmwareVersion,
                        onTap: onTap,
                      );
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
