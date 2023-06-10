import 'dart:typed_data';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'results_page.dart';

Future<Uint8List> createRankingsDocument(
    List<CompetitionScoreEntity> scores, TtfFont font) async {
  final pdf = Document();
  const double maxParticipantPerPage = 15;

  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  List<CompetitionScoreEntity> scoresInPage = [];
  for (CompetitionScoreEntity participant in scores) {
    scoresInPage.add(participant);
    bool reachedMaxParticipants =
        (scoresInPage.length == maxParticipantPerPage) ||
            (participant == scores.last);
    if (reachedMaxParticipants) {
      _createRankingPage(scoresInPage, fontTheme, pdf);
      scoresInPage = [];
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
