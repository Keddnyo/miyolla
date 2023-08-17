import 'package:flutter/material.dart';

class FirmwareCard extends StatelessWidget {
  const FirmwareCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.hasError = false,
  });

  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    var subtitle = this.subtitle != null
        ? Text(
            this.subtitle!,
            style: hasError
                ? TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  )
                : null,
          )
        : null;

    var outlinedBorder = RoundedRectangleBorder(
      side: BorderSide(
        color: Theme.of(context).colorScheme.onBackground,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );

    return Align(
      child: Card(
        elevation: 4.0,
        shape: outlinedBorder,
        margin: const EdgeInsets.all(12.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 768),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: subtitle,
            shape: outlinedBorder,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
