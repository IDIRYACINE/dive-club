enum Tables {
  participants,
  clubs,
  divingDivisions,
  divingSpecialities,
  ageDivisions,
  scores,
  genders,
  ageDivisionsEntry,
}

extension TablesNames on Tables {
  String get name {
    switch (this) {
      case Tables.participants:
        return 'Participants';
      case Tables.clubs:
        return 'Clubs';
      case Tables.divingDivisions:
        return 'DivingDivisions';
      case Tables.divingSpecialities:
        return 'DivingSpecialties';
      case Tables.ageDivisions:
        return 'AgeDivisions';
      case Tables.scores:
        return 'Scores';
      case Tables.genders:
        return 'Genders';
      case Tables.ageDivisionsEntry:
        return 'AgeDivisionsEntry';
    }
  }
}

enum ParticipantsColumns {
  id,
  firstName,
  lastName,
  entryTime,
  series,
  column,
  clubId,
  genderId,
  divisionId,
  specialtyId,
  ageDivisionYear,
}

extension ParticipantsColumnsNames on ParticipantsColumns {
  String get name {
    switch (this) {
      case ParticipantsColumns.id:
        return 'participant_id';
      case ParticipantsColumns.firstName:
        return 'participant_first_name';
      case ParticipantsColumns.lastName:
        return 'participant_last_name';
      case ParticipantsColumns.entryTime:
        return 'entry_time';
      case ParticipantsColumns.series:
        return 'participant_series';
      case ParticipantsColumns.column:
        return 'participant_column';
      case ParticipantsColumns.clubId:
        return 'club_id';
      case ParticipantsColumns.genderId:
        return 'gender_id';
      case ParticipantsColumns.divisionId:
        return 'division_id';
      case ParticipantsColumns.specialtyId:
        return 'specialty_id';
      case ParticipantsColumns.ageDivisionYear:
        return 'age_division_year';
    }
  }
}

enum DivingSpecialtiesColumns {
  id,
  name,
}

extension DivingSpecialtiesColumnsNames on DivingSpecialtiesColumns {
  String get name {
    switch (this) {
      case DivingSpecialtiesColumns.id:
        return 'specialty_id';
      case DivingSpecialtiesColumns.name:
        return 'specialty_name';
    }
  }
}

enum DivingDivisionsColumns {
  id,
  name,
}

extension DivingDivisionsColumnsNames on DivingDivisionsColumns {
  String get name {
    switch (this) {
      case DivingDivisionsColumns.id:
        return 'division_id';
      case DivingDivisionsColumns.name:
        return 'division_name';
    }
  }
}

enum ClubsColumns {
  id,
  name,
}

extension ClubsColumnsNames on ClubsColumns {
  String get name {
    switch (this) {
      case ClubsColumns.id:
        return 'club_id';
      case ClubsColumns.name:
        return 'club_name';
    }
  }
}

enum AgeDivisionsColumns {
  id,
  name,
}

extension AgeDivisionsColumnsNames on AgeDivisionsColumns {
  String get name {
    switch (this) {
      case AgeDivisionsColumns.id:
        return 'age_division_id';
      case AgeDivisionsColumns.name:
        return 'age_division_name';
    }
  }
}

enum AgeDivisionsEntryColumns {
  year,
  id,
}

extension AgeDivisionsEntryColumnsNames on AgeDivisionsEntryColumns {
  String get name {
    switch (this) {
      case AgeDivisionsEntryColumns.year:
        return 'age_division_year';
      case AgeDivisionsEntryColumns.id:
        return 'age_division_id';
    }
  }
}

enum GendersColumns {
  id,
  name,
}

extension GendersColumnsNames on GendersColumns {
  String get name {
    switch (this) {
      case GendersColumns.id:
        return 'gender_id';
      case GendersColumns.name:
        return 'gender_name';
    }
  }
}

enum ScoresColumns {
  participantId,
  divisionId,
  specialtyId,
  ageDivisionYear,
  genderId,
  scoreDate,
  score,
}

extension ScoresColumnsNames on ScoresColumns {
  String get name {
    switch (this) {
      case ScoresColumns.participantId:
        return 'participant_id';
      case ScoresColumns.divisionId:
        return 'division_id';
      case ScoresColumns.specialtyId:
        return 'specialty_id';
      case ScoresColumns.ageDivisionYear:
        return 'age_division_year';
      case ScoresColumns.genderId:
        return 'gender_id';
      case ScoresColumns.scoreDate:
        return 'score_date';
      case ScoresColumns.score:
        return 'score';
    }
  }
}