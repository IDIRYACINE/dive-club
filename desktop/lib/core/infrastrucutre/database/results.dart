import 'package:dive_club/core/entities/clubs/entity.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';


class DatabaseOperationResult {
  DatabaseOperationResult({
    bool? isSuccess,
    String? message,
  }) {
    this.isSuccess = isSuccess ?? true;
    this.message = message ?? "";
  }

  late bool isSuccess;
  late String message;
}

class LoadParticipantsResult extends DatabaseOperationResult {
  final List<ParticipantEntity> participants;

  LoadParticipantsResult({
    required this.participants,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}

class LoadDivingDivisionsResult extends DatabaseOperationResult {
  final List<DivingDivisionEntity> divisions;

  LoadDivingDivisionsResult({
    required this.divisions,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}

class LoadDivingSpecialitiesResult extends DatabaseOperationResult {
  final List<DivingSpecialtyEntity> specialties;

  LoadDivingSpecialitiesResult({
    required this.specialties,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}

class LoadCompetitionScoresResult extends DatabaseOperationResult {
  final List<CompetitionScoreEntity> scores;

  LoadCompetitionScoresResult({
    required this.scores,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}

class SearchParticipantResult extends DatabaseOperationResult {
  final List<ParticipantEntity> participants;

  SearchParticipantResult({
    required this.participants,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}


class LoadClubsResult extends DatabaseOperationResult {
  final List<ClubEntity> clubs;

  LoadClubsResult({
    required this.clubs,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}


class LoadAgeDivisionsResult extends DatabaseOperationResult {
  final List<AgeDivisionEntity> ageDivisions;

  LoadAgeDivisionsResult({
    required this.ageDivisions,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}