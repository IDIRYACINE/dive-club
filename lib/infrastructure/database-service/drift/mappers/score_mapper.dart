import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/database/database.dart'
    as raw;

class ScoreMapper {
  static List<CompetitionScoreEntity> fromSelect(
      List<raw.SelectCompetitionScoresResult> scores, ScoreMapperPort mapper) {
    List<CompetitionScoreEntity> results = [];

    for (raw.SelectCompetitionScoresResult score in scores) {
      final temp = CompetitionScore(
          participantId: score.participantId,
          divisionId: score.divisionId,
          specialityId: score.specialtyId,
          score: score.score,
          date: score.scoreDate,
          divisionName: score.divisionName,
          participantName: score.participantName,
          specialtyName: score.specialtyName);
      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }
}
