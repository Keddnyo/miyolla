import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:miyolla/src/app/model/applications/app_model.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/common/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appsTitle),
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: AlignedGridView.extent(
        maxCrossAxisExtent: 192,
        itemCount: WearableAppModel.list.length,
        itemBuilder: (context, index) {
          WearableAppModel app = WearableAppModel.list[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 2.0,
                  shape: Styles.getOutlinedBorder(context),
                  margin: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(app.downloadUrl),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    borderRadius: Dimens.borderRadius,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'images/${app.getIconName(index)}.png',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    app.appName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
