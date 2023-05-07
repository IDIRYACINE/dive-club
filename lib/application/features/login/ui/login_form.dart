

import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget{
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context)!.login);
  }

}