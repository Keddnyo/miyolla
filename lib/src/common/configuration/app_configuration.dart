import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:miyolla/src/app/navigation/routes.dart';
import 'package:miyolla/src/ui/screen/apps_screen/apps_screen.dart';
import 'package:miyolla/src/ui/screen/dials_screen/dials_screen.dart';

import '../constants.dart';
import '../../ui/screen/firmwares_feed_screen/feed_screen.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.feed: (_) => const FeedScreen(),
        Routes.dials: (_) => const DialsScreen(),
        Routes.apps: (_) => const AppsScreen(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: const [
        Locale('be'),
        Locale('de'),
        Locale('en'),
        Locale('es'),
        Locale('fr'),
        Locale('hi'),
        Locale('ja'),
        Locale('ko'),
        Locale('ru'),
        Locale('tr'),
        Locale('uk'),
        Locale('zh'),
      ],
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    );
  }
}
