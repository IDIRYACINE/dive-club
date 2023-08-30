import 'dart:io';

import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/infrastructure/databaseService/drift/mappers/division_mapper.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:sql_builder/sql_builder_port.dart';

import 'database/database.dart';
import 'helpers/load_competition_score.dart';
import 'helpers/load_participants.dart';
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
    final sqlBuilder = loadCompetitonScoreHelper();

    final List<ColumnField> wheres = [];
    if (options.ageDivisionId != null) {
      wheres.add(
        ColumnField(Column("age_division_id", prefix: ("AgeDivisions")),
            options.ageDivisionId),
      );
    }

    if (options.divisionId != null) {
      wheres.add(
        ColumnField(
            Column("division_id", prefix: ("Scores")), options.divisionId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    if (options.specialityId != null) {
      wheres.add(
        ColumnField(
            Column("specialty_id", prefix: ("Scores")), options.specialityId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    if (options.genderId != null) {
      wheres.add(
        ColumnField(Column("gender_id", prefix: ("Scores")), options.genderId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    sqlBuilder.where(wheres);

    final query = sqlBuilder.build();

    return _database.executor.runSelect(query, []).then((rawScores) {
      final scores =
          ScoreMapper.fromSelectJson(rawScores, _mapperService.scoreMapper);

      return LoadCompetitionScoresResult(scores: scores);
    });
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
    final sqlBuilder = loadParticipantsHelper();

    final List<ColumnField> wheres = [];
    if (options.ageDivisionId != null) {
      wheres.add(
        ColumnField(Column("age_division_id", prefix: ("AgeDivisions")),
            options.ageDivisionId),
      );
    }

    if (options.divisionId != null) {
      wheres.add(
        ColumnField(
            Column("division_id", prefix: ("Participants")), options.divisionId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    if (options.specialityId != null) {
      wheres.add(
        ColumnField(Column("specialty_id", prefix: ("Participants")),
            options.specialityId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    if (options.genderId != null) {
      wheres.add(
        ColumnField(
            Column("gender_id", prefix: ("Participants")), options.genderId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }
    if (options.participantId != null) {
      wheres.add(
        ColumnField(Column("participant_id", prefix: ("Participants")),
            options.genderId,
            prefixOperator:
                wheres.isNotEmpty ? SqlOperator.and : SqlOperator.empty),
      );
    }

    if (options.orderBySeries != null) {
      sqlBuilder.orderBy(OrderBy(column: Column("participant_series")));
    }

    sqlBuilder.where(wheres);

    final query = sqlBuilder.build();

    return _database.executor.runSelect(query, []).then((rawScores) {
      final participants = ParticipantMapper.fromSelectJson(
          rawScores, _mapperService.participantMapper);

      return LoadParticipantsResult(participants: participants);
    });
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
  Future<DatabaseOperationResult> deleteParticipant(
      DeleteParticipantOptions options) async {
    _database.deleteParticipant(participantId: options.id);

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

  @override
  Future<DatabaseOperationResult> deleteScore(
      DeleteScoreOptions options) async {
    _database.deleteScore(
        participantId: options.participantId,
        divisionId: options.divisionId,
        specialtyId: options.specialityId,
        ageDivisionYear: options.ageDivisionId);

    return DatabaseOperationResult();
  }

  @override
  Future<DatabaseOperationResult> updateScoreOptions(
      UpdateScoreOptions options) async {
    _database.updateScore(
        participantId: options.participantId,
        divisionId: options.divisionId,
        specialtyId: options.specialityId,
        score: options.score);

    return DatabaseOperationResult();
  }

  @override
  Future<DatabaseOperationResult> updateParticipant(
      UpdateParticipantOptions options) async {
    _database.updateParticipant(
        id: options.id,
        firstName: options.firstName,
        divisionId: options.divisionId,
        specialtyId: options.specialityId,
        ageDivisionYear: options.ageDivisionId,
        clubId: options.clubId,
        entryTime: options.entryTime,
        genderId: options.genderId,
        lastName: options.lastName);

    return DatabaseOperationResult();
  }
}
