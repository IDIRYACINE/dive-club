import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/participants/entity.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';
import 'package:flutter/foundation.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;

import 'certaficates/certificate_printer.dart';
import 'dialogs.dart';
import 'papillon/papillon_printer.dart';
import 'startLists/startlists_printer.dart';

class PrinterService implements PrinterPort {
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
      return await createCustomCertificateDocument(participants, rank, font);
    }, {"participant": participant, "font": font}).then((binaryDocument) {
      _displayPreview(binaryDocument);
    });
  }

  @override
  Future<void> printEngagements(List<ParticipantEngagement> engagements) {
    // TODO: implement printEngagements
    throw UnimplementedError();
  }

  @override
  Future<void> printPapillons() async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    final options = LoadParticipantsOptions(orderBySeries: true);

    final participants =
        (await databasePort.loadParticipants(options)).participants;

    compute((message) async {
      final participants = message["participants"] as List<ParticipantEntity>;
      final font = message["font"] as pw.TtfFont;
      return await createPapillonsDocument(participants, font);
    }, {"participants": participants, "font": font}).then((binaryDocument) {
      _displayPreview(binaryDocument);
    });
  }

  @override
  Future<void> printResultsFile(ResultsRecords scores) {
    // TODO: implement printResultsFile
    throw UnimplementedError();
  }

  @override
  Future<void> printStartLists(EngagementsRecords engagements) async {
    NavigationService.displayDialog(const PreparingPrinterDialog());

    compute((message) async {
      final engagements = message["engagements"] as EngagementsRecords;
      final font = message["font"] as pw.TtfFont;
      return await createStartListsDocument(engagements, font);
    }, {"engagements": engagements, "font": font}).then((binaryDocument) {
      _displayPreview(binaryDocument);
    });
  }

  void _displayPreview(Uint8List preparedDocBytes) async {
    final dialog = PrinterDialog(preparedDoc: preparedDocBytes);
    NavigationService.replaceDialog(dialog);
  }



}
