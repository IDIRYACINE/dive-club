import 'package:dive_club/core/domain/diving/value_objects.dart';

import 'value_objects.dart';

class ParticipantEntity {
  final ParticiantId participantId;
  final ParticipantName participantName;
  final ParticipantBirthDate participantBirthDate;
  final CompetitionId competitionId;
  final SpecialtyId specialtyId;

  ParticipantEntity(
      {required this.participantId,
      required this.participantName,
      required this.participantBirthDate,
      required this.competitionId,
      required this.specialtyId});
}
