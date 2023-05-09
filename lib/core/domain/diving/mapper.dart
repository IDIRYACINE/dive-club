import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class CompetitonMapper
    implements DatabaseMapper<DivingCompetitionEntity, DivingCompetition> {
  @override
  DivingCompetitionEntity toDomainEntity(DivingCompetition persistance) {
    return DivingCompetitionEntity(
      competitionId: CompetitionId(persistance.id),
      competitionName: CompetiotnName(persistance.name),
    );
  }

  @override
  DivingCompetition toPersistanceEntity(DivingCompetitionEntity domain) {
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
