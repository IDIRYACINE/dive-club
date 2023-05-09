


import 'package:dive_club/core/domain/diving/export.dart';

class SpecialtyState{


  final List<DivingSpecialityEntity> specialties;

  SpecialtyState(this.specialties);


  SpecialtyState copyWith({List<DivingSpecialityEntity>? specialties}){
    return SpecialtyState(specialties ?? this.specialties);
  }


  factory SpecialtyState.initial(){
    return SpecialtyState([]);
  }
  
}