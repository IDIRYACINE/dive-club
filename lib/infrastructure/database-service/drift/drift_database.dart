import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/helpers.dart';

import 'database/database.dart';

class DriftDatabaseService implements DatabasePort {
  final AppDb _database = AppDb();
  final MapperServicePort _mapperService;

  DriftDatabaseService(this._mapperService);

  @override
  Future<DatabaseOperationResult> insertDivingCompetition(
      CreateDivingCompetitionOptions options) async {
    return _database
        .createDivingCompetitions(name: options.competitionName)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> insertDivingSpeciality(
      CreateDivingSpecialityOptions options) async {
    return _database
        .createDivingSpecialties(name: options.specialityName)
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
    return _database.selectCompetitionScores().get().then((value) =>
        LoadCompetitionScoresResult(
            scores: mapToDomainScores(value, _mapperService.scoreMapper)));
  }

  @override
  Future<LoadDivingCompetitionsResult> loadDivingCompetitions() async {
    return _database.selectDivingCompetitions().get().then((value) =>
        LoadDivingCompetitionsResult(
            competitions: mapToDomainDivingCompetitions(
                value, _mapperService.competitionMapper)));
  }

  @override
  Future<LoadDivingSpecialitiesResult> loadDivingSpecialities() async {
    return _database.selectDivingSpecialties().get().then((value) =>
        LoadDivingSpecialitiesResult(
            specialities: mapToDomainDivingSpecialitys(
                value, _mapperService.specialtyMapper)));
  }

  @override
  Future<LoadParticipantsResult> loadParticipants(
      LoadParticipantsOptions options) async {
    if (options.competitionId == null && options.specialityId == null) {
      return _database.selectParticiapnts().get().then((value) =>
          LoadParticipantsResult(
              participants: mapToDomainParticipants(
                  value, _mapperService.participantMapper)));
    }
    if (options.competitionId != null && options.specialityId == null) {
      return _database
          .selectParticiapntsByCompetition(id: options.competitionId!)
          .get()
          .then((value) => LoadParticipantsResult(
              participants: mapToDomainParticipants(
                  value, _mapperService.participantMapper)));
    }
    if (options.competitionId == null && options.specialityId != null) {
      return _database
          .selectParticiapnsBySpecialty(id: options.specialityId!)
          .get()
          .then((value) => LoadParticipantsResult(
              participants: mapToDomainParticipants(
                  value, _mapperService.participantMapper)));
    }

    return _database
        .selectParticiapntsByCompetitionAndSpecialty(
            competitionId: options.competitionId!,
            specialtyId: options.specialityId!)
        .get()
        .then((value) => LoadParticipantsResult(
            participants: mapToDomainParticipants(
                value, _mapperService.participantMapper)));
  }

  @override
  Future<DatabaseOperationResult> updateDivingCompetition(
      UpdateDivingCompetitionOptions options) async {
    return _database
        .updateDivingCompetitions(
            name: options.newName, id: options.competitionId)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> updateDivingSpeciality(
      UpdateDivingSpecialityOptions options) async {
    return _database
        .updateDivingSpecialties(
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
            specialtyId: options.specialityId,
            score: options.score)
        .then((value) => DatabaseOperationResult());
  }
}
