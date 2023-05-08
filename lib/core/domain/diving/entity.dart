

import 'value_objects.dart';

class DivingCompetitionEntity{
  final CompetitionId competitionId;
  final CompetiotnName competitionName;

  DivingCompetitionEntity({required this.competitionId,required this.competitionName});
}

class DivingSpecialityEntity{
  final SpecialtyId specialtyId;
  final SpecialtyName specialtyName;

  DivingSpecialityEntity({required this.specialtyId,required this.specialtyName});
}