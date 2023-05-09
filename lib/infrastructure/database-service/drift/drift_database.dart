import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'database/database.dart';

class DriftDatabaseService implements DatabasePort {
  final AppDb _database = AppDb();

  @override
  Future<DatabaseOperationResult> insertDivingCompetition(
      CreateDivingCompetitionOptions options) async {
    return _database
        .createDivingCompetition(name: options.competitionName)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> insertDivingSpeciality(
      CreateDivingSpecialityOptions options) async {
    return _database
        .createDivingSpecialty(name: options.specialityName)
        .then((value) {
      return DatabaseOperationResult();
    });
  }

  @override
  Future<DatabaseOperationResult> insertParticipant(
      CreateParticipantOptions options) async {
    return _database
        .createParticipant(
            name: options.participant.name,
            birthDate: options.participant.birthDate,
            competitionId: options.participant.competitionId,
            specialtyId: options.participant.specialityId)
        .then((value) {
      return DatabaseOperationResult();
    });
  }

  @override
  Future<DatabaseOperationResult> insertScore(
      CreateScoreOptions options) async {
    final score = options.score;
    return _database
        .createScore(
            participantId: score.competitionId,
            date: score.date,
            competitionId: score.competitionId,
            specialtyId: score.specialityId,
            score: score.score)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<LoadCompetitionScoresResult> loadCompetitionScores(
      LoadCompetitionScoresOptions options) async {
    return _database
        .selectCompetitionScores()
        .then((value) => LoadCompetitionScoresResult(scores: value));
  }

  @override
  Future<LoadDivingCompetitionsResult> loadDivingCompetitions() async {
    return _database
        .selectDivingCompetitions()
        .then((value) => LoadDivingCompetitionsResult(competitions: value));
  }

  @override
  Future<LoadDivingSpecialitiesResult> loadDivingSpecialities() async {
    return _database
        .selectDivingSpecialties()
        .then((value) => LoadDivingSpecialitiesResult(specialities: value));
  }

  @override
  Future<LoadParticipantsResult> loadParticipants(
      LoadParticipantsOptions options) async {
    return _database
        .selectParticipants()
        .then((value) => LoadParticipantsResult(participants: value));
  }

  @override
  Future<DatabaseOperationResult> updateDivingCompetition(
      UpdateDivingCompetitionOptions options) async {
    return _database
        .updateDivingCompetition(
            name: options.newName, id: options.competitionId)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> updateDivingSpeciality(
      UpdateDivingSpecialityOptions options) async {
    return _database
        .updateDivingSpecialty(
            name: options.specialityName, id: options.specialityId)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> updateScore(
      UpdateScoreOptions options) async {
    return _database
        .updateScore(
            participantId: options.participantId,
            competitionId: options.competitionId,
            specialityId: options.specialityId,
            score: options.score)
        .then((value) => DatabaseOperationResult());
  }
}
