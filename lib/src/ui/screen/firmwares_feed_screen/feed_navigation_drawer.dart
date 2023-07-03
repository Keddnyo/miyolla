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
        return AboutDialog(
          applicationName: Constants.appName,
          applicationVersion: Constants.appDescription,
          applicationIcon:
              Image.asset('images/miyolla.png', height: 54, width: 54),
          children: [
            const Text(
              'This app is designed for Huami wearables.',
            ),
            const Text(
              'There are three destinations can be found in navigation drawer.',
            ),
            const Text(
              'The first one is firmwares feed. There you can download firmwares for different wearables.',
            ),
            const Text(
              'The second one is dials. There you can discover varius watch faces.',
            ),
            const Text(
              'The third one is apps. There you can find an Android app for your wearable.',
            ),
            const SizedBox(height: 12),
            const Text(
              'Created by Keddnyo, 2023',
            ),
            const SizedBox(height: 12),
            OutlinedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                        'https://github.com/${Constants.appDeveloper}/${Constants.appName}'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Text('GitHub'))
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
          label: Text('Feed'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.palette_outlined),
          label: Text('Dials'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.widgets_outlined),
          label: Text('Apps'),
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
