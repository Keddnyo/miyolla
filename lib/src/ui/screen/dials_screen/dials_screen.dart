import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dial_model.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';

import '../../../app/navigation/routes.dart';
import '../../../common/constants.dart';

class DialsScreen extends StatelessWidget {
  const DialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dials'),
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: ListView.builder(
        itemCount: DialModel.list.length,
        itemBuilder: (context, index) {
          DialModel dial = DialModel.list[index];

          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.5,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              borderRadius: Dimens.borderRadius,
            ),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(dial.deviceName),
              subtitle: Text(dial.deviceAlias),
              onTap: () {
                Navigator.pushNamed(
                    context, '${Routes.dials}?model=${dial.deviceAlias}');
              },
            ),
          );
        },
      ),
    );
  }
}
