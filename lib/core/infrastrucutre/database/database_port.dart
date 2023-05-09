


import 'options.dart';
import 'results.dart';

abstract class DatabasePort{
  Future<DatabaseOperationResult> insertParticipant(CreateParticipantOptions options);
  Future<DatabaseOperationResult> insertDivingCompetition(CreateDivingCompetitionOptions options);
  Future<DatabaseOperationResult> insertDivingSpeciality(CreateDivingSpecialityOptions options);
  Future<DatabaseOperationResult> insertScore(CreateScoreOptions options);

  Future<DatabaseOperationResult> updateDivingCompetition(UpdateDivingCompetitionOptions options);
  Future<DatabaseOperationResult> updateScore(UpdateScoreOptions options);
  Future<DatabaseOperationResult> updateDivingSpeciality(UpdateDivingSpecialityOptions options);

  Future<LoadCompetitionScoresResult> loadCompetitionScores(LoadCompetitionScoresOptions options);
  Future<LoadDivingCompetitionsResult> loadDivingCompetitions();
  Future<LoadDivingSpecialitiesResult> loadDivingSpecialities();
  Future<LoadParticipantsResult> loadParticipants(LoadParticipantsOptions options);

}