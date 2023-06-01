import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/value_objects.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class ParticipantMapper
    implements DatabaseMapper<ParticipantEntity, Participant> {
  @override
  ParticipantEntity toDomainEntity(Participant persistance) {
    return ParticipantEntity(
        participantId: ParticipantId(persistance.id),
        participantName:
            ParticipantName(persistance.firstName, persistance.lastName),
        participantBirthDate: ParticipantBirthDate(persistance.birthDate),
        divisionId: DivisionId(persistance.divisionId),
        specialtyId: SpecialtyId(persistance.specialityId),
        divisionName: DivisionName(persistance.divisionName),
        specialtyName: SpecialtyName(persistance.specialityName),
        ageDivisionId: AgeDivisionId(persistance.ageDivisionId),
        clubId: ClubId(persistance.clubId),
        entryTime: Score.fromInt(persistance.entryTime),
        genderId: GenderId(persistance.genderId),
        column: ParticipantColumn.from(persistance.column),
        series: ParticipantSeries(persistance.series));
  }

  @override
  Participant toPersistanceEntity(ParticipantEntity domain) {
    throw UnimplementedError();
  }
}
