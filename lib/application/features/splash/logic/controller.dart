


import 'package:dive_club/application/navigation/feature.dart';

Future<void> initApp() async {
  await Future.delayed(const Duration(seconds: 2));
  NavigationService.pushNamedReplacement(Routes.loginRoute);
}