import 'package:dive_club/core/entities/competition/export.dart';

class ScoresAggregate {
  ScoresAggregate({required this.scores});

  final List<CompetitionScoreEntity> scores;

  ScoresAggregate copyWith({List<CompetitionScoreEntity>? scores}) {
    return ScoresAggregate(scores: scores ?? this.scores);
  }

  List<CompetitionScoreEntity> updateScore(CompetitionScoreEntity score) {
    final updatedScores =
        scores.map((e) => e.equals(score) ? score : e).toList();
    return updatedScores;
  }

  List<CompetitionScoreEntity> addScore(CompetitionScoreEntity score) {
    scores.add(score);
    return scores;
  }

  List<CompetitionScoreEntity> deleteScore(CompetitionScoreEntity score) {
    scores.removeWhere((element) => element.equals(score));
    return scores;
  }

  CompetitionScoreEntity? searchScore(
      {required int participantId, int? divisionId, int? specialtyId}) {
    CompetitionScoreEntity? score;

    if (scores.isEmpty) {
      return score;
    }

    final dId = scores.first.divisionId.value;
    final sId = scores.first.specialtyId.value;

    score = scores.firstWhere((element) => element.equalsByIds(
        divisionId: dId, participantId: participantId, specialtyId: sId));

    return score;
  }
}
