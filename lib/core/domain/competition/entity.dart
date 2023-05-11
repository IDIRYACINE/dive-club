

import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'value_objects.dart';

class CompetitionScoreEntity{
  final ParticipantId participantId;
  final DivisionId divisionId;
  final SpecialtyId specialtyId;
  final Score score;

  CompetitionScoreEntity({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.score,
  });
}