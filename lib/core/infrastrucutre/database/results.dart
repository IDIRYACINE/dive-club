import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';


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

class LoadDivingCompetitionsResult extends DatabaseOperationResult {
  final List<DivingDivisionEntity> competitions;

  LoadDivingCompetitionsResult({
    required this.competitions,
    bool? isSuccess,
    String? message,
  }) : super(isSuccess: isSuccess, message: message);
}

class LoadDivingSpecialitiesResult extends DatabaseOperationResult {
  final List<DivingSpecialtyEntity> specialities;

  LoadDivingSpecialitiesResult({
    required this.specialities,
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