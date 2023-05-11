
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
  final int participantId;
  final int divisionId;
  final int specialityId;
  final double score;
  final DateTime date;
  CreateScoreOptions({
    required this.participantId,
    required this.divisionId,
    required this.specialityId,
    required this.score,
    required this.date,
  });
}

class CreateParticipantOptions {
  final int id;
  final String name;
  final DateTime birthDate;
  final int divisionId;
  final int specialityId;

  CreateParticipantOptions({
    required this.divisionId,
    required this.id,
    required this.name,
    required this.birthDate,
    required this.specialityId,
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

class LoadParticipantsOptions {
  final int? specialityId;
  final int? divisionId;

  LoadParticipantsOptions({this.divisionId, this.specialityId});
}

class LoadCompetitionScoresOptions {
  final int? specialityId;
  final int? divisionId;

  LoadCompetitionScoresOptions({this.divisionId, this.specialityId});
}
