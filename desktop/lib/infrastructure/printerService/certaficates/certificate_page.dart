import 'dart:io';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CertificatePage extends pw.StatelessWidget {
  CertificatePage({required this.participant, required this.image});

  final File image;

  final CompetitionScoreEntity participant;

  String getGenderInArabic(GenderEntity genderEntity){
    if(genderEntity.isFemale){
      return 'اناث';
    }
    return 'ذكور';
  }

  @override
  pw.Widget build(pw.Context context) {
    final center = (context.page.pageFormat.width) / 2;
    final color = PdfColor.fromHex("#FF0000");
    final genderArabic = getGenderInArabic(participant.gender);
    return pw.Stack(
      children: [
        pw.Image(pw.MemoryImage(image.readAsBytesSync())),
        pw.Positioned(
          top: 300,
          left: center ,
          child: pw.Row(
              mainAxisSize: pw.MainAxisSize.max,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  participant.club.clubName.value,
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: color),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  'نادي',
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  participant.participantName.toString(),
                  style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                      color: color),
                ),
              ]),
        ),
        pw.Positioned(
          top: 370,
          left: center + 50,
          child: pw.Text(
            '${participant.ageDivision.divisionName.value} ${participant.divisionName.value} ${participant.specialtyName.value} $genderArabic',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 18, fontWeight: pw.FontWeight.bold, color: color),
          ),
        ),
        pw.Positioned(
          top: 396,
          left: 350,
          child: pw.Text(
            'عيد الاستقلال',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 23, fontWeight: pw.FontWeight.bold, color: color),
          ),
        ),
      ],
    );
  }
}
