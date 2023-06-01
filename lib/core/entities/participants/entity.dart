import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/value_objects.dart';
import 'package:dive_club/core/entities/genders/export.dart';

import 'value_objects.dart';

class ParticipantEntity {
  final ParticipantId participantId;
  final ParticipantName participantName;
  final ParticipantBirthDate participantBirthDate;
  final DivisionId divisionId;
  final DivisionName divisionName;
  final SpecialtyName specialtyName;
  final SpecialtyId specialtyId;

  final AgeDivisionId ageDivisionId;
  final ClubId clubId;
  final Score entryTime;
  final GenderId genderId;

  final ParticipantColumn column;
  final ParticipantSeries series;

  ParticipantEntity({
    required this.participantId,
    required this.participantName,
    required this.participantBirthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.divisionName,
    required this.specialtyName,
    required this.ageDivisionId,
    required this.clubId,
    required this.column,
    required this.series,
    required this.entryTime,
    required this.genderId,
  });
}
