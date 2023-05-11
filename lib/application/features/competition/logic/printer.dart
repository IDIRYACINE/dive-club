import 'dart:io';
import 'dart:typed_data';

import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../ui/printer/page.dart';

class CompetitionPrinter {
  late pw.Document _pdf;
  final double _maxParticipantPerPage = 15;

  void prepareNewDocument() {
    _pdf = pw.Document();
  }

  Future<Uint8List> createRankingsDocument(
      List<CompetitionScoreEntity> scores) async {
    List<CompetitionScoreEntity> scoresInPage = [];
    for (CompetitionScoreEntity participant in scores) {
      scoresInPage.add(participant);
      bool reachedMaxParticipants =
          (scoresInPage.length == _maxParticipantPerPage) ||
              (participant == scores.last);
      if (reachedMaxParticipants) {
        _createRankingPage(scoresInPage);
        scoresInPage = [];
      }
    }

    return _pdf.save();
  }

  Future<Uint8List> createCertifiactesDocument(
      List<CompetitionScoreEntity> scores) async {
    const maxPages = 3;
    final length = scores.length >= maxPages ? maxPages : scores.length;

    for (int i = 0; i < length; i++) {
      final participant = scores[i];
      _createCertificatePage(participant);
    }

    return _pdf.save();
  }

  void _createRankingPage(List<CompetitionScoreEntity> scores) {
    _pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return RankingsPage(scores);
        },
      ),
    );
  }

  void _createCertificatePage(CompetitionScoreEntity score) {
    File image = File('assets/images/certificate.png');

    _pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        orientation: pw.PageOrientation.landscape,
        build: (pw.Context context) {
          return CertificatePage(participant: score, image: image);
        },
      ),
    );
  }

  Future<void> displayPreview(BuildContext context) async {
    final dialog = PrinterDialog(preparedDoc: await _pdf.save());

    NavigationService.displayDialog(dialog);
  }
}
