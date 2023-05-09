

import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'value_objects.dart';

class CompetitionScoreEntity{
  final ParticiantId participantId;
  final CompetitionId competitionId;
  final SpecialtyId specialtyId;
  final CompetitionScore score;

  CompetitionScoreEntity({
    required this.participantId,
    required this.competitionId,
    required this.specialtyId,
    required this.score,
  });
}