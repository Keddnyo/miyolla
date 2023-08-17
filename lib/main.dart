import 'dart:io';

import 'package:flutter/material.dart';

import 'core/app/configuration/app_configuration.dart';
import 'core/app/configuration/http_configuration.dart';

void main() {
  // Fix http request issue on old devices
  HttpOverrides.global = CustomHttpOverrides();

  // Run application
  runApp(const AppConfiguration());
}
