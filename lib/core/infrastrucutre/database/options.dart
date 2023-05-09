import 'value_objects.dart';

class SearchParticipantOptions {
  final String name;

  SearchParticipantOptions({
    required this.name,
  });
}

class UpdateScoreOptions {
  final int participantId;
  final int divisionId;
  final int specialityId;
  final double score;

  UpdateScoreOptions({
    required this.participantId,
    required this.divisionId,
    required this.specialityId,
    required this.score,
  });
}

class CreateScoreOptions {
  final CompetitionScore score;

  CreateScoreOptions({
    required this.score,
  });
}

class CreateParticipantOptions {
  final Participant participant;
  CreateParticipantOptions({
    required this.participant,
  });
}

class CreateDivingDivisionOptions {
  final String divisionName;
  CreateDivingDivisionOptions({
    required this.divisionName,
  });
}

class UpdateDivingDivisionOptions {
  final String newName;
  final int divisionId;

  UpdateDivingDivisionOptions({
    required this.newName,
    required this.divisionId,
  });
}

class CreateDivingSpecialityOptions {
  final String specialityName;
  CreateDivingSpecialityOptions({
    required this.specialityName,
  });
}

class UpdateDivingSpecialityOptions {
  final String specialityName;
  final int specialityId;

  UpdateDivingSpecialityOptions({
    required this.specialityName,
    required this.specialityId,
  });
}

class LoadParticipantsOptions{
  final int? specialityId;
  final int? divisionId;

  LoadParticipantsOptions({
    this.divisionId,
    this.specialityId
  });
}


class LoadCompetitionScoresOptions{
  final int? specialityId;
  final int? divisionId;

  LoadCompetitionScoresOptions({
    this.divisionId,
    this.specialityId
  });
}