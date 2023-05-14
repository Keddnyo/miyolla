import 'package:flutter/material.dart';
import 'package:miyolla/src/app/navigation/routes.dart';

import '../../../common/constants.dart';

class FeedNavigationDrawer extends StatelessWidget {
  const FeedNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        Navigator.pop(context);

        switch (index) {
          case 1:
            Navigator.pushNamed(context, Routes.dialsDeviceList);
            break;
          case 2:
            Navigator.pushNamed(context, Routes.apps);
            break;
        }
      },
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                Constants.appName,
                style: TextStyle(fontSize: 36.0),
              ),
              Text(
                Constants.appDescription,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.newspaper),
          label: Text('News'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.palette_outlined),
          label: Text('Dials'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.widgets_outlined),
          label: Text('Apps'),
        ),
        const Divider(),
        const NavigationDrawerDestination(
          icon: Icon(Icons.info_outlined),
          label: Text('About'),
        ),
      ],
    );
  }
}
