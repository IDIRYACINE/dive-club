import 'package:dive_club/core/domain/clubs/export.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/value_objects.dart';
import 'package:dive_club/core/domain/genders/export.dart';

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
    required this.entryTime,
    required this.genderId,
  });
}
