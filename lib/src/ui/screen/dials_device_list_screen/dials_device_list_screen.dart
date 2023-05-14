import 'package:flutter/material.dart';
import 'package:miyolla/src/common/constants.dart';

class DialsDeviceListScreen extends StatelessWidget {
  const DialsDeviceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dials'),
        shadowColor: Colors.black,
        centerTitle: Constants.centerTitle,
      ),
    );
  }
}
