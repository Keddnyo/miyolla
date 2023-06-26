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
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      body: ListView.builder(
        shrinkWrap: true,
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

          return Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 672),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 4.0,
                  shape: rectangleBorder,
                  child: ListTile(
                    title: Text(
                      dial.deviceName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(dial.deviceAlias),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.open_in_new),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
