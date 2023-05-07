import 'package:flutter/material.dart';

import 'application/navigation/feature.dart';
import 'resources/metadata.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'resources/themes.dart';

void main() {
  runApp(const MyApp());
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
