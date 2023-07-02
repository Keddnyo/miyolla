import 'package:flutter/material.dart';
import 'package:miyolla/src/app/navigation/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/constants.dart';

class FeedNavigationDrawer extends StatelessWidget {
  const FeedNavigationDrawer({super.key});

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Constants.appName),
          content: const Text('Created by ${Constants.appDeveloper}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text('GitHub'),
              onPressed: () {
                launchUrl(
                  Uri.https(
                    'github.com',
                    '/${Constants.appDeveloper}/${Constants.appName}',
                  ),
                  mode: LaunchMode.externalApplication,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        Navigator.pop(context);

        switch (index) {
          case 1:
            Navigator.pushNamed(context, Routes.dials);
            break;
          case 2:
            Navigator.pushNamed(context, Routes.apps);
            break;
          case 3:
            _dialogBuilder(context);
            break;
        }
      },
      children: const [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Constants.appName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
              ),
              Text(
                Constants.appDescription,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.memory),
          label: Text('Firmwares'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.palette_outlined),
          label: Text('Watch Faces'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.widgets_outlined),
          label: Text('Applications'),
        ),
        Divider(),
        NavigationDrawerDestination(
          icon: Icon(Icons.info_outlined),
          label: Text('About'),
        ),
      ],
    );
  }
}
