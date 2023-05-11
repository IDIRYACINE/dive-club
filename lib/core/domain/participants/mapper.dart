import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class ParticipantMapper
    implements DatabaseMapper<ParticipantEntity, Participant> {
  @override
  ParticipantEntity toDomainEntity(Participant persistance) {
    return ParticipantEntity(
        participantId: ParticipantId(persistance.id),
        participantName: ParticipantName(persistance.name),
        participantBirthDate: ParticipantBirthDate(persistance.birthDate),
        divisionId: DivisionId(persistance.divisionId),
        specialtyId: SpecialtyId(persistance.specialityId),
        divisionName: DivisionName(persistance.divisionName),
        specialtyName: SpecialtyName(persistance.specialityName));
  }

  @override
  Participant toPersistanceEntity(ParticipantEntity domain) {
    throw UnimplementedError();
  }
}
