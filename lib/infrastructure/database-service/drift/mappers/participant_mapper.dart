import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/database/database.dart'
    as raw;

class ParticipantMapper {
  static List<ParticipantEntity> fromSelectBySpecialty(
      List<raw.SelectParticiapnsBySpecialtyResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapnsBySpecialtyResult participant in participants) {
      final temp = Participant(
          id: participant.participantId,
          firstName: participant.participantFirstName,
          birthDate: participant.birthDate,
          divisionId: participant.divisionId,
          specialityId: participant.specialtyId,
          divisionName: participant.divisionName,
          specialityName: participant.specialtyName,
          ageDivisionId: participant.ageDivisionYear,
          clubId: participant.clubId,
          entryTime: participant.entryTime,
          genderId: participant.genderId,
          lastName: participant.participantLastName);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectBySpecialtyAndDivision(
      List<raw.SelectParticiapntsByDivisionAndSpecialtyResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByDivisionAndSpecialtyResult participant
        in participants) {
      final temp = Participant(
          id: participant.participantId,
          firstName: participant.participantFirstName,
          birthDate: participant.birthDate,
          divisionId: participant.divisionId,
          specialityId: participant.specialtyId,
          divisionName: participant.divisionName,
          specialityName: participant.specialtyName,
          ageDivisionId: participant.ageDivisionYear,
          clubId: participant.clubId,
          entryTime: participant.entryTime,
          genderId: participant.genderId,
          lastName: participant.participantLastName);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectByDivision(
      List<raw.SelectParticiapntsByDivisionResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsByDivisionResult participant in participants) {
     final temp = Participant(
          id: participant.participantId,
          firstName: participant.participantFirstName,
          birthDate: participant.birthDate,
          divisionId: participant.divisionId,
          specialityId: participant.specialtyId,
          divisionName: participant.divisionName,
          specialityName: participant.specialtyName,
          ageDivisionId: participant.ageDivisionYear,
          clubId: participant.clubId,
          entryTime: participant.entryTime,
          genderId: participant.genderId,
          lastName: participant.participantLastName);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

  static List<ParticipantEntity> fromSelectParticipant(
      List<raw.SelectParticiapntsResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SelectParticiapntsResult participant in participants) {
      final temp = Participant(
          id: participant.participantId,
          firstName: participant.participantFirstName,
          birthDate: participant.birthDate,
          divisionId: participant.divisionId,
          specialityId: participant.specialtyId,
          divisionName: participant.divisionName,
          specialityName: participant.specialtyName,
          ageDivisionId: participant.ageDivisionYear,
          clubId: participant.clubId,
          entryTime: participant.entryTime,
          genderId: participant.genderId,
          lastName: participant.participantLastName);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }

  static List<ParticipantEntity> fromSearchByName(
      List<raw.SearchParticipantsByIdResult> participants,
      ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    for (raw.SearchParticipantsByIdResult participant in participants) {
      final temp = Participant(
          id: participant.participantId,
          firstName: participant.participantFirstName,
          birthDate: participant.birthDate,
          divisionId: participant.divisionId,
          specialityId: participant.specialtyId,
          divisionName: participant.divisionName,
          specialityName: participant.specialtyName,
          ageDivisionId: participant.ageDivisionYear,
          clubId: participant.clubId,
          entryTime: participant.entryTime,
          genderId: participant.genderId,
          lastName: participant.participantLastName);

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }
}
