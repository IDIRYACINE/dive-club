import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';

class ReportStartList {
  final ExcelManagerPort excelPort;
  final DatabasePort dbPort;

  final String engagementFilesDirectory = "diveClub/data/engagements";
  final String engagementsOutputDirectory = "diveClub/outputs/engagements";

  ReportStartList({required this.excelPort, required this.dbPort});

  Future<void> registerParticipants() async {
    final registrations =
        await excelPort.processEngagementFiles(engagementFilesDirectory);

    int index = 100;

    for (ParticipantRegistration participant in registrations) {
      for (ScoreEngagement entryScore in participant.entryScores) {
        if (entryScore.score == null) {
          continue;
        }

        final birthDate = DateTime(participant.ageDivisionId.value);

        final options = CreateParticipantOptions(
            divisionId: entryScore.divisionId.value,
            id: index,
            firstName: participant.participantName.firstName,
            birthDate: birthDate,
            specialityId: entryScore.specialtyId.value,
            clubId: participant.clubId.value,
            entryTime: entryScore.score!.toIntCode(),
            genderId: participant.genderId.value,
            lastName: participant.participantName.lastName,
            ageDivisionId: participant.ageDivisionId.value);

        index++;

        dbPort.insertParticipant(options);
      }
    }
  }

  List<ParticipantEngagement> _generateEngagements(
      List<ParticipantEntity> participants) {
    final List<ParticipantEngagement> engagements = [];

    final List<int> columns = [3, 2, 4, 1, 5];

    int columnIndex = 0;
    int series = 1;
    int currentSeriesParticipants = 0;
    int maxSerieParticipantCount = 5;

    for (ParticipantEntity participant in participants) {
      if (currentSeriesParticipants >= maxSerieParticipantCount) {
        currentSeriesParticipants = 0;
        series++;
      }

      if (columnIndex >= columns.length) {
        columnIndex = 0;
      }

      final engagement = ParticipantEngagement(
          column: ParticipantColumn.from(columns[columnIndex]),
          participantId: participant.participantId,
          series: series,
          participantName: participant.participantName,
          ageDivisionId: participant.ageDivisionId,
          clubId: participant.clubId,
          divisionName: participant.divisionName,
          specialtyName: participant.specialtyName,
          gender: participant.genderId.value == 0
              ? GenderName.male()
              : GenderName.female(),
          entryScore: participant.entryTime);

      columnIndex++;
      currentSeriesParticipants++;

      engagements.add(engagement);
    }

    return engagements;
  }

  Future<void> generateStartListReport() async {
    if (!excelPort.isFileProcessed) {
      await registerParticipants();
    }

    final options = LoadParticipantsOptions();

    final participants = (await dbPort.loadParticipants(options)).participants;
    final engagements = _generateEngagements(participants);
    dbPort.updateParticipantsSeries(engagements);

    excelPort.exportStartListFile(engagementsOutputDirectory, engagements);
  }

  Future<void> generateEngagementsReport() async {
    final clubs = (await dbPort.loadClubs()).clubs;

    for (ClubEntity club in clubs) {
      final options = LoadParticipantsOptions(clubId: club.clubId.value);

      final participants =
          (await dbPort.loadParticipants(options)).participants;

      final engagements = _generateEngagements(participants);

      excelPort.exportEngagementsFiles(engagementsOutputDirectory, engagements);
    }
  }
}
