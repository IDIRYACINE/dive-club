import 'dart:typed_data';

import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'startlists_page.dart';

Future<Uint8List> createStartListsDocument(
    EngagementsRecords engagements, TtfFont font) async {
  final pdf = Document();
  const double maxParticipantPerPage = 40;

  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  for (List<ParticipantEngagement> engagement in engagements) {

    List<ParticipantEngagement> participantsInPage = [];

    for (ParticipantEngagement participant in engagement) {
      participantsInPage.add(participant);
      bool reachedMaxParticipants =
          (participantsInPage.length == maxParticipantPerPage) ||
              (participant == engagement.last);
      if (reachedMaxParticipants) {
        _createNewPage(participantsInPage, fontTheme, pdf);
        participantsInPage = [];
      }
    }
  }

  return pdf.save();
}

void _createNewPage(
    List<ParticipantEngagement> participants, ThemeData fontTheme, Document pdf) {
  pdf.addPage(
    Page(
      theme: fontTheme,
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return ParticipantsPage(participants);
      },
    ),
  );
}