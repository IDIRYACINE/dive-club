


import 'package:dive_club/core/aggregates/scores_aggregate.dart';
import 'package:dive_club/core/entities/competition/export.dart';

class CompetitionState{

  final ScoresAggregate aggregate;

  List<CompetitionScoreEntity> get  scores => aggregate.scores;

  CompetitionState( this.aggregate);


  CompetitionState copyWith({List<CompetitionScoreEntity>? scores}){
    return CompetitionState(aggregate.copyWith(scores:scores));
  }


  factory CompetitionState.initial(){
    return CompetitionState(ScoresAggregate(scores: []));
  }
  
}