import 'dart:typed_data';

import 'package:dive_club/application/navigation/feature.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PrinterDialog extends StatelessWidget {
  const PrinterDialog({super.key, required this.preparedDoc});

  final Uint8List preparedDoc;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (pageFormat) => preparedDoc,
      maxPageWidth: 700,
      actions: [
        IconButton(
          onPressed: () {
            NavigationService.pop();
          },
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}

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
