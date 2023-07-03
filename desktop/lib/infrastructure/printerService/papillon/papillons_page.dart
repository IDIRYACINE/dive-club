import 'dart:io';

import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PapillonPage extends pw.StatelessWidget {
  PapillonPage(
      {required this.participants,
      required this.image,
      required this.width,
      required this.height});

  final File image;

  final List<ParticipantEntity> participants;
  final double width;
  final double height;

  List<pw.Widget> _buildItems() {
    const double nameTopPosition = 55;
    const double nameLeftPosition = 50;
    const double spaceBetweenElements = 23;
    const double entryTimeTopPosition = 95;
    const double entryTimeLeftPosition = 210;

    List<pw.Widget> widgets = [];

    for (ParticipantEntity participant in participants) {
      widgets.add(pw.Stack(
        children: [
          pw.Image(
            pw.MemoryImage(image.readAsBytesSync()),
            width: width,
            height: height,
          ),
          pw.Positioned(
            top: nameTopPosition,
            left: nameLeftPosition,
            child: pw.Text(
              participant.participantName.firstName.toUpperCase(),
            ),
          ),
          pw.Positioned(
            top: entryTimeTopPosition,
            left: entryTimeLeftPosition,
            child: pw.Text(
              participant.entryTime.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + spaceBetweenElements,
            left: nameLeftPosition + spaceBetweenElements,
            child: pw.Text(
              participant.participantName.lastName.toUpperCase(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 2.2),
            left: nameLeftPosition,
            child: pw.Text(
              GenderEntity.fromId(participant.genderId).genderName.value,
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 3.2),
            left: nameLeftPosition + (spaceBetweenElements * 3),
            child: pw.Text(
              participant.ageDivision.divisionId.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 4.3),
            left: nameLeftPosition + 2,
            child: pw.Text(participant.club.clubName.value,
                textDirection: pw.TextDirection.rtl),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 5.2),
            left: nameLeftPosition + (spaceBetweenElements * 1.8),
            child: pw.Text(
              participant.participantId.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 6.1),
            left: nameLeftPosition + (spaceBetweenElements),
            child: pw.Column(
              children: [
                pw.Text(participant.division.divisionName.value,
                    style: const pw.TextStyle(color: PdfColors.red),
                    textScaleFactor: 0.8,
                    textDirection: pw.TextDirection.rtl),
                pw.SizedBox(width: 4),
                pw.Text(participant.specialty.specialtyName.value,
                    style: const pw.TextStyle(color: PdfColors.blue),
                    textScaleFactor: 0.8,
                    textDirection: pw.TextDirection.rtl),
              ],
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 7.4),
            left: nameLeftPosition + 15,
            child: pw.Text(
              participant.column.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 7.4),
            left: nameLeftPosition + ((spaceBetweenElements + 7) * 3),
            child: pw.Text(
              participant.series.value.toString(),
            ),
          ),
        ],
      ));
    }

    return widgets;
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.GridView(crossAxisCount: 2, children: _buildItems());
  }
}
