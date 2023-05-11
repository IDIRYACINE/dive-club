import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
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
        score: Score(persistance.score));
  }

  @override
  CompetitionScore toPersistanceEntity(CompetitionScoreEntity domain) {
    throw UnimplementedError();
  }
}
