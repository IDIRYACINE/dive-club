import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';

import 'value_objects.dart';

class ParticipantEntity {
  final ParticipantId participantId;
  final ParticipantName participantName;

  final DivingDivisionEntity division;
  final DivingSpecialtyEntity specialty;

  final ClubEntity club;
  final Score entryTime;
  final GenderId genderId;
  final AgeDivisionEntity ageDivision;

  final ParticipantColumn column;
  final ParticipantSeries series;

  ParticipantEntity({
    required this.ageDivision,
    required this.participantId,
    required this.participantName,
    required this.division,
    required this.specialty,
    required this.club,
    required this.column,
    required this.series,
    required this.entryTime,
    required this.genderId,
  });

  ParticipantEntity copyWith({
    AgeDivisionEntity? ageDivision,
    ParticipantName? participantName,
    ClubEntity? club,
    ParticipantColumn? column,
    ParticipantSeries? series,
    DivingDivisionEntity? division,
    DivingSpecialtyEntity? specialty,
    Score? entryTime,
    GenderId? genderId,
  }) {
    return ParticipantEntity(
      ageDivision: ageDivision ?? this.ageDivision,
      participantId: participantId,
      participantName: participantName ?? this.participantName,
      division: division ?? this.division,
      specialty: specialty ?? this.specialty,
      club: club ?? this.club,
      column: column ?? this.column,
      series: series ?? this.series,
      entryTime: entryTime ?? this.entryTime,
      genderId: genderId ?? this.genderId,
    );
  }
}
