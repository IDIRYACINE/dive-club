abstract class DatabaseEntity {}

class Participant extends DatabaseEntity {
  final int id;
  final String name;
  final DateTime birthDate;
  final int divisionId;
  final String divisionName;
  final String specialityName;
  final int specialityId;

  Participant({
    required this.divisionName,
    required this.divisionId,
    required this.id,
    required this.name,
    required this.birthDate,
    required this.specialityName,
    required this.specialityId,
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
  final double score;
  final DateTime date;

  final String participantName;
  final String specialtyName;
  final String divisionName;

  CompetitionScore({
    required this.participantId,
    required this.divisionId,
    required this.specialityId,
    required this.score,
    required this.date,
    required this.participantName,
    required this.specialtyName,
    required this.divisionName,
  });
}
