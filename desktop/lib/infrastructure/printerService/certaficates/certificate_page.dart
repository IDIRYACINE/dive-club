import 'dart:io';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class CertificatePage extends pw.StatelessWidget {
  CertificatePage({required this.participant, required this.image});

  final File image;

  final CompetitionScoreEntity participant;

  @override
  pw.Widget build(pw.Context context) {
    final center = (context.page.pageFormat.width ) / 2;
    final color = PdfColor.fromHex("#FF0000");
    return pw.Stack(
      children: [
        pw.Image(pw.MemoryImage(image.readAsBytesSync())),
        pw.Positioned(
          top: 300,
          left: center + 50,
          child: pw.Text(
            participant.participantName.toString().toUpperCase(),
            style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
        pw.Positioned(
          top: 370,
          left: center,
          child: pw.Text(
            '${participant.divisionName.value} ${participant.specialtyName.value}',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
        pw.Positioned(
          top: 396,
          left: 370,
          child: pw.Text(
            'عيد الطفولة',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 23,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
      ],
    );
  }
}
