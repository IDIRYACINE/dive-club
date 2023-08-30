import 'package:sql_builder/sql_builder.dart';
import 'package:sql_builder/sql_builder_port.dart';

SqlBuilder loadParticipantsHelper() {
  final columns = [
    Column(
      "*",
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

  final tables = [Table("Participants")];

  final joins = [
    Join(
      JoinParam(
        Table("DivingSpecialties"),
        Column("specialty_id"),
      ),
      JoinParam(
        Table("Participants"),
        Column("specialty_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("AgeDivisionsEntry"),
        Column("age_division_year"),
      ),
      JoinParam(
        Table("Participants"),
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
        Table("Participants"),
        Column("gender_id"),
      ),
    ),
    Join(
      JoinParam(
        Table("DivingDivisions"),
        Column("division_id"),
      ),
      JoinParam(
        Table("Participants"),
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
    ..join(joins);
}
