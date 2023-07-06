import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'value_objects.dart';

class CompetitionScoreEntity {
  final ParticipantId participantId;
  final DivisionId divisionId;
  final SpecialtyId specialtyId;
  final Score score;
  final ParticipantName participantName;
  final DivisionName divisionName;
  final SpecialtyName specialtyName;
  final GenderEntity gender;
  final AgeDivisionEntity ageDivision;
  final ParticipantColumn column;
  final ParticipantSeries series;
  final ClubEntity club;
  final Score entryTime;


  CompetitionScoreEntity({
    required this.club,
    required this.entryTime,
    required this.column,
    required this.series,
    required this.participantName,
    required this.divisionName,
    required this.specialtyName,
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.score,
    required this.gender,
    required this.ageDivision,
  });

  bool get isAbsent => score.minutes == 99;

  bool get isDisqualified => score.minutes == 88;

  bool equals(CompetitionScoreEntity other) {
    return participantId.value == other.participantId.value &&
        divisionId.value == other.divisionId.value &&
        specialtyId.value == other.specialtyId.value;
  }

  bool equalsByIds({required int participantId, required int divisionId, required int specialtyId}) {
   
    return this.participantId.value == participantId &&
        this.divisionId.value == divisionId &&
        this.specialtyId.value == specialtyId;
  }
}
