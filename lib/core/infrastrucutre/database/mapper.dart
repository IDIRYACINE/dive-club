import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';

import 'value_objects.dart';

abstract class DatabaseMapper<D, P extends DatabaseEntity> {
  D toDomainEntity(P persistance);
  // List<D> toManyDomainEntities(List<P> persistance);

  P toPersistanceEntity(D domain);
  // List<P> toManyPersistanceEntities(List<D> domain);
}

typedef CompetitionMapperPort
    = DatabaseMapper<DivingCompetitionEntity, DivingCompetition>;
typedef ParticipantMapperPort = DatabaseMapper<ParticipantEntity, Participant>;
typedef ScoreMapperPort
    = DatabaseMapper<CompetitionScoreEntity, CompetitionScore>;
typedef SpecialityMapperPort
    = DatabaseMapper<DivingSpecialityEntity, DivingSpeciality>;

abstract class MapperServicePort {
  ScoreMapperPort get scoreMapper;
  ParticipantMapperPort get participantMapper;
  CompetitionMapperPort get competitionMapper;
  SpecialityMapperPort get specialtyMapper;
}
