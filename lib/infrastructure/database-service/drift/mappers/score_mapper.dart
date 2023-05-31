import 'package:dive_club/core/entities/competition/export.dart';
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
          participantFirstName: score.participantFirstName,
          specialtyName: score.specialtyName,
          ageDivisionId: score.ageDivisionYear,
          genderId: score.genderId,
          participantLastName: score.participantFirstName);
      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

  static byDivisionAndSpecialty(value, ScoreMapperPort scoreMapper) {}

  static byDivision(value, ScoreMapperPort scoreMapper) {}

  static bySpecialty(value, ScoreMapperPort scoreMapper) {}
}
