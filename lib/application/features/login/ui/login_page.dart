import 'package:dive_club/application/commons/widgets/app_logo.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final logoFlex = 1;
  final formFlex = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.paddingsLarge),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: logoFlex,
                child: const AppLogo(),
              ),
               Flexible(
                flex : formFlex,
                child: const LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
