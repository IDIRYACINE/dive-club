import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/infrastructure/printerService/results/results_printer.dart';

import 'excel_manager_port.dart';

abstract class PrinterPort {
  Future<void> printStartLists(EngagementsRecords engagements);

  Future<void> printEngagements(EngagementsRecords engagements);

  Future<void> printRankings(RankingsList rankings);

  Future<void> printPapillons(List<ParticipantEntity> pariticpants);

  Future<void> printCertificates(List<CompetitionScoreEntity> participants);

  Future<void> printCustomCertificate(
      CompetitionScoreEntity participant, int rank);
}
