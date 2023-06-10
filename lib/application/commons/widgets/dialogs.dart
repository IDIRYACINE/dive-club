
import 'package:flutter/material.dart';


class InfoDialog extends StatelessWidget{
  const InfoDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
    );
  }

}
