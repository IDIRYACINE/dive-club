import 'value_objects.dart';

class DivingDivisionEntity {
  final DivisionId divisionId;
  final DivisionName divisionName;

  DivingDivisionEntity({required this.divisionId, required this.divisionName});

  DivingDivisionEntity copyWith(
      {DivisionId? divisionId, DivisionName? divisionName}) {
    return DivingDivisionEntity(
        divisionId: divisionId ?? this.divisionId,
        divisionName: divisionName ?? this.divisionName);
  }
}

class DivingSpecialtyEntity {
  final SpecialtyId specialtyId;
  final SpecialtyName specialtyName;

  DivingSpecialtyEntity(
      {required this.specialtyId, required this.specialtyName});

  DivingSpecialtyEntity copyWith(
      {SpecialtyId? specialtyId, SpecialtyName? specialtyName}) {
    return DivingSpecialtyEntity(
        specialtyId: specialtyId ?? this.specialtyId,
        specialtyName: specialtyName ?? this.specialtyName);
  }
}


class AgeDivisionEntity{
  final AgeDivisionId divisionId;
  final AgeDivisionName divisionName;

  AgeDivisionEntity({required this.divisionId,required this.divisionName});

  AgeDivisionEntity copyWith ({AgeDivisionId? divisionId, AgeDivisionName? divisionName}) {
    return AgeDivisionEntity(
        divisionId: divisionId ?? this.divisionId,
        divisionName: divisionName ?? this.divisionName);
  }

}


final List<AgeDivisionEntity> ageDivisions = [
  AgeDivisionEntity(divisionId: AgeDivisionId(0), divisionName: AgeDivisionName("مدارس")),
    AgeDivisionEntity(divisionId: AgeDivisionId(1),divisionName: AgeDivisionName("براعم"))

];