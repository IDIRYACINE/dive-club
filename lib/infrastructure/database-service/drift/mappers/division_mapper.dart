import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/database/database.dart'
    as raw;

List<DivingDivisionEntity> mapToDomainDivingDivisions(
    List<raw.DivingDivision> divingDevisions, DivisionMapperPort mapper) {
  List<DivingDivisionEntity> results = [];

  for (raw.DivingDivision divingDevision in divingDevisions) {
    final temp = DivingDivision(
        id: divingDevision.divisionId, name: divingDevision.divisionName);
    final res = mapper.toDomainEntity(temp);

    results.add(res);
  }

  return results;
}

List<DivingSpecialtyEntity> mapToDomainDivingSpecialitys(
    List<raw.DivingSpecialtie> divingSpecialitys, SpecialityMapperPort mapper) {
  List<DivingSpecialtyEntity> results = [];

  for (raw.DivingSpecialtie divingSpeciality in divingSpecialitys) {
    final temp = DivingSpeciality(
        id: divingSpeciality.specialtyId, name: divingSpeciality.specialtyName);
    final res = mapper.toDomainEntity(temp);

    results.add(res);
  }

  return results;
}

List<AgeDivisionEntity> mapToDomainAgeDivisions(
    List<raw.SelectAgeDivisionsResult> ageDivisions,
    AgeDivisionMapperPort mapper) {
  List<AgeDivisionEntity> results = [];

  for (raw.SelectAgeDivisionsResult ageDivision in ageDivisions) {
    final temp = AgeDivision(
        divisionId: ageDivision.ageDivisionId,
        divisionName: ageDivision.ageDivisionName);
    final res = mapper.toDomainEntity(temp);

    results.add(res);
  }

  return results;
}

List<AgeDivisionEntity> mapToDomainAgeDivisionsOnly(
    List<raw.AgeDivision> ageDivisions, AgeDivisionMapperPort mapper) {
  List<AgeDivisionEntity> results = [];

  for (raw.AgeDivision ageDivision in ageDivisions) {
    final temp = AgeDivision(
        divisionId: ageDivision.ageDivisionId,
        divisionName: ageDivision.ageDivisionName);
    final res = mapper.toDomainEntity(temp);

    results.add(res);
  }

  return results;
}
