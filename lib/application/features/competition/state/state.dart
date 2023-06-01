


import 'package:dive_club/core/entities/competition/export.dart';

class CompetitionState{


  final List<CompetitionScoreEntity> scores;

  CompetitionState(this.scores);


  CompetitionState copyWith({List<CompetitionScoreEntity>? scores}){
    return CompetitionState(scores ?? this.scores);
  }


  factory CompetitionState.initial(){
    return CompetitionState([]);
  }
  
}