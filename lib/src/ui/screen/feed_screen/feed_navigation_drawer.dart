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
            Navigator.pushNamed(context, Routes.dials);
            break;
          case 2:
            Navigator.pushNamed(context, Routes.apps);
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
                style: TextStyle(fontSize: 36.0),
              ),
              Text(
                Constants.appDescription,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.newspaper),
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
