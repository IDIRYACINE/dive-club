import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/entity.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DiveReportGenerator {
  final ExcelManagerPort excelPort;
  final DatabasePort dbPort;
  final PrinterPort printerPort;

  String engagementFilesDirectory = "diveClub/data/engagements";
  final String engagementsOutputDirectory = "diveClub/outputs/engagements";
  void setEngagementFilesDirectory(String path) {
    engagementFilesDirectory = path;
  }

  DiveReportGenerator(
      {required this.printerPort,
      required this.excelPort,
      required this.dbPort});

  Future<void> registerParticipants() async {
    final doc = await getApplicationDocumentsDirectory();
    String? selectedDirectory =
        await FilePicker.platform.getDirectoryPath().then((value) {
      String auxilary = "";
      if (!doc.path.endsWith("/")) {
        auxilary = "/";
      }

      value ??= doc.path + auxilary + engagementFilesDirectory;
      return value;
    });
    debugPrint(selectedDirectory);
    final registrations =
        await excelPort.processEngagementFiles(selectedDirectory!);

    debugPrint("registration : ${registrations.length}");

    int index = 0;
    for (ParticipantRegistration participant in registrations) {
      for (ScoreEngagement entryScore in participant.entryScores) {
        if (entryScore.score == null) {
          debugPrint("null score in clubId ${participant.clubId.value}");
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
    final EngagementsRecords engagementsRecords = [];

    const genderIds = [0, 1];
    final divisions = (await dbPort.loadDivingDivisions()).divisions;
    final ageDivisions = (await dbPort.loadAgeDivisions()).ageDivisions;
    final specialties = (await dbPort.loadDivingSpecialities()).specialties;
    final clubs = (await dbPort.loadClubs()).clubs;

    for (ClubEntity club in clubs) {
      for (int genderId in genderIds) {
        for (AgeDivisionEntity ageDvision in ageDivisions) {
          for (DivingSpecialtyEntity specialty in specialties) {
            for (DivingDivisionEntity division in divisions) {
              final options = LoadParticipantsOptions(
                  divisionId: division.divisionId.value,
                  specialityId: specialty.specialtyId.value,
                  ageDivisionId: ageDvision.divisionId.value,
                  genderId: genderId,
                  clubId: club.clubId.value);

              final participants =
                  (await dbPort.loadParticipants(options)).participants;

              if (participants.isNotEmpty) {
                engagementsRecords.add(_generateEngagements(participants));
              }
            }
          }
        }
      }
    }
    printerPort.printEngagements(engagementsRecords);
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
    }

    if (print) {
      printerPort.printStartLists(engagementsRecords);
    }

    return engagementsRecords;
  }

  Future<void> generateParticipantResults() async {
    final List<List<CompetitionScoreEntity>> resultsRecords = [];

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
              resultsRecords.add(scores);
            }
          }
        }
      }
    }

    printerPort.printRankings(resultsRecords);
  }

  Future<void> printPapillons() async {
    final options = LoadParticipantsOptions(orderBySeries: true);

    final participants = (await dbPort.loadParticipants(options)).participants;

    printerPort.printPapillons(participants);
  }
}
