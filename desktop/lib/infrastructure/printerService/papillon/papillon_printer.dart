import 'dart:io';
import 'dart:typed_data';
import 'package:dive_club/resources/resources.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:dive_club/core/entities/participants/export.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import 'papillons_page.dart';

Future<Uint8List> createPapillonsDocument(List<ParticipantEntity> entities,
    [TtfFont? loadedFont]) async {
  final pdf = pw.Document();

  final font =
      loadedFont ?? await fontFromAssetBundle('assets/fonts/Tahoma.ttf');
  final fontTheme = pw.ThemeData.withFont(
      base: font, bold: font, italic: font, boldItalic: font);

  int itemsPerPage = 6;
  final length = (entities.length);
  final pageNumbers = (length) / itemsPerPage;

  for (int i = 0; i < pageNumbers; i++) {
    final List<ParticipantEntity> participants = [];

    int itemsInPage = 0;
    int index = itemsInPage + (i * itemsPerPage);

    while ((index <= (length - 1)) && (itemsInPage < itemsPerPage)) {
      index = itemsInPage + (i * itemsPerPage);
      participants.add(entities[index]);
      itemsInPage++;
      index = itemsInPage + (i * itemsPerPage);
    }

    _createPapillonsPage(participants, fontTheme, pdf);
  }

  return pdf.save();
}

void _createPapillonsPage(
    List<ParticipantEntity> entity, pw.ThemeData fontTheme, Document pdf) {
  File image = File(AppResources.papillons);

  const double margin = 0;

  final width = (PdfPageFormat.a4.width - margin) / 2;
  final height = (PdfPageFormat.a4.height - margin) / 2;

  pdf.addPage(
    pw.Page(
      theme: fontTheme,
      margin: const pw.EdgeInsets.all(margin),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (pw.Context context) {
        return PapillonPage(
          participants: entity,
          image: image,
          width: width,
          height: height,
        );
      },
    ),
  );
}
