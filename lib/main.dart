import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/features/divisions/feature.dart';
import 'application/features/layout/feature.dart';
import 'application/features/participants/feature.dart';
import 'application/features/specialties/feature.dart';
import 'application/navigation/feature.dart';
import 'resources/metadata.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'resources/themes.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AppBloc()),
    BlocProvider(create: (context) => SpecialtyBloc()),
    BlocProvider(create: (context) => DivisionBloc()),
    BlocProvider(create: (context) => ParticipantBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppMetadata.appName,
      theme: AppThemes.lighTheme,
      navigatorKey: NavigationService.key,
      onGenerateRoute: AppRouter.generateRoutes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
    );
  }
}
