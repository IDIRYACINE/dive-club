import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/genders/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'value_objects.dart';

class CompetitionScoreEntity {
  final ParticipantId participantId;
  final DivisionId divisionId;
  final SpecialtyId specialtyId;
  final Score score;
  final ParticipantName participantName;
  final DivisionName divisionName;
  final SpecialtyName specialtyName;
  final GenderId genderId;
  final AgeDivisionId ageDivisionId;

  CompetitionScoreEntity( {
    required this.participantName,
    required this.divisionName,
    required this.specialtyName,
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.score,
    required this.genderId, required this.ageDivisionId,
  });
}
