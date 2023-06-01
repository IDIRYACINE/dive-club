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
    final club = ClubEntity(clubId: ClubId(persistance.clubId), clubName: ClubName(persistance.clubName));

    final division = DivingDivisionEntity(divisionId: DivisionId(persistance.divisionId), divisionName: DivisionName(persistance.divisionName));

    final specialty = DivingSpecialtyEntity(specialtyId: SpecialtyId(persistance.specialityId), specialtyName: SpecialtyName(persistance.specialityName),);
    final ageDivision = AgeDivisionEntity(divisionId: AgeDivisionId(persistance.ageDivisionId), divisionName: AgeDivisionName(persistance.ageDivisionName));
    return ParticipantEntity(
        participantId: ParticipantId(persistance.id),
        participantName:
            ParticipantName(persistance.firstName, persistance.lastName),
        participantBirthDate: ParticipantBirthDate(persistance.birthDate),
        division: division,
        specialty:specialty  ,
        club: club,
        entryTime: Score.fromInt(persistance.entryTime),
        genderId: GenderId(persistance.genderId),
        column: ParticipantColumn.from(persistance.column),
        series: ParticipantSeries(persistance.series),
         ageDivision: ageDivision);
  }

  @override
  Participant toPersistanceEntity(ParticipantEntity domain) {
    throw UnimplementedError();
  }
}
