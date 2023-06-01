import 'dart:io';

import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../ui/printer/page.dart';

class CompetitionPrinter {
  late pw.Document _pdf;
  final double _maxParticipantPerPage = 15;

  void prepareNewDocument() {
    _pdf = pw.Document();
  }

  Future<Uint8List> createRankingsDocument(
      List<CompetitionScoreEntity> scores) async {
     final font = await fontFromAssetBundle('assets/fonts/Tahoma.ttf');
    final fontTheme = pw.ThemeData.withFont(
        base: font, bold: font, italic: font, boldItalic: font);

    List<CompetitionScoreEntity> scoresInPage = [];
    for (CompetitionScoreEntity participant in scores) {
      scoresInPage.add(participant);
      bool reachedMaxParticipants =
          (scoresInPage.length == _maxParticipantPerPage) ||
              (participant == scores.last);
      if (reachedMaxParticipants) {
        _createRankingPage(scoresInPage, fontTheme);
        scoresInPage = [];
      }
    }

    return _pdf.save();
  }

  Future<Uint8List> createCertifiactesDocument(
      List<CompetitionScoreEntity> scores) async {
        final font = await fontFromAssetBundle('assets/fonts/Tahoma.ttf');
    final fontTheme = pw.ThemeData.withFont(
        base: font, bold: font, italic: font, boldItalic: font);

    const maxPages = 3;
    final length = scores.length >= maxPages ? maxPages : scores.length;

    final List<File> images = [];
    images.add(File(AppResources.certificateGold));
    images.add(File(AppResources.certificateSilver));
    images.add(File(AppResources.certificateBronze));


    for (int i = 0; i < length; i++) {
      final participant = scores[i];
      _createCertificatePage(participant, fontTheme,images[i]);
    }

    return _pdf.save();
  }

  void _createRankingPage(
      List<CompetitionScoreEntity> scores, pw.ThemeData fontTheme) {
    _pdf.addPage(
      pw.Page(
        theme: fontTheme,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return RankingsPage(scores );
        },
      ),
    );
  }

  void _createCertificatePage(
      CompetitionScoreEntity score, pw.ThemeData fontTheme,File image) {

    _pdf.addPage(
      pw.Page(
        theme: fontTheme,
        pageFormat: PdfPageFormat.a4,
        orientation: pw.PageOrientation.landscape,
        build: (pw.Context context) {
          return CertificatePage( participant: score, image: image);
        },
      ),
    );
  }

  Future<void> displayPreview() async {
    final dialog = PrinterDialog(preparedDoc: await _pdf.save());

    NavigationService.displayDialog(dialog);
  }
}
