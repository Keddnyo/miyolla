import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../features/firmwares/ui/widgets/app_bar.dart';
import '../../shared/constants.dart';
import '../../shared/ui/widgets/error_message.dart';
import '../../shared/utils/get_localizations.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  late final AppLocalizations _translation;
  late final String _errorMessage, _errorButtonTitle;

  void onButtonPressed() => Navigator.pop(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _translation = GetLocalizations.of(context);
    _errorMessage = _translation.navigationErrorMsg;
    _errorButtonTitle = _translation.navigateBack;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SimpleAppBar(
          title: Constants.appName,
        ),
        body: Center(
          child: ErrorMessage(
            icon: Icons.warning_amber,
            message: _errorMessage,
            buttonTitle: _errorButtonTitle,
            onButtonPressed: onButtonPressed,
          ),
        ),
      );
}
