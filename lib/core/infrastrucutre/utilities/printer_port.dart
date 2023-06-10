import 'package:dive_club/core/entities/competition/export.dart';

import 'excel_manager_port.dart';

abstract class PrinterPort {
  Future<void> printStartLists(EngagementsRecords engagements);

  Future<void> printEngagements(List<ParticipantEngagement> engagements);

  Future<void> printResultsFile(ResultsRecords scores);

  Future<void> printPapillons();

  Future<void> printCertificates(List<CompetitionScoreEntity> participants);

  Future<void> printCustomCertificate(
      CompetitionScoreEntity participant, int rank);
}
