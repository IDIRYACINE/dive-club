import 'package:dive_club/application/navigation/feature.dart';
import 'package:flutter/material.dart';

class SpecialtyDataHolder {
  String name;

  SpecialtyDataHolder({this.name = ''});
  
}

class SpecialtyFormController {
  static final key = GlobalKey<FormState>();

  SpecialtyFormController();

  final SpecialtyDataHolder _data = SpecialtyDataHolder();

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

}
