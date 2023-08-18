import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/constants.dart';
import '../navigation/navigation.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        initialRoute: AppNavigation.routeDevices,
        onGenerateRoute: (settings) => AppNavigation.onGenerateRoute(settings),
        onUnknownRoute: (settings) => AppNavigation.onUnknownRoute(settings),
        title: Constants.appName,
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
      );
}
