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
  final int score;

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
  final int score;
  final DateTime date;

  final int genderId;
  final int ageDivisionId;

  CreateScoreOptions( {
    required this.participantId,
    required this.divisionId,
    required this.specialityId,
    required this.score,
    required this.date,
    required  this.genderId, required  this.ageDivisionId,
  });
}

class CreateParticipantOptions {
  final int id;
  final String firstName;
  final DateTime birthDate;
  final int divisionId;
  final int specialityId;

  final int clubId;

  final int entryTime;

  final int genderId;

  final String lastName;

  final int ageDivisionId;

  CreateParticipantOptions({
    required this.divisionId,
    required this.id,
    required this.firstName,
    required this.birthDate,
    required this.specialityId,
    required this.clubId,
    required this.entryTime,
    required this.genderId,
    required this.lastName,
    required this.ageDivisionId,
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

class CreateClubOptions {
  final String clubName;

  CreateClubOptions({
    required this.clubName,
  });
}

class UpdateClubOptions {
  final String clubName;
  final int clubId;

  UpdateClubOptions({
    required this.clubName,
    required this.clubId,
  });
}

class CreateDivingSpecialityOptions {
  final String specialityName;
  CreateDivingSpecialityOptions({
    required this.specialityName,
  });
}

class CreateAgeDivisionOptions {
  final String divisionName;
  final int year;
  
  CreateAgeDivisionOptions({
    required this.divisionName,
    required this.year
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

class UpdateAgeDivisionOptions {
  final String divisionName;
  final int divisionId;

  UpdateAgeDivisionOptions({
    required this.divisionName,
    required this.divisionId,
  });
}

class LoadParticipantsOptions {
  final int? specialityId;
  final int? divisionId;
  final int? participantId;
  final int? clubId;

  LoadParticipantsOptions({
    this.divisionId,
    this.specialityId,
    this.clubId,
    this.participantId,
  });
}

class LoadCompetitionScoresOptions {
  final int? specialityId;
  final int? divisionId;

  LoadCompetitionScoresOptions({this.divisionId, this.specialityId});
}
