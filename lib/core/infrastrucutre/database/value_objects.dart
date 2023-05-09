
abstract class DatabaseEntity{}

class Participant extends DatabaseEntity {
  final int id;
  final String name;
  final DateTime birthDate;
  final int competitionId;
  final int specialityId;

  Participant({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.competitionId,
    required this.specialityId,
  });
}

class DivingCompetition extends DatabaseEntity {
  final int id;
  final String name;

  DivingCompetition({
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
  final int competitionId;
  final int specialityId;
  final double score;
  final DateTime date;

  CompetitionScore({
    required this.participantId,
    required this.competitionId,
    required this.specialityId,
    required this.score,
    required this.date,
  });
}
