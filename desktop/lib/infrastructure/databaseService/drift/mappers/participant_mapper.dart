import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/databaseService/drift/database/database.dart'
    as raw;

class ParticipantMapper {
  static List<ParticipantEntity> fromSelectBySpecialty(
      List<raw.SelectParticiapnsBySpecialtyResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapnsBySpecialtyResult participant in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectBySpecialtyAndDivision(
      List<raw.SelectParticiapntsByDivisionAndSpecialtyResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByDivisionAndSpecialtyResult participant
        in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectByDivision(
      List<raw.SelectParticiapntsByDivisionResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByDivisionResult participant in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectParticipant(
      List<raw.SelectParticiapntsResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsResult participant in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static List<ParticipantEntity> fromSearchByName(
      List<raw.SearchParticipantsByIdResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SearchParticipantsByIdResult participant in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static fromyByClub(List<raw.SelectParticiapntsByClubResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByClubResult participant in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }


  static bySelect(
      List<dynamic>
          participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (dynamic participant
        in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }


  static byAgeAndDivisionAndSpecialty(
      List<raw.SelectParticiapntsByAgeAndDivisionAndSpecialtyResult>
          participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByAgeAndDivisionAndSpecialtyResult participant
        in participants) {
      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }

  static fromOrderBySeries(List<raw.SelectParticipantsAndOrderBySeriesResult> participants, ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];


    for (raw.SelectParticipantsAndOrderBySeriesResult participant
        in participants) {
         

      results.add(_mapToDomain(participant, mapper));
    }

    return results;
  }
}

ParticipantEntity _mapToDomain(
    dynamic participant, ParticipantMapperPort mapper) {

  final temp = Participant(
      id: participant.participantId,
      firstName: participant.participantFirstName,
      divisionId: participant.divisionId,
      specialityId: participant.specialtyId,
      divisionName: participant.divisionName,
      specialityName: participant.specialtyName,
      ageDivisionId: participant.ageDivisionYear,
      clubId: participant.clubId,
      entryTime: participant.entryTime,
      genderId: participant.genderId,
      lastName: participant.participantLastName,
      column: participant.participantColumn ?? -1,
      series: participant.participantSeries ?? -1,
      ageDivisionName: participant.ageDivisionName,
      clubName: participant.clubName);

  return mapper.toDomainEntity(temp);
}
