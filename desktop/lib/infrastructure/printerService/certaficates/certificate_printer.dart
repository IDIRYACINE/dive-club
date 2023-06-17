import 'dart:io';
import 'dart:typed_data';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'certificate_page.dart';

Future<Uint8List> createCustomCertificateDocument(
    CompetitionScoreEntity score, int rank, TtfFont font) async {
  final pdf = Document();
  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  final List<File> images = [];
  images.add(File(AppResources.certificateGold));
  images.add(File(AppResources.certificateSilver));
  images.add(File(AppResources.certificateBronze));

  int imageIndex = rank - 1;
  imageIndex = imageIndex < 0 ? 0 : imageIndex;
  imageIndex = imageIndex > 2 ? 2 : imageIndex;

  _createCertificatePage(score, fontTheme, images[imageIndex], pdf);

  return pdf.save();
}

Future<Uint8List> createCertifiactesDocument(
    List<CompetitionScoreEntity> scores, TtfFont font) async {
  final pdf = Document();
  final fontTheme = ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  const maxPages = 3;
  final length = scores.length >= maxPages ? maxPages : scores.length;

  final List<File> images = [];
  images.add(File(AppResources.certificateGold));
  images.add(File(AppResources.certificateSilver));
  images.add(File(AppResources.certificateBronze));

  for (int i = 0; i < length; i++) {
    final participant = scores[i];
    _createCertificatePage(participant, fontTheme, images[i], pdf);
  }

  return pdf.save();
}

void _createCertificatePage(CompetitionScoreEntity score, ThemeData fontTheme,
    File image, Document pdf) {
  pdf.addPage(
    Page(
      theme: fontTheme,
      margin: const EdgeInsets.all(0),
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.landscape,
      build: (Context context) {
        return CertificatePage(participant: score, image: image);
      },
    ),
  );
}
