import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/entity.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';

class DiveReportGenerator {
  final ExcelManagerPort excelPort;
  final DatabasePort dbPort;
  final PrinterPort printerPort;

  final String engagementFilesDirectory = "diveClub/data/engagements";
  final String engagementsOutputDirectory = "diveClub/outputs/engagements";

  DiveReportGenerator(
      {required this.printerPort,
      required this.excelPort,
      required this.dbPort});

  Future<void> registerParticipants() async {
    final registrations =
        await excelPort.processEngagementFiles(engagementFilesDirectory);

    int index = 100;
    for (ParticipantRegistration participant in registrations) {
      for (ScoreEngagement entryScore in participant.entryScores) {
        if (entryScore.score == null) {
          continue;
        }

        final options = CreateParticipantOptions(
            divisionId: entryScore.divisionId.value,
            id: index,
            firstName: participant.participantName.firstName,
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
          ageDivisionId: participant.ageDivision.divisionId,
          ageDivisionName: participant.ageDivision.divisionName,
          clubName: participant.club.clubName,
          divisionName: participant.division.divisionName,
          specialtyName: participant.specialty.specialtyName,
          gender: GenderEntity.fromId(participant.genderId),
          entryScore: participant.entryTime);

      columnIndex++;
      currentSeriesParticipants++;

      engagements.add(engagement);
    }

    return engagements;
  }

  Future<void> generateStartListReport() async {
    final engagements = await generateParticipantsSeries(updateDb: true);

    excelPort.exportStartListFile(engagementsOutputDirectory, engagements);
  }

  Future<void> generateEngagementsReport() async {
    final clubs = (await dbPort.loadClubs()).clubs;

    for (ClubEntity club in clubs) {
      final options = LoadParticipantsOptions(clubId: club.clubId.value);

      final participants =
          (await dbPort.loadParticipants(options)).participants;

      final List<ParticipantEngagement> engagements = [];

      for (ParticipantEntity participant in participants) {
        final engagement = ParticipantEngagement(
            column: participant.column,
            participantId: participant.participantId,
            series: participant.series.value,
            participantName: participant.participantName,
            ageDivisionId: participant.ageDivision.divisionId,
            clubName: club.clubName,
            divisionName: participant.division.divisionName,
            specialtyName: participant.specialty.specialtyName,
            gender: GenderEntity.fromId(participant.genderId),
            entryScore: participant.entryTime,
            ageDivisionName: participant.ageDivision.divisionName);

        engagements.add(engagement);
      }

      excelPort.exportEngagementsFiles(engagementsOutputDirectory, engagements);
    }
  }

  Future<EngagementsRecords> generateParticipantsSeries(
      {bool updateDb = true, bool print = true}) async {
    final EngagementsRecords engagementsRecords = [];

    const genderIds = [0, 1];
    final divisions = (await dbPort.loadDivingDivisions()).divisions;
    final ageDivisions = (await dbPort.loadAgeDivisions()).ageDivisions;
    final specialties = (await dbPort.loadDivingSpecialities()).specialties;

    for (int genderId in genderIds) {
      for (AgeDivisionEntity ageDvision in ageDivisions) {
        for (DivingSpecialtyEntity specialty in specialties) {
          for (DivingDivisionEntity division in divisions) {
            final options = LoadParticipantsOptions(
                divisionId: division.divisionId.value,
                specialityId: specialty.specialtyId.value,
                ageDivisionId: ageDvision.divisionId.value,
                genderId: genderId);

            final participants =
                (await dbPort.loadParticipants(options)).participants;

            if (participants.isNotEmpty) {
              engagementsRecords.add(_generateEngagements(participants));
            }
          }
        }
      }

      if (updateDb) {
        for (List<ParticipantEngagement> engagements in engagementsRecords) {
          dbPort.updateParticipantsSeries(engagements);
        }
      }

      if (print) {
        printerPort.printStartLists(engagementsRecords);
      }
    }

    return engagementsRecords;
  }

  Future<void> generateParticipantResults() async {
    final ResultsRecords resultsRecords = [];

    const genderIds = [0, 1];
    final divisions = (await dbPort.loadDivingDivisions()).divisions;
    final ageDivisions = (await dbPort.loadAgeDivisions()).ageDivisions;
    final specialties = (await dbPort.loadDivingSpecialities()).specialties;

    for (int genderId in genderIds) {
      for (AgeDivisionEntity ageDvision in ageDivisions) {
        for (DivingSpecialtyEntity specialty in specialties) {
          for (DivingDivisionEntity division in divisions) {
            final options = LoadCompetitionScoresOptions(
                divisionId: division.divisionId.value,
                specialityId: specialty.specialtyId.value,
                ageDivisionId: ageDvision.divisionId.value,
                genderId: genderId);

            final scores = (await dbPort.loadCompetitionScores(options)).scores;

            if (scores.isNotEmpty) {
              resultsRecords.add(_generateParticipantResults(scores));
            }
          }
        }
      }
    }

    excelPort.exportResultsFile(engagementsOutputDirectory, resultsRecords);

  }

  List<ParticipantResult> _generateParticipantResults(
      List<CompetitionScoreEntity> scores) {
    final List<ParticipantResult> results = [];

    for (CompetitionScoreEntity score in scores) {
      final result = ParticipantResult(
          column: score.column,
          ageDivisionName: score.ageDivision.divisionName,
          participantId: score.participantId,
          series: score.series,
          participantName: score.participantName,
          ageDivision: score.ageDivision,
          clubName: score.club.clubName,
          divisionName: score.divisionName,
          specialtyName: score.specialtyName,
          gender: score.gender.genderName,
          score: score.score);
      results.add(result);
    }

    return results;
  }

  Future<void> printPapillons() async {
    final options = LoadParticipantsOptions(orderBySeries: true);

    final participants = (await dbPort.loadParticipants(options)).participants;

    printerPort.printPapillons(participants);
  }
}
