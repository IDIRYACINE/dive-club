import 'package:dive_club/application/commons/widgets/app_logo.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final logoFlex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.paddings),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: logoFlex,
                child: const AppLogo(),
              ),
              const Flexible(
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
