import 'dart:typed_data';

import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
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

class PreparingPrinterDialog extends StatelessWidget{
  const PreparingPrinterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return  AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(localization.preparingPrint),
          const SizedBox(height: 20,),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
