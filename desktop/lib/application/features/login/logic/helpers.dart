import 'package:dive_club/application/commons/widgets/dialogs.dart';
import 'package:dive_club/application/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  void handleLogin() {
    if (username.text == "idiryacine" && password.text == "idiryacine") {
      NavigationService.pushNamedReplacement(Routes.dashboardRoute);
      return;
    }

    const dialog = InfoDialog(message: "wrong credentails");
    NavigationService.displayDialog(dialog);
  }
}
