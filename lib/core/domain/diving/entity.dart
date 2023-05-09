

import 'value_objects.dart';

class DivingDivisionEntity{
  final DivisionId competitionId;
  final DivisionName competitionName;

  DivingDivisionEntity({required this.competitionId,required this.competitionName});
}

class DivingSpecialityEntity{
  final SpecialtyId specialtyId;
  final SpecialtyName specialtyName;

  DivingSpecialityEntity({required this.specialtyId,required this.specialtyName});
}