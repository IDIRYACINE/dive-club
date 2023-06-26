import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onConfirm})
      : super(key: key);

  final String title;
  final String content;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        MaterialButton(
          textColor: theme.colorScheme.onPrimary,
          color: theme.primaryColor,
          onPressed: onConfirm,
          child: const Text("Confirm"),
        ),
      ],
    );
  }
}
