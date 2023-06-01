import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/value_objects.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'entity.dart';
import 'value_objects.dart';

class ScoreMapper
    implements DatabaseMapper<CompetitionScoreEntity, CompetitionScore> {
  @override
  CompetitionScoreEntity toDomainEntity(CompetitionScore persistance) {
    return CompetitionScoreEntity(
        participantId: ParticipantId(persistance.participantId),
        divisionId: DivisionId(persistance.divisionId),
        specialtyId: SpecialtyId(persistance.specialityId),
        score: Score.fromInt(persistance.score),
        divisionName: DivisionName(persistance.divisionName),
        participantName: ParticipantName(
            persistance.participantFirstName, persistance.participantLastName),
        specialtyName: SpecialtyName(persistance.specialtyName),
        ageDivisionId: AgeDivisionId(persistance.ageDivisionId),
        genderId: GenderId(persistance.genderId));
  }

  @override
  CompetitionScore toPersistanceEntity(CompetitionScoreEntity domain) {
    throw UnimplementedError();
  }
}
