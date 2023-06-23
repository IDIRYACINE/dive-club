

import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget{
  const ConfirmationDialog({Key? key, required this.title, required this.content, required this.onConfirm}) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onConfirm,
          child: const Text("Confirm"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}