import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.icon,
    required this.message,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  final IconData icon;
  final String message, buttonTitle;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 81.0),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            message,
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12.0),
        FilledButton(
          onPressed: () => onButtonPressed,
          child: Text(buttonTitle),
        ),
      ],
    );
  }
}
