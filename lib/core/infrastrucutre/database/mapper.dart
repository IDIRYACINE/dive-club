import 'package:dive_club/core/entities/clubs/entity.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';

import 'value_objects.dart';

abstract class DatabaseMapper<D, P extends DatabaseEntity> {
  D toDomainEntity(P persistance);
  // List<D> toManyDomainEntities(List<P> persistance);

  P toPersistanceEntity(D domain);
  // List<P> toManyPersistanceEntities(List<D> domain);
}

typedef DivisionMapperPort
    = DatabaseMapper<DivingDivisionEntity, DivingDivision>;

typedef ParticipantMapperPort = DatabaseMapper<ParticipantEntity, Participant>;

typedef ScoreMapperPort
    = DatabaseMapper<CompetitionScoreEntity, CompetitionScore>;

typedef SpecialityMapperPort
    = DatabaseMapper<DivingSpecialtyEntity, DivingSpeciality>;


typedef ClubMapperPort
    = DatabaseMapper<ClubEntity, Club>;


typedef AgeDivisionMapperPort
    = DatabaseMapper<AgeDivisionEntity, AgeDivision>;

abstract class MapperServicePort {
  ScoreMapperPort get scoreMapper;
  ParticipantMapperPort get participantMapper;
  DivisionMapperPort get competitionMapper;
  SpecialityMapperPort get specialtyMapper;
  AgeDivisionMapperPort get ageDivisonMapper;
  ClubMapperPort get clubMapper;
}
