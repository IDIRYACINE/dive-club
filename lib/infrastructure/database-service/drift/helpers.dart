

import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/database/database.dart' as raw;



List<ParticipantEntity> mapToDomainParticipants(List<raw.Participant> participants , ParticipantMapperPort mapper){
  List<ParticipantEntity> results = [];

  for( raw.Participant participant in participants){
    final temp = Participant(id: participant.id, name: participant.participantName,
     birthDate: participant.birthDate, competitionId: participant.competitionId, specialityId: participant.specialtyId);

     final res = mapper.toDomainEntity(temp);

     results.add(res);
  }


  return results;

}


List<CompetitionScoreEntity> mapToDomainScores(List<raw.Score> scores , ScoreMapperPort mapper){
  List<CompetitionScoreEntity> results = [];

  for( raw.Score score in scores){
    final temp = CompetitionScore(participantId: score.participantId,
     competitionId: score.competitionId, specialityId: score.specialtyId, score: score.score, date: score.scoreDate);
     final res = mapper.toDomainEntity(temp);

     results.add(res);
  }


  return results;

}



List<DivingCompetitionEntity> mapToDomainDivingCompetitions(List<raw.DivingCompetition> divingCompetitions , CompetitionMapperPort mapper){
  List<DivingCompetitionEntity> results = [];

  for( raw.DivingCompetition divingCompetition in divingCompetitions){
    final temp = DivingCompetition(id: divingCompetition.id, name: divingCompetition.name);
     final res = mapper.toDomainEntity(temp);

     results.add(res);
  }


  return results;

}


List<DivingSpecialityEntity> mapToDomainDivingSpecialitys(List<raw.DivingSpecialtie> divingSpecialitys , SpecialityMapperPort mapper){
  List<DivingSpecialityEntity> results = [];

  for( raw.DivingSpecialtie divingSpeciality in divingSpecialitys){
    final temp = DivingSpeciality(id: divingSpeciality.id, name: divingSpeciality.name);
     final res = mapper.toDomainEntity(temp);

     results.add(res);
  }


  return results;

}