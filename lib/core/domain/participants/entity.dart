import 'package:dive_club/core/domain/diving/value_objects.dart';

import 'value_objects.dart';

class ParticipantEntity {
  final ParticipantId participantId;
  final ParticipantName participantName;
  final ParticipantBirthDate participantBirthDate;
  final DivisionId competitionId;
  final SpecialtyId specialtyId;

  ParticipantEntity(
      {required this.participantId,
      required this.participantName,
      required this.participantBirthDate,
      required this.competitionId,
      required this.specialtyId});
}
