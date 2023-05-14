import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
        shadowColor: Colors.black,
        centerTitle: Constants.centerTitle,
      ),
    );
  }
}
