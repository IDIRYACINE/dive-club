


import 'package:dive_club/core/domain/diving/export.dart';

class DivisionState{


  final List<DivingDivisionEntity> divisions;

  DivisionState(this.divisions);


  DivisionState copyWith({List<DivingDivisionEntity>? divisions}){
    return DivisionState(divisions ?? this.divisions);
  }


  factory DivisionState.initial(){
    return DivisionState([]);
  }
  
}