import 'package:flutter/material.dart';
import 'package:miyolla/src/app/navigation/routes.dart';
import 'package:miyolla/src/ui/screen/apps_screen/apps_screen.dart';
import 'package:miyolla/src/ui/screen/dials_device_list_screen/dials_device_list_screen.dart';
import 'package:miyolla/src/ui/screen/dials_target_device_screen/dials_target_device_screen.dart';

import '../constants.dart';
import '../../ui/screen/feed_screen/feed_screen.dart';
import 'app_theme.dart';

class MiYollaApp extends StatelessWidget {
  const MiYollaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: MiYollaTheme.light,
      darkTheme: MiYollaTheme.dark,
      initialRoute: Routes.feed,
      routes: {
        Routes.feed: (_) => const FeedScreen(),
        Routes.dialsDeviceList: (_) => const DialsDeviceListScreen(),
        Routes.dialsTargetDevice: (_) => const DialsTargetDeviceScreen(),
        Routes.apps: (_) => const AppsScreen(),
      },
    );
  }
}
