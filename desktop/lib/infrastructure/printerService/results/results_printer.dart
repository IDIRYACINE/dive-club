import 'dart:typed_data';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
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

  DivisionId cDivision = DivisionId(-1);
  SpecialtyId cSpecialty = SpecialtyId(-1);
  AgeDivisionId cAgeDivision = AgeDivisionId(-1);
  GenderId cGender = GenderId(-1);

  int rank = 1;

  for (List<CompetitionScoreEntity> results in rankings) {
    List<CompetitionScoreEntity> participantsInPage = [];

    final ageId = results.first.ageDivision.divisionId;
    final specialtyId = results.first.specialtyId;
    final divisionId = results.first.divisionId;
    final genderId = results.first.gender.genderId;

    final sameAge = ageId.equals(cAgeDivision);
    final sameSpecialty = specialtyId.equals(cSpecialty);
    final sameDivision = divisionId.equals(cDivision);
    final sameGender = genderId.equals(cGender);

    if (!sameAge || !sameSpecialty || !sameDivision || !sameGender) {
      rank = 1;
      cDivision = divisionId;
      cAgeDivision = ageId;
      cGender = genderId;
      cSpecialty = specialtyId;
    }

    for (CompetitionScoreEntity participant in results) {
      participantsInPage.add(participant);
      bool reachedMaxParticipants =
          (participantsInPage.length == maxParticipantPerPage) ||
              (participant == results.last);
      if (reachedMaxParticipants) {
        _createRankingPage(participantsInPage, rank, fontTheme, pdf);

        rank += participantsInPage.length;
        participantsInPage = [];
      }
    }
  }

  return pdf.save();
}

void _createRankingPage(List<CompetitionScoreEntity> scores, int currRank,
    ThemeData fontTheme, Document pdf) {
  pdf.addPage(
    Page(
      theme: fontTheme,
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return RankingsPage(scores, currRank);
      },
    ),
  );
}
