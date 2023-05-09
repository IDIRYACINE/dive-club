import 'value_objects.dart';

class SearchParticipantOptions {
  final String name;

  SearchParticipantOptions({
    required this.name,
  });
}

class UpdateScoreOptions {
  final int participantId;
  final int competitionId;
  final int specialityId;
  final double score;

  UpdateScoreOptions({
    required this.participantId,
    required this.competitionId,
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

class CreateDivingCompetitionOptions {
  final String competitionName;
  CreateDivingCompetitionOptions({
    required this.competitionName,
  });
}

class UpdateDivingCompetitionOptions {
  final String newName;
  final int competitionId;

  UpdateDivingCompetitionOptions({
    required this.newName,
    required this.competitionId,
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
  final int? competitionId;

  LoadParticipantsOptions({
    this.competitionId,
    this.specialityId
  });
}


class LoadCompetitionScoresOptions{
  final int? specialityId;
  final int? competitionId;

  LoadCompetitionScoresOptions({
    this.competitionId,
    this.specialityId
  });
}