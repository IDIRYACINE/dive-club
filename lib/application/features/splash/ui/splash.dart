import 'package:dive_club/application/commons/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../logic/controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    initApp();
    
    return const Scaffold(
      body: Center(
        child: AppLogo(),
      ),
    );
  }
}
