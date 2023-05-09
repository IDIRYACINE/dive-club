import 'package:dive_club/application/navigation/feature.dart';
import 'package:flutter/material.dart';

class RegistrationDataHolder {
  String name;
  DateTime birthDate = DateTime.now();

  RegistrationDataHolder({this.name = '', DateTime? birthDate}) {
    if (birthDate != null) {
      this.birthDate = birthDate;
    }
  }
}

class RegistrationFormController {
  static final key = GlobalKey<FormState>();

  RegistrationFormController();

  final RegistrationDataHolder _data = RegistrationDataHolder();

  Future<void> selectBirthDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (date != null) {}
  }

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister() {
    if (key.currentState!.validate()) {
      // todo register participant
    }

    NavigationService.pop();
  }


  void onNameChanged(String value) {
    _data.name = value;
  }

  void onBirthDateChanged(DateTime value) {
    _data.birthDate = value;
  }
}
