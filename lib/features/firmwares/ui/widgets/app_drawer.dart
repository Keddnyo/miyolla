import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/utils/get_localizations.dart';
import '../../../../shared/utils/open_url.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late final AppLocalizations _translation;
  late final String _appDescription, _appDeveloper, _apiDeveloper;

  void _openDrawerItem(String url) {
    openUrl(url);
    Navigator.pop(context);
  }

  void openGitHub() => _openDrawerItem(Constants.sourceCodeRepository);
  void openKeddnyoProfile() => _openDrawerItem(Constants.keddnyoProfile);
  void openSchakalProfile() => _openDrawerItem(Constants.schakalProfile);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translation = GetLocalizations.of(context);
    _appDescription = _translation.appDescription;
    _appDeveloper = _translation.appDeveloper;
    _apiDeveloper = _translation.apiDeveloper;
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Constants.appName,
                      style: TextStyle(fontSize: 36),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _appDescription,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.handyman),
              title: const Text('Keddnyo'),
              subtitle: Text(_appDeveloper),
              onTap: openKeddnyoProfile,
            ),
            ListTile(
              leading: const Icon(Icons.api),
              title: const Text('Schakal'),
              subtitle: Text(_apiDeveloper),
              onTap: openSchakalProfile,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('GitHub'),
              onTap: openGitHub,
            ),
            const Divider(),
            AboutListTile(
              icon: const Icon(Icons.info_outlined),
              applicationIcon: Image.asset(
                'lib/core/app/assets/app_icon.png',
                width: 72.0,
                height: 72.0,
              ),
              applicationVersion: _appDescription,
              applicationLegalese: Constants.copyrightLabel,
            ),
          ],
        ),
      );
}
