


import 'package:dive_club/core/domain/participants/export.dart';

class ParticipantState{


  final List<ParticipantEntity> participants;

  ParticipantState(this.participants);


  ParticipantState copyWith({List<ParticipantEntity>? participants}){
    return ParticipantState(participants ?? this.participants);
  }


  factory ParticipantState.initial(){
    return ParticipantState([]);
  }
  
}