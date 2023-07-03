import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:miyolla/src/app/navigation/routes.dart';

import '../../../common/constants.dart';
import 'feed_app_about_dialog.dart';

class FeedNavigationDrawer extends StatelessWidget {
  const FeedNavigationDrawer({super.key});

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AppAboutDialog();
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
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                Constants.appName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
              ),
              Text(
                AppLocalizations.of(context)!.appDescription,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.memory),
          label: Text(AppLocalizations.of(context)!.feedTitle),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.palette_outlined),
          label: Text(AppLocalizations.of(context)!.dialsTitle),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.widgets_outlined),
          label: Text(AppLocalizations.of(context)!.appsTitle),
        ),
        const Divider(),
        NavigationDrawerDestination(
          icon: const Icon(Icons.info_outlined),
          label: Text(AppLocalizations.of(context)!.aboutText),
        ),
      ],
    );
  }
}
