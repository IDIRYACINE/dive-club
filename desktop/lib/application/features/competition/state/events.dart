
import 'package:dive_club/core/entities/competition/export.dart';

abstract class CompetitionEvent{

}


class LoadScoresEvent extends CompetitionEvent{
  final List<CompetitionScoreEntity> scores;

  LoadScoresEvent(this.scores);
}


class AddScoreEvent extends CompetitionEvent{
  final CompetitionScoreEntity score;

  AddScoreEvent(this.score);
}

class UpdateScoreEvent extends  CompetitionEvent{
   final CompetitionScoreEntity score;

  UpdateScoreEvent(this.score);
}