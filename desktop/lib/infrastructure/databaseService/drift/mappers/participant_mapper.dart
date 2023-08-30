import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';


class ParticipantMapper {
    static List<ParticipantEntity> fromSelectJson(
      List<Map<String,dynamic>> participants, ParticipantMapperPort mapper) {
    List<ParticipantEntity> results = [];

    if (participants.isEmpty) return results;


    for (Map<String,dynamic> participant in participants) {
      final temp = Participant(
          id: participant["participant_id"],
          divisionId: participant["division_id"],
          specialityId: participant["specialty_id"],
          divisionName: participant["division_name"],
          firstName: participant["participant_first_name"],
          specialityName: participant["specialty_name"],
          ageDivisionId: participant["age_division_year"],
          genderId: participant["gender_id"],
          lastName: participant["participant_last_name"],
          ageDivisionName: participant["age_division_name"],
          clubId: participant["club_id"],
          clubName: participant["club_name"],
          column: participant["participant_column"],
          entryTime: participant["entry_time"],
          series: participant["participant_series"], 
           );

      final res = mapper.toDomainEntity(temp);

      results.add(res);
    }

    return results;
  }
}

