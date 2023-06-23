import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/entity.dart';
import 'package:dive_club/core/entities/genders/value_objects.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'entity.dart';
import 'value_objects.dart';

class ScoreMapper
    implements DatabaseMapper<CompetitionScoreEntity, CompetitionScore> {
  @override
  CompetitionScoreEntity toDomainEntity(CompetitionScore persistance) {
    return CompetitionScoreEntity(
        participantId: ParticipantId(persistance.participantId),
        divisionId: DivisionId(persistance.divisionId),
        specialtyId: SpecialtyId(persistance.specialityId),
        score: Score.fromInt(persistance.score),
        divisionName: DivisionName(persistance.divisionName),
        club: ClubEntity(
            clubId: ClubId(persistance.clubId),
            clubName: ClubName(persistance.clubName)),
        participantName: ParticipantName(
            persistance.participantFirstName, persistance.participantLastName),
        specialtyName: SpecialtyName(persistance.specialtyName),
        ageDivision: AgeDivisionEntity(
            divisionId: AgeDivisionId(persistance.ageDivisionId),
            divisionName: AgeDivisionName(persistance.ageDivisionName)),
        gender: GenderEntity(
            genderId: GenderId(persistance.genderId),
            genderName: GenderName(persistance.genderName)),
        column: ParticipantColumn.from(persistance.column ?? 0),
        series: ParticipantSeries(persistance.series ?? 0));
  }

  @override
  CompetitionScore toPersistanceEntity(CompetitionScoreEntity domain) {
    throw UnimplementedError();
  }
}
