import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dial_model.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';

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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 290,
        ),
        itemCount: DialModel.list.length,
        itemBuilder: (context, index) {
          DialModel dial = DialModel.list[index];

          var rectangleBorder = RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            borderRadius: Dimens.borderRadius,
          );

          return Card(
            elevation: 4.0,
            shape: rectangleBorder,
            margin: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      dial.deviceName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      dial.deviceAlias,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
