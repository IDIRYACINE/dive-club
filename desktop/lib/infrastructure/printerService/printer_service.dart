import 'dart:io';

import 'package:dive_club/application/commons/dialogs/common.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/participants/entity.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';
import 'package:dive_club/infrastructure/printerService/results/results_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;

import 'certaficates/certificate_printer.dart';
import 'dialogs.dart';
import 'papillon/papillon_printer.dart';
import 'startLists/startlists_printer.dart';

class PrinterService implements PrinterPort {
  static const papillonFileName = "papillon";
  static const startListsFileName = "startlists";
  static const engagementsFileName = "engagements";
  static const rankingsFileName = "rankings";

  final DatabasePort databasePort;
  late pw.TtfFont font;

  PrinterService({required this.databasePort}) {
    fontFromAssetBundle('assets/fonts/Tahoma.ttf')
        .then((value) => font = value);
  }

  @override
  Future<void> printCertificates(
      List<CompetitionScoreEntity> participants) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final participants =
          message["participants"] as List<CompetitionScoreEntity>;
      final font = message["font"] as pw.TtfFont;
      return await createCertifiactesDocument(participants, font);
    }, {"participants": participants, "font": font}).then((binaryDocument) {
      _displayPreview(binaryDocument);
    });
  }

  @override
  Future<void> printCustomCertificate(
      CompetitionScoreEntity participant, int rank) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final participants = message["participant"] as CompetitionScoreEntity;
      final font = message["font"] as pw.TtfFont;
      final rank = message["rank"] as int;
      return await createCustomCertificateDocument(participants, rank, font);
    }, {"participant": participant, "font": font, "rank": rank})
        .then((binaryDocument) {
      _displayPreview(binaryDocument);
    });
  }

  @override
  Future<void> printEngagements(
    EngagementsRecords engagements,
  ) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final engagements = message["engagements"] as EngagementsRecords;
      final font = message["font"] as pw.TtfFont;
      return await createStartListsDocument(engagements, font, clubs: true);
    }, {"engagements": engagements, "font": font}).then(
        (doc) => _printWithoutPreview(doc, engagementsFileName, engagementsFileName));
  }

  @override
  Future<void> printPapillons(List<ParticipantEntity> pariticpants) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final participants = message["participants"] as List<ParticipantEntity>;
      final font = message["font"] as pw.TtfFont;
      return await createPapillonsDocument(participants, font);
    }, {"participants": pariticpants, "font": font}).then(
        (doc) => _printWithoutPreview(doc, papillonFileName, papillonFileName));
  }

  @override
  Future<void> printRankings(RankingsList rankings) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final rankings =
          message["rankings"] as List<List<CompetitionScoreEntity>>;
      final font = message["font"] as pw.TtfFont;
      return await createRankingsDocument(rankings, font);
    }, {"rankings": rankings, "font": font}).then(
        (doc) => _printWithoutPreview(doc, rankingsFileName, rankingsFileName));
  }

  @override
  Future<void> printStartLists(EngagementsRecords engagements) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());
    compute((message) async {
      final engagements = message["engagements"] as EngagementsRecords;
      final font = message["font"] as pw.TtfFont;
      return await createStartListsDocument(engagements, font);
    }, {"engagements": engagements, "font": font})
        .then((doc) => _printWithoutPreview(doc, startListsFileName, startListsFileName));
  }

  void _displayPreview(Uint8List preparedDocBytes) async {
    final dialog = PrinterDialog(preparedDoc: preparedDocBytes);
    NavigationService.replaceDialog(dialog);
  }

  // ignore: unused_element
  Future<void> _printDoc(
      Uint8List preparedDocBytes, String fileName, String prePath) async {
    final output = await getApplicationDocumentsDirectory();
    File('${output.path}/diveClub/outputs/$prePath/$fileName.pdf')
        .create(recursive: true)
        .then((File file) {
      file.writeAsBytesSync(preparedDocBytes);
      NavigationService.replaceDialog(ConfirmationDialog(
        title: "",
        content: file.path,
        onConfirm: () {
          _docPreview('${output.path}/diveClub/outputs/$prePath/$fileName.pdf');
          NavigationService.pop();
        },
      ));
    });
  }

  Future<void> _printWithoutPreview(
      Uint8List preparedDocBytes, String fileName, String prePath) async {
    final output = await getApplicationDocumentsDirectory();
    File('${output.path}/diveClub/outputs/$prePath/$fileName.pdf')
        .create(recursive: true)
        .then((File file) async {
      await file.writeAsBytes(preparedDocBytes);
      NavigationService.replaceDialog(ConfirmationDialog(
        title: "",
        content: file.path,
        onConfirm: () {
          NavigationService.pop();
        },
      ));
    });
  }

  Future<void> _docPreview(String path) async {
    await OpenDocument.openDocument(filePath: path)
        .then((value) {})
        .onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
