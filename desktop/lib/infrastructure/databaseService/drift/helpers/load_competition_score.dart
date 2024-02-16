import 'package:sql_builder/sql_builder.dart';
import 'package:sql_builder/sql_builder_port.dart';

SqlBuilder loadCompetitonScoreHelper() {
  final columns = [
    Column(
      "*",
      prefix: "Scores",
    ),
    Column(
      "participant_first_name",
      prefix: "Participants",
    ),
    Column(
      "participant_last_name",
      prefix: "Participants",
    ),
    Column(
      "entry_time",
      prefix: "Participants",
    ),
    Column(
      "participant_series",
      prefix: "Participants",
    ),
    Column(
      "participant_column",
      prefix: "Participants",
    ),
    Column(
      "specialty_name",
      prefix: "DivingSpecialties",
    ),
    Column(
      "division_name",
      prefix: "DivingDivisions",
    ),
    Column(
      "age_division_name",
      prefix: "AgeDivisions",
    ),
    Column(
      "gender_name",
      prefix: "Genders",
    ),
    Column(
      "club_name",
      prefix: "Clubs",
    ),
  ];

  final tables = [Table("Scores")];

  final joins = [
    Join(
      JoinParam(
        Table("DivingSpecialties"),
        Column("specialty_id"),
      ),
      JoinParam(
        Table("Scores"),
        Column("specialty_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("Participants"),
        Column("participant_id"),
      ),
      JoinParam(
        Table("Scores"),
        Column("participant_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("AgeDivisionsEntry"),
        Column("age_division_year"),
      ),
      JoinParam(
        Table("Scores"),
        Column("age_division_year"),
      ),
    ),
    Join(
      JoinParam(
        Table("AgeDivisions"),
        Column("age_division_id"),
      ),
      JoinParam(
        Table("AgeDivisionsEntry"),
        Column("age_division_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("Genders"),
        Column("gender_id"),
      ),
      JoinParam(
        Table("Scores"),
        Column("gender_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("DivingDivisions"),
        Column("division_id"),
      ),
      JoinParam(
        Table("Scores"),
        Column("division_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("Clubs"),
        Column("club_id"),
      ),
      JoinParam(
        Table("Participants"),
        Column("club_id"),
      ),
    )
  ];

  return SqlBuilder()
    ..select(columns)
    ..from(tables)
    ..join(joins)
    ..orderBy(OrderBy(columns: [Column("score", prefix: "Score")]));
}
