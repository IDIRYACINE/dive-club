import 'dart:io';

import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/infrastructure/databaseService/drift/mappers/division_mapper.dart';
import 'package:dive_club/resources/resources.dart';

import 'database/database.dart';
import 'mappers/club_mapper.dart';
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
            firstName: options.firstName,
            divisionId: options.divisionId,
            specialtyId: options.specialityId,
            ageDivisionYear: options.ageDivisionId,
            clubId: options.clubId,
            entryTime: options.entryTime,
            genderId: options.genderId,
            lastName: options.lastName)
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
            score: options.score,
            ageDivisionYear: options.ageDivisionId,
            genderId: options.genderId)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<LoadCompetitionScoresResult> loadCompetitionScores(
      LoadCompetitionScoresOptions options) async {
    if (options.divisionId != null &&
        options.specialityId != null &&
        options.genderId != null &&
        options.ageDivisionId != null) {
      return _database
          .selectCompetitionScoresBySpecialtyAndDivisionAndGenreAndAgeId(
              divisionId: options.divisionId!,
              genderId: options.genderId!,
              ageId: options.ageDivisionId!,
              specialtyId: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId != null &&
        options.specialityId != null &&
        options.genderId != null) {
      return _database
          .selectCompetitionScoresBySpecialtyAndDivisionAndGenre(
              divisionId: options.divisionId!,
              genderId: options.genderId!,
              specialtyId: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId != null && options.specialityId != null) {
      return _database
          .selectCompetitionScoresBySpecialtyAndDivision(
              divisionId: options.divisionId!,
              specialtyId: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId != null && options.specialityId == null) {
      return _database
          .selectCompetitionScoresByDivision(id: options.divisionId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
            ),
          );
    }

    if (options.divisionId == null && options.specialityId != null) {
      return _database
          .selectCompetitionScoresBySpecialty(id: options.specialityId!)
          .get()
          .then(
            (value) => LoadCompetitionScoresResult(
              scores: ScoreMapper.fromSelect(value, _mapperService.scoreMapper),
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
    if (options.divisionId != null &&
        options.ageDivisionId != null &&
        options.specialityId != null &&
        options.genderId != null) {
      return _database
          .selectParticiapntsByAgeAndDivisionAndSpecialtyAndGender(
              ageDivisionId: options.ageDivisionId!,
              divisionId: options.divisionId!,
              specialtyId: options.specialityId!,
              genderId: options.genderId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.bySelect(
                  value, _mapperService.participantMapper),
            ),
          );
    }

    if (options.orderBySeries != null) {
      return _database.selectParticipantsAndOrderBySeries().get().then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromOrderBySeries(
                  value, _mapperService.participantMapper),
            ),
          );
    }
    if (options.participantId != null) {
      return _database
          .searchParticipantsById(id: options.participantId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromSearchByName(
                  value, _mapperService.participantMapper),
            ),
          );
    }

    if (options.clubId != null) {
      return _database
          .selectParticiapntsByClub(clubId: options.clubId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.fromyByClub(
                  value, _mapperService.participantMapper),
            ),
          );
    }

    if (options.divisionId != null &&
        options.ageDivisionId != null &&
        options.specialityId != null) {
      return _database
          .selectParticiapntsByAgeAndDivisionAndSpecialty(
              ageDivisionId: options.ageDivisionId!,
              divisionId: options.divisionId!,
              specialtyId: options.specialityId!)
          .get()
          .then(
            (value) => LoadParticipantsResult(
              participants: ParticipantMapper.byAgeAndDivisionAndSpecialty(
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

  @override
  Future<DatabaseOperationResult> insertAgeDivision(
      CreateAgeDivisionOptions options) {
    return _database
        .createAgeDivisions(name: options.divisionName, id: options.year)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<DatabaseOperationResult> insertClub(CreateClubOptions options) {
    return _database
        .createDivingDivisions(name: options.clubName)
        .then((value) => DatabaseOperationResult());
  }

  @override
  Future<LoadAgeDivisionsResult> loadAgeDivisions() {
    return _database.selectAgeDivisionsOnly().get().then(
          (value) => LoadAgeDivisionsResult(
            ageDivisions: mapToDomainAgeDivisionsOnly(
                value, _mapperService.ageDivisonMapper),
          ),
        );
  }

  @override
  Future<LoadClubsResult> loadClubs() {
    return _database.selectClubs().get().then(
          (value) => LoadClubsResult(
            clubs: mapToDomainClub(value, _mapperService.clubMapper),
          ),
        );
  }

  @override
  Future<DatabaseOperationResult> updateAgeDivision(
      UpdateAgeDivisionOptions options) {
    // TODO: implement updateAgeDivision
    throw UnimplementedError();
  }

  @override
  Future<DatabaseOperationResult> updateClub(UpdateClubOptions options) {
    // TODO: implement updateClub
    throw UnimplementedError();
  }

  @override
  Future<DatabaseOperationResult> updateParticipantsSeries(
      List<ParticipantEngagement> engagements) async {
    for (ParticipantEngagement engagement in engagements) {
      _database.updateParticipantSeriesAndColumn(
          column: engagement.column.value,
          series: engagement.series,
          id: engagement.participantId.value);
    }

    return DatabaseOperationResult();
  }

  @override
  Future<DatabaseOperationResult> insertDefaultValues() async {
    _database.doWhenOpened((e) async {
      final results = (await loadAgeDivisions()).ageDivisions;
      if (results.isEmpty) {
        final file = File(AppResources.defaultsSql);
        final rawSql = file.readAsStringSync();
        _database.executor.runCustom(rawSql);
      }
    });

    return DatabaseOperationResult();
  }
}
