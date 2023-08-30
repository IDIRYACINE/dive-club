abstract class DatabaseEntity {}

class Participant extends DatabaseEntity {
  final int id;
  final String firstName;
  final String lastName;

  final int divisionId;
  final String divisionName;
  final String specialityName;
  final int specialityId;
  final int ageDivisionId;
  final int genderId;
  final String clubName;
  final String ageDivisionName;
  final int clubId;
  final int entryTime;
  int column;
  int series;

  Participant({
    required this.clubName,
    required this.ageDivisionName,
    required this.ageDivisionId,
    required this.genderId,
    required this.clubId,
    required this.entryTime,
    required this.divisionName,
    required this.divisionId,
    required this.lastName,
    required this.id,
    required this.firstName,
    required this.specialityName,
    required this.specialityId,
    this.column = -1,
    this.series = -1, 
  });
}

class DivingDivision extends DatabaseEntity {
  final int id;
  final String name;

  DivingDivision({
    required this.id,
    required this.name,
  });
}

class DivingSpeciality extends DatabaseEntity {
  final int id;
  final String name;

  DivingSpeciality({
    required this.id,
    required this.name,
  });
}

class CompetitionScore extends DatabaseEntity {
  final int participantId;
  final int divisionId;
  final int specialityId;
  final int genderId;
  final int ageDivisionId;

  final int score;
  final int entryTime;
  final DateTime date;

  final String participantFirstName;
  final String participantLastName;
  final String specialtyName;
  final String divisionName;

  final int clubId;

  final String clubName;

  int? column;

  int? series;

  final String ageDivisionName;

  final String genderName;

  CompetitionScore({
    required this.participantId,
    required this.divisionId,
    required this.specialityId,
    required this.entryTime,
    required this.genderId,
    required this.ageDivisionId,
    required this.score,
    required this.date,
    required this.participantFirstName,
    required this.specialtyName,
    required this.divisionName,
    required this.participantLastName,
    required this.clubId,
    required this.clubName,
    this.column,
    required this.ageDivisionName,
    required this.genderName,
    this.series,
  });
}

class AgeDivision extends DatabaseEntity {
  final int divisionId;
  final String divisionName;

  AgeDivision({required this.divisionId, required this.divisionName});
}

class Club extends DatabaseEntity {
  final int clubId;
  final String clubName;

  Club({required this.clubId, required this.clubName});
}

class Gender extends DatabaseEntity {
  final int genderId;
  final String genderName;

  Gender({required this.genderId, required this.genderName});
}
