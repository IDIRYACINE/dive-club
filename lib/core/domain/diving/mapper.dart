import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class CompetitonMapper
    implements DatabaseMapper<DivingDivisionEntity, DivingDivision> {
  @override
  DivingDivisionEntity toDomainEntity(DivingDivision persistance) {
    return DivingDivisionEntity(
      competitionId: DivisionId(persistance.id),
      competitionName: DivisionName(persistance.name),
    );
  }

  @override
  DivingDivision toPersistanceEntity(DivingDivisionEntity domain) {
    throw UnimplementedError();
  }
}

class SpecialtyMapper
    implements DatabaseMapper<DivingSpecialityEntity, DivingSpeciality> {
  @override
  DivingSpecialityEntity toDomainEntity(DivingSpeciality persistance) {
    return DivingSpecialityEntity(
      specialtyId: SpecialtyId(persistance.id),
      specialtyName: SpecialtyName(persistance.name),
    );
  }

  @override
  DivingSpeciality toPersistanceEntity(DivingSpecialityEntity domain) {
    throw UnimplementedError();
  }
}
