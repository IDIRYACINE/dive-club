import 'dart:typed_data';

import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'startlists_page.dart';

Future<Uint8List> createStartListsDocument(
    EngagementsRecords engagements, TtfFont font,
    {bool clubs = false}) async {
  final pdf = Document();
  const double maxParticipantPerPage = 25;

  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  String currentClub = "None";

  for (List<ParticipantEngagement> engagement in engagements) {
    List<ParticipantEngagement> participantsInPage = [];

    final club = engagement.first.clubName.value;

    if (clubs && !(club == currentClub)) {
      currentClub = engagement.first.clubName.value;

      _createClubPage(
        engagement.first.clubName,
        fontTheme,
        pdf,
      );
    }


    for (ParticipantEngagement participant in engagement) {
      final int totalParticipants = engagement.length;

      participantsInPage.add(participant);

      bool reachedMaxParticipants =
          (participantsInPage.length == maxParticipantPerPage) ||
              (participant == engagement.last);
      if (reachedMaxParticipants) {
        _createNewPage(participantsInPage, fontTheme, pdf, totalParticipants);
        participantsInPage = [];
      }
    }
  }

  return pdf.save();
}

void _createClubPage(ClubName clubName, ThemeData fontTheme, Document pdf) {
  pdf.addPage(
    Page(
      margin: const EdgeInsets.all(10),
      theme: fontTheme,
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return ClubPage(clubName.value);
      },
    ),
  );
}

void _createNewPage(List<ParticipantEngagement> participants,
    ThemeData fontTheme, Document pdf, int totalParticipants) {
  pdf.addPage(
    Page(
      margin: const EdgeInsets.all(10),
      theme: fontTheme,
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return ParticipantsPage(participants, totalParticipants);
      },
    ),
  );
}
