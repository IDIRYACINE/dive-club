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

    static List<CompetitionScoreEntity> fromSelectJson(
      List<Map<String,dynamic>> scores, ScoreMapperPort mapper) {
    List<CompetitionScoreEntity> results = [];

    if (scores.isEmpty) return results;


    for (Map<String,dynamic> score in scores) {
      final temp = CompetitionScore(
          participantId: score["participant_id"],
          divisionId: score["division_id"],
          specialityId: score["specialty_id"],
          score: score["score"],
          date: DateTime.fromMillisecondsSinceEpoch(score["score_date"]),
          divisionName: score["division_name"],
          participantFirstName: score["participant_first_name"],
          specialtyName: score["specialty_name"],
          ageDivisionId: score["age_division_year"],
          genderId: score["gender_id"],
          participantLastName: score["participant_last_name"],
          ageDivisionName: score["age_division_name"],
          clubId: score["club_id"],
          clubName: score["club_name"],
          column: score["participant_column"],
          genderName: score["gender_name"],
          entryTime: score["entry_time"],
          series: score["participant_series"]);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

}
