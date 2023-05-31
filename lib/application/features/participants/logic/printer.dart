import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../ui/printer/page.dart';


class ParticipantsPrinter {
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

  Future<void> displayPreview() async {
    final dialog = PrinterDialog(preparedDoc: await pdf.save());

    NavigationService.displayDialog(dialog);
  }
}
