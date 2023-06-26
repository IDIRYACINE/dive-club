import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';

import 'options.dart';
import 'results.dart';

abstract class DatabasePort {
  Future<DatabaseOperationResult> insertParticipant(
      CreateParticipantOptions options);
  Future<DatabaseOperationResult> insertDivingDivision(
      CreateDivingDivisionOptions options);
  Future<DatabaseOperationResult> insertDivingSpeciality(
      CreateDivingSpecialityOptions options);
  Future<DatabaseOperationResult> insertScore(CreateScoreOptions options);

  Future<DatabaseOperationResult> updateDivingDivision(
      UpdateDivingDivisionOptions options);
  Future<DatabaseOperationResult> updateScore(UpdateScoreOptions options);
  Future<DatabaseOperationResult> updateDivingSpeciality(
      UpdateDivingSpecialityOptions options);

  Future<LoadCompetitionScoresResult> loadCompetitionScores(
      LoadCompetitionScoresOptions options);
  Future<LoadDivingDivisionsResult> loadDivingDivisions();
  Future<LoadDivingSpecialitiesResult> loadDivingSpecialities();
  Future<LoadParticipantsResult> loadParticipants(
      LoadParticipantsOptions options);

  Future<DatabaseOperationResult> insertAgeDivision(
      CreateAgeDivisionOptions options);
  Future<DatabaseOperationResult> updateAgeDivision(
      UpdateAgeDivisionOptions options);
  Future<LoadAgeDivisionsResult> loadAgeDivisions();

  Future<DatabaseOperationResult> insertClub(CreateClubOptions options);
  Future<DatabaseOperationResult> updateClub(UpdateClubOptions options);
  Future<LoadClubsResult> loadClubs();

  Future<DatabaseOperationResult> updateParticipantsSeries(
      List<ParticipantEngagement> engagements);

  Future<DatabaseOperationResult> insertDefaultValues();

  Future<DatabaseOperationResult> deleteParticipant(DeleteParticipantOptions options);

  Future<DatabaseOperationResult> deleteScore(DeleteScoreOptions options);
  Future<DatabaseOperationResult> updateScoreOptions(UpdateScoreOptions options);

  Future<DatabaseOperationResult> updateParticipant(UpdateParticipantOptions options);

}
