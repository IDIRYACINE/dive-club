import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class CompetitonMapper
    implements DatabaseMapper<DivingDivisionEntity, DivingDivision> {
  @override
  DivingDivisionEntity toDomainEntity(DivingDivision persistance) {
    return DivingDivisionEntity(
      divisionId: DivisionId(persistance.id),
      divisionName: DivisionName(persistance.name),
    );
  }

  @override
  DivingDivision toPersistanceEntity(DivingDivisionEntity domain) {
    throw UnimplementedError();
  }
}

class SpecialtyMapper
    implements DatabaseMapper<DivingSpecialtyEntity, DivingSpeciality> {
  @override
  DivingSpecialtyEntity toDomainEntity(DivingSpeciality persistance) {
    return DivingSpecialtyEntity(
      specialtyId: SpecialtyId(persistance.id),
      specialtyName: SpecialtyName(persistance.name),
    );
  }

  @override
  DivingSpeciality toPersistanceEntity(DivingSpecialtyEntity domain) {
    throw UnimplementedError();
  }
}
