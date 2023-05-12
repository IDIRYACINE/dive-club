import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/mappers/division_mapper.dart';

import 'database/database.dart';
import 'mappers/participant_mapper.dart';
import 'mappers/score_mapper.dart';

class DriftDatabaseService implements DatabasePort {
  final AppDb _database = AppDb.instance();
  final MapperServicePort _mapperService;

  DriftDatabaseService(this._mapperService);

  @override
  Future<DatabaseOperationResult> insertDivingDivision(
      CreateDivingDivisionOptions options) async {
    return _database
        .createDivingDivisions(name: options.divisionName)
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
            name: options.name,
            birthDate: options.birthDate,
            divisionId: options.divisionId,
            specialtyId: options.specialityId)
        .then((value) {
      return DatabaseOperationResult();
    });
  }

  @override
  Future<DatabaseOperationResult> insertScore(
      CreateScoreOptions options) async {
    return _database
        .createScore(
            participantId: options.participantId,
            date: options.date,
            divisionId: options.divisionId,
            specialtyId: options.specialityId,
            score: options.score)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<LoadCompetitionScoresResult> loadCompetitionScores(
      LoadCompetitionScoresOptions options) async {
    if (options.divisionId != null && options.specialityId != null) {
      return _database
          .selectCompetitionScoresBySpecialtyAndDivision(
              divisionId: options.divisionId!,
              specialtyId: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.byDivisionAndSpecialty(
                  value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId != null && options.specialityId == null) {
      return _database
          .selectCompetitionScoresByDivision(id: options.divisionId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.byDivision(value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId == null && options.specialityId != null) {
      return _database
          .selectCompetitionScoresBySpecialty(id: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores:
                  ScoreMapper.bySpecialty(value, _mapperService.scoreMapper),
            ),
          );
    }

    return _database.selectCompetitionScores().get().then(
          (value) => LoadCompetitionScoresResult(
            scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
          ),
        );
  }

  @override
  Future<LoadDivingDivisionsResult> loadDivingDivisions() async {
    return _database.selectDivingDivisions().get().then(
          (value) => LoadDivingDivisionsResult(
            divisions: mapToDomainDivingDivisions(
                value, _mapperService.competitionMapper),
          ),
        );
  }

  @override
  Future<LoadDivingSpecialitiesResult> loadDivingSpecialities() async {
    return _database.selectDivingSpecialties().get().then(
          (value) => LoadDivingSpecialitiesResult(
            specialties: mapToDomainDivingSpecialitys(
                value, _mapperService.specialtyMapper),
          ),
        );
  }

  @override
  Future<LoadParticipantsResult> loadParticipants(
      LoadParticipantsOptions options) async {
    if (options.participantName != null) {
      return _database
          .searchParticipantsByName(name: options.participantName!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromSearchByName(
                  value, _mapperService.participantMapper),
            ),
          );
    }

    if (options.divisionId == null && options.specialityId == null) {
      return _database.selectParticiapnts().get().then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromSelectParticipant(
                  value, _mapperService.participantMapper),
            ),
          );
    }
    if (options.divisionId != null && options.specialityId == null) {
      return _database
          .selectParticiapntsByDivision(id: options.divisionId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromSelectByDivision(
                  value, _mapperService.participantMapper),
            ),
          );
    }
    if (options.divisionId == null && options.specialityId != null) {
      return _database
          .selectParticiapnsBySpecialty(id: options.specialityId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromSelectBySpecialty(
                  value, _mapperService.participantMapper),
            ),
          );
    }

    return _database
        .selectParticiapntsByDivisionAndSpecialty(
            divisionId: options.divisionId!, specialtyId: options.specialityId!)
        .get()
        .then(
          (value) => LoadParticipantsResult(
            participants: ParticipantMapper.fromSelectBySpecialtyAndDivision(
                value, _mapperService.participantMapper),
          ),
        );
  }

  @override
  Future<DatabaseOperationResult> updateDivingDivision(
      UpdateDivingDivisionOptions options) async {
    return _database
        .updateDivingDivisions(name: options.newName, id: options.divisionId)
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
            divisionId: options.divisionId,
            specialtyId: options.specialityId,
            score: options.score)
        .then((value) => DatabaseOperationResult());
  }
}