import 'package:flutter/material.dart';

class SimpleAppBar extends AppBar {
  SimpleAppBar({super.key, required String title})
      : super(title: Text(title), shadowColor: Colors.black, centerTitle: true);
}
