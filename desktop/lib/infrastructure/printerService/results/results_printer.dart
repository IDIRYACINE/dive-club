import 'dart:typed_data';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'results_page.dart';

typedef RankingsList = List<List<CompetitionScoreEntity>>;

Future<Uint8List> createRankingsDocument(
    RankingsList rankings, TtfFont font) async {
  final pdf = Document();
  const double maxParticipantPerPage = 40;

  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  for (List<CompetitionScoreEntity> results in rankings) {
    List<CompetitionScoreEntity> participantsInPage = [];

    for (CompetitionScoreEntity participant in results) {
      participantsInPage.add(participant);
      bool reachedMaxParticipants =
          (participantsInPage.length == maxParticipantPerPage) ||
              (participant == results.last);
      if (reachedMaxParticipants) {
        _createRankingPage(participantsInPage, fontTheme, pdf);
        participantsInPage = [];
      }
    }
  }

  return pdf.save();
}

void _createRankingPage(
    List<CompetitionScoreEntity> scores, ThemeData fontTheme, Document pdf) {
  pdf.addPage(
    Page(
      theme: fontTheme,
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return RankingsPage(scores);
      },
    ),
  );
}
