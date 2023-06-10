import 'dart:io';
import 'dart:typed_data';

import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import 'page.dart';
import 'papillons_page.dart';

class PapillonPrinter {
  late pw.Document pdf;
  final double _maxParticipantPerPage = 15;

  void prepareNewDocument() {
    pdf = pw.Document();
  }

  Future<void> createDocument(List<ParticipantEntity> participants) async {
    final font = await fontFromAssetBundle('assets/fonts/Tahoma.ttf');
    final fontTheme = pw.ThemeData.withFont(
        base: font, bold: font, italic: font, boldItalic: font);

    List<ParticipantEntity> participantsInPage = [];
    for (ParticipantEntity participant in participants) {
      participantsInPage.add(participant);
      bool reachedMaxParticipants =
          (participantsInPage.length == _maxParticipantPerPage) ||
              (participant == participants.last);
      if (reachedMaxParticipants) {
        _createNewPage(participantsInPage, fontTheme);
        participantsInPage = [];
      }
    }
  }

  void _createNewPage(
      List<ParticipantEntity> participants, pw.ThemeData fontTheme) {
    pdf.addPage(
      pw.Page(
        theme: fontTheme,
        pageFormat: PdfPageFormat.a4,
        
        build: (pw.Context context) {
          return ParticipantsPage(participants);
        },
      ),
    );
  }

  Future<Uint8List> createPapillonsDocument(
      List<ParticipantEntity> entities,[TtfFont? loadedFont]) async {
    final font = loadedFont ?? await fontFromAssetBundle('assets/fonts/Tahoma.ttf');
    final fontTheme = pw.ThemeData.withFont(
        base: font, bold: font, italic: font, boldItalic: font);

    int itemsPerPage = 6;
    final length = (entities.length );
    final pageNumbers = (length) / itemsPerPage;

    for (int i = 0; i < pageNumbers; i ++) {
      final List<ParticipantEntity> participants = [];      

      int itemsInPage = 0;
      int index = itemsInPage + (i * itemsPerPage);


      while((index <= (length-1)) && (itemsInPage < itemsPerPage)  ){

        index = itemsInPage + (i * itemsPerPage);
        participants.add(entities[index]);
        itemsInPage++;
        index = itemsInPage + (i * itemsPerPage);

      }

      _createPapillonsPage(participants, fontTheme);
    }

    return pdf.save();
  }

  void _createPapillonsPage(
      List<ParticipantEntity> entity, pw.ThemeData fontTheme) {
    File image = File(AppResources.papillons);

    const double margin = 0;

    final width = ( PdfPageFormat.a4.width - margin) / 2;
    final height =( PdfPageFormat.a4.height - margin) / 2;

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

  Future<void> displayPreview([Uint8List? preparedDocBytes]) async {
    final dialog = PrinterDialog(preparedDoc: preparedDocBytes ?? await pdf.save());

    NavigationService.displayDialog(dialog);
  }
}
