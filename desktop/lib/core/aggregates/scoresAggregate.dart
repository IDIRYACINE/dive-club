import 'package:dive_club/core/infrastrucutre/database/export.dart';

class ScoresAggregate {
  ScoresAggregate({required this.scores});

  final List<CompetitionScore> scores;

  ScoresAggregate copyWith({List<CompetitionScore>? scores}) {
    return ScoresAggregate(scores: scores ?? this.scores);
  }

  void updateScore(CompetitionScore score) {}

  void addScore(CompetitionScore score) {}

  void deleteScore(CompetitionScore score) {}

  CompetitionScore? searchScore(
      {required int participantId,
      required int divisionId,
      required int specialtyId}) {
    CompetitionScore? score;

    return score;
  }
}
