import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';

typedef EngagementsRecords = List<List<ParticipantEngagement>>;
typedef ResultsRecords  = List<List<ParticipantResult>>;

class ScoreEngagement {
  final DivisionId divisionId;
  final SpecialtyId specialtyId;

  final Score? score;

  ScoreEngagement(
      {required this.divisionId, required this.specialtyId, this.score});
}

class RegistrationCandidat {
  final ParticipantName? participantName;
  final AgeDivisionId? ageDivisionId;
  final ClubId? clubId;
  final GenderEntity? genderEntity;

  final List<ScoreEngagement?>? entryScores;

  RegistrationCandidat(
      {this.participantName,
      this.ageDivisionId,
      this.clubId,
      this.genderEntity,
      this.entryScores});
}

class ParticipantRegistration {
  final ParticipantName participantName;
  final AgeDivisionId ageDivisionId;
  final ClubId clubId;
  final GenderId genderId;

  final List<ScoreEngagement> entryScores;

  ParticipantRegistration(
      {required this.participantName,
      required this.ageDivisionId,
      required this.clubId,
      required this.genderId,
      required this.entryScores});
}

class ParticipantEngagement {
  final ParticipantColumn column;
  final int series;
  final DivisionName divisionName;
  final SpecialtyName specialtyName;
  final ParticipantName participantName;
  final AgeDivisionId ageDivisionId;
  final ClubName clubName;
  final GenderEntity gender;
  final AgeDivisionName ageDivisionName;
  final ParticipantId participantId;

  final Score entryScore;

  ParticipantEngagement(
      {required this.column,
      required this.ageDivisionName,
      required this.participantId,
      required this.series,
      required this.participantName,
      required this.ageDivisionId,
      required this.clubName,
      required this.divisionName,
      required this.specialtyName,
      required this.gender,
      required this.entryScore});
}

class ParticipantResult {
  final ParticipantColumn column;
  final ParticipantSeries series;
  final DivisionName divisionName;
  final SpecialtyName specialtyName;
  final ParticipantName participantName;
  final AgeDivisionEntity ageDivision;
  final ClubName clubName;
  final GenderName gender;
  final AgeDivisionName ageDivisionName;
  final ParticipantId participantId;

  final Score score;

  ParticipantResult(
      {required this.column,
      required this.ageDivisionName,
      required this.participantId,
      required this.series,
      required this.participantName,
      required this.ageDivision,
      required this.clubName,
      required this.divisionName,
      required this.specialtyName,
      required this.gender,
      required this.score});
}

abstract class ExcelManagerPort {
  Future<void> exportStartListFile(
      String outputDirectory, EngagementsRecords engagements);

  Future<void> exportEngagementsFiles(
      String outputDirectory, List<ParticipantEngagement> engagements);

  Future<List<ParticipantRegistration>> processEngagementFiles(
      String inputDirectory);

  Future<void> exportResultsFile(
      String outputDirectory, ResultsRecords scores);

  bool get isFileProcessed;
  List<ParticipantRegistration> get processedParticipants;
}
