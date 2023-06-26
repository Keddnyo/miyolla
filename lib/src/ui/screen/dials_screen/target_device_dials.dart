import 'package:flutter/material.dart';
import 'package:miyolla/src/app/model/dial_model.dart';

class TargetDeviceDials extends StatelessWidget {
  const TargetDeviceDials(this.dialModel, {super.key});

  final DialModel dialModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dialModel.deviceName),
      ),
      body: Text(dialModel.deviceAlias),
    );
  }
}
