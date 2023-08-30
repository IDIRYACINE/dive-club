import 'package:dive_club/application/features/ageDivision/feature.dart';
import 'package:dive_club/application/features/clubs/feature.dart';
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
  final AgeDivisionBloc ageDivisionBloc;
  final ClubBloc clubBloc;

  InitAppOptions({
    required this.competitionBloc,
    required this.participantsBloc,
    required this.divisionsBloc,
    required this.specialtiesBloc,
    required this.ageDivisionBloc,
    required this.clubBloc,
  });
}

Future<void> initApp(InitAppOptions options) async {
  await Future.delayed(const Duration(seconds: 2));

  final databaseService = ServicesProvider.instance().databasePort;
  await databaseService.insertDefaultValues();

  await _loadDivisions(databaseService, options.divisionsBloc);
  await _loadSpecialties(databaseService, options.specialtiesBloc);
  await _loadAgeDivisions(databaseService, options.ageDivisionBloc);
  await _loadClubs(databaseService, options.clubBloc);

  NavigationService.pushNamedReplacement(Routes.loginRoute);
}

Future<void> _loadClubs(DatabasePort databaseService, ClubBloc bloc) async {

  final clubs = await databaseService.loadClubs();

  final event = LoadClubsEvent(clubs.clubs);

  bloc.add(event);
}

Future<void> _loadAgeDivisions(
    DatabasePort databaseService, AgeDivisionBloc bloc) async {

  final diviisons = await databaseService.loadAgeDivisions();

  final event = LoadAgeDivisionsEvent(diviisons.ageDivisions);

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
