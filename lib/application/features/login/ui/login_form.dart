import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/helpers.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = LoginController();

    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.loginUsernameLabel,
            ),
            controller: controller.username,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.password,
            decoration: InputDecoration(
              labelText: localizations.loginPasswordLabel,
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonPrimary(
            onPressed: controller.handleLogin,
            text: localizations.loginButtonLabel,
          ),
        ],
      ),
    );
  }
}
