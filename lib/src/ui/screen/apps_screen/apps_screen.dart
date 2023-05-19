import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:miyolla/src/app/model/app_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(16.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
        shadowColor: Colors.black,
      ),
      body: AlignedGridView.extent(
        maxCrossAxisExtent: 184,
        itemCount: AppModel.list.length,
        itemBuilder: (context, index) {
          AppModel app = AppModel.list[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.5),
                    borderRadius: borderRadius,
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(app.downloadUrl),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    borderRadius: borderRadius,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/${app.getIconName(index)}.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  app.appName,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
