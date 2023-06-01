import 'dart:io';

import 'package:dive_club/core/entities/participants/export.dart';
import 'package:pdf/widgets.dart' as pw;

class PapillonPage extends pw.StatelessWidget {
  PapillonPage({required this.participants, required this.image});

  final File image;

  final List<ParticipantEntity> participants;

  pw.Widget _buildItems(ParticipantEntity participant) {
    const double nameTopPosition = 245;
    const double nameLeftPosition = 50;
    const double spaceBetweenElements = 23;
    const double entryTimeTopPosition = 215;
    const double entryTimeLeftPosition = 200;

    return pw.Stack(
      children: [
        pw.Image(pw.MemoryImage(image.readAsBytesSync())),
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
          top: nameTopPosition + (spaceBetweenElements * 2),
          left: nameLeftPosition + (spaceBetweenElements * 2.5),
          child: pw.Text(
            participant.ageDivision.divisionId.value.toString(),
          ),
        ),
        pw.Positioned(
          top: nameTopPosition + (spaceBetweenElements * 3),
          left: nameLeftPosition,
          child: pw.Text(
            participant.club.clubName.value,
          ),
        ),
        pw.Positioned(
          top: nameTopPosition + (spaceBetweenElements * 3.9),
          left: nameLeftPosition + spaceBetweenElements,
          child: pw.Text(
            participant.participantId.value.toString(),
          ),
        ),
        pw.Positioned(
          top: nameTopPosition + (spaceBetweenElements * 4.9),
          left: nameLeftPosition + (spaceBetweenElements / 2),
          child: pw.Text(
              '${participant.division.divisionName.value} ${participant.specialty.specialtyName.value}',
              textScaleFactor: 0.8),
        ),
        pw.Positioned(
          top: nameTopPosition + (spaceBetweenElements * 5.8),
          left: nameLeftPosition + 10,
          child: pw.Text(
            participant.column.value.toString(),
          ),
        ),
        pw.Positioned(
          top: nameTopPosition + (spaceBetweenElements * 5.8),
          left: nameLeftPosition + ((spaceBetweenElements + 7) * 2),
          child: pw.Text(
            participant.series.value.toString(),
          ),
        ),
      ],
    );
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        mainAxisSize: pw.MainAxisSize.max,
        children: [
          for (ParticipantEntity participant in participants)
            _buildItems(participant)
        ]);
  }
}
