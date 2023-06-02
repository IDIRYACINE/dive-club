import 'dart:io';

import 'package:dive_club/core/entities/participants/export.dart';
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
    const double nameTopPosition = 70;
    const double nameLeftPosition = 50;
    const double spaceBetweenElements = 20;
    const double entryTimeTopPosition = 85;
    const double entryTimeLeftPosition = 210;
    

    List<pw.Widget> widgets = [];

    for (ParticipantEntity participant in participants) {
      widgets.add(pw.Stack(
        children: [
          pw.Image(pw.MemoryImage(image.readAsBytesSync()),
              width: width, height: height,),
          pw.Positioned(
            top: nameTopPosition,
            left: nameLeftPosition,
            child: pw.Text(
              participant.participantName.firstName,
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
              participant.participantName.lastName,
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 2.2),
            left: nameLeftPosition + (spaceBetweenElements * 4),
            child: pw.Text(
              participant.ageDivision.divisionId.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 3.3),
            left: nameLeftPosition + 2,
            child: pw.Text(
              participant.club.clubName.value,
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 4.2),
            left: nameLeftPosition + (spaceBetweenElements * 1.8),
            child: pw.Text(
              participant.participantId.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 5.4),
            left: nameLeftPosition + (spaceBetweenElements ),
            child: pw.Text(
                '${participant.division.divisionName.value} ${participant.specialty.specialtyName.value}',
                textScaleFactor: 0.8,
                textDirection: pw.TextDirection.rtl),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 6.4),
            left: nameLeftPosition + 15,
            child: pw.Text(
              participant.column.value.toString(),
            ),
          ),
          pw.Positioned(
            top: nameTopPosition + (spaceBetweenElements * 6.4),
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
