import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dial_model.dart';

class DialsDeviceListScreen extends StatelessWidget {
  const DialsDeviceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dials'),
        shadowColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: DialModel.list.length,
        itemBuilder: (context, index) {
          DialModel dial = DialModel.list[index];

          return Card(
            elevation: 4.0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(dial.deviceName),
              subtitle: Text(dial.deviceAlias),
            ),
          );
        },
      ),
    );
  }
}
