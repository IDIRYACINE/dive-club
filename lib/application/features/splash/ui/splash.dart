import 'package:dive_club/application/commons/widgets/app_logo.dart';
import 'package:dive_club/application/features/ageDivision/state/bloc.dart';
import 'package:dive_club/application/features/clubs/state/bloc.dart';
import 'package:dive_club/application/features/competition/state/bloc.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final options = InitAppOptions(
        competitionBloc: BlocProvider.of<CompetitionBloc>(context),
        participantsBloc: BlocProvider.of<ParticipantBloc>(context),
        divisionsBloc: BlocProvider.of<DivisionBloc>(context),
        specialtiesBloc: BlocProvider.of<SpecialtyBloc>(context),
        ageDivisionBloc: BlocProvider.of<AgeDivisionBloc>(context),
        clubBloc: BlocProvider.of<ClubBloc>(context));

    initApp(options);

    return const Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
