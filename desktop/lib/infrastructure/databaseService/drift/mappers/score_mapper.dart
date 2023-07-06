import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class ScoreMapper {
  static List<CompetitionScoreEntity> fromSelect(
      List<dynamic> scores, ScoreMapperPort mapper) {
    List<CompetitionScoreEntity> results = [];

    for (dynamic score in scores) {
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
          participantLastName: score.participantLastName,
          ageDivisionName: score.ageDivisionName,
          clubId: score.clubId,
          clubName: score.clubName,
          column: score.participantColumn,
          genderName: score.genderName,
          entryTime: score.entryTime,
          series: score.participantSeries);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }
}
