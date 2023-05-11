import 'package:dive_club/application/features/competition/feature.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';

class InitAppOptions {
  final CompetitionBloc competitionBloc;
  final ParticipantBloc participantsBloc;
  final DivisionBloc divisionsBloc;
  final SpecialtyBloc specialtiesBloc;

  InitAppOptions({
    required this.competitionBloc,
    required this.participantsBloc,
    required this.divisionsBloc,
    required this.specialtiesBloc,
  });
}

Future<void> initApp(InitAppOptions options) async {
  await Future.delayed(const Duration(seconds: 2));

  final databaseService = ServicesProvider.instance().databasePort;

  await _loadScores(databaseService, options.competitionBloc);
  await _loadParticipants(databaseService, options.participantsBloc);
  await _loadDivisions(databaseService, options.divisionsBloc);
  await _loadSpecialties(databaseService, options.specialtiesBloc);

  NavigationService.pushNamedReplacement(Routes.loginRoute);
}

Future<void> _loadScores(
    DatabasePort databaseService, CompetitionBloc bloc) async {
  final options = LoadCompetitionScoresOptions();

  final scores = await databaseService.loadCompetitionScores(options);

  final event = LoadScoresEvent(scores.scores);

  bloc.add(event);
}

Future<void> _loadParticipants(
    DatabasePort databaseService, ParticipantBloc bloc) async {
  final options = LoadParticipantsOptions();

  final participants = await databaseService.loadParticipants(options);

  final event = LoadParticipantsEvent(participants.participants);

  bloc.add(event);
}

Future<void> _loadDivisions(
    DatabasePort databaseService, DivisionBloc bloc) async {
  final divisions = await databaseService.loadDivingDivisions();

  final event = LoadDivisionsEvent(divisions.divisions);

  bloc.add(event);
}

Future<void> _loadSpecialties(
    DatabasePort databaseService, SpecialtyBloc bloc) async {
  final specialties = await databaseService.loadDivingSpecialities();

  final event = LoadSpecialtiesEvent(specialties.specialties);

  bloc.add(event);
}
