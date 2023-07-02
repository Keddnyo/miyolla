import 'package:flutter/material.dart';
import 'package:miyolla/src/app/inherit/firmwares/firmwares_view_model.dart';

class FirmwaresProvider extends InheritedNotifier {
  const FirmwaresProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

  final FirmwaresViewModel model;

  static FirmwaresViewModel? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FirmwaresProvider>()?.model;
}
