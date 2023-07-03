import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/constants.dart';

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      applicationName: Constants.appName,
      applicationVersion: AppLocalizations.of(context)!.appDescription,
      applicationIcon: Image.asset('images/miyolla.png', height: 54, width: 54),
      children: [
        Text(
          AppLocalizations.of(context)!.aboutText,
        ),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context)!.appCredits(Constants.appDeveloper),
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
  }
}
