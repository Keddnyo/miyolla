import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/constants.dart';
import '../navigation/navigation.dart';
import '../themes/themes.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = Constants.appName;

    var theme = Themes.theme;
    var darkTheme = Themes.darkTheme;

    var localizations = AppLocalizations.localizationsDelegates;

    var locales = const [
      Locale('en'),
      Locale('ru'),
    ];

    var initialRoute = AppNavigation.deviceListRoute;

    var appConfiguration = MaterialApp(
      initialRoute: initialRoute,
      onGenerateRoute: (settings) => AppNavigation.onGenerateRoute(settings),
      onUnknownRoute: (settings) => AppNavigation.onUnknownRoute(settings),
      title: appName,
      theme: theme,
      darkTheme: darkTheme,
      localizationsDelegates: localizations,
      supportedLocales: locales,
    );

    return appConfiguration;
  }
}
