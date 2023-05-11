
import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../ui/printer/page.dart';

class ParticipantsPrinter {
  late pw.Document pdf;
  final double _maxParticipantPerPage = 15;

  void prepareNewDocument() {
    pdf = pw.Document();
  }

  Future<void> createDocument(List<ParticipantEntity> participants) async {

     
    List<ParticipantEntity> participantsInPage = [];
    for (ParticipantEntity participant in participants) {
      participantsInPage.add(participant);
      bool reachedMaxParticipants = (participantsInPage.length == _maxParticipantPerPage) || (participant == participants.last);
      if (reachedMaxParticipants) {
        _createNewPage(participantsInPage);
        participantsInPage = [];
      }
    }
  }

  void _createNewPage(List<ParticipantEntity> participants) {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return ParticipantsPage(participants);
        },
      ),
    );
  }

  Future<void> displayPreview(BuildContext context) async {
    final dialog = PrinterDialog(preparedDoc: await pdf.save());

    NavigationService.displayDialog(dialog);
  }
}
