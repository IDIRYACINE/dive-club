import 'package:dive_club/application/navigation/feature.dart';
import 'package:flutter/material.dart';

class DivisionDataHolder {
  String name;

  DivisionDataHolder({this.name = ''});
  
}

class DivisionFormController {
  static final key = GlobalKey<FormState>();

  DivisionFormController();

  final DivisionDataHolder _data = DivisionDataHolder();

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
