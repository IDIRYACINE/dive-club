import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.loginUsernameLabel,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.loginPasswordLabel,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(localizations.loginButtonLabel),
          ),
        ],
      ),
    );
  }
}
