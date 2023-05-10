import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import '../ui/forms.dart';

class SpecialtyDataHolder {
  String name;

  SpecialtyDataHolder({this.name = ''});
}

class SpecialtyController {
  static final key = GlobalKey<FormState>();

  SpecialtyController();

  final SpecialtyDataHolder _data = SpecialtyDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<SpecialtyBloc>(context);

      final entity = DivingSpecialtyEntity(
          specialtyId: SpecialtyId(bloc.state.specialties.length),
          specialtyName: SpecialtyName(_data.name));
      final event = AddSpecialtyEvent(entity);

      bloc.add(event);
      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.name = value;
  }

  void addSpecialty() {
    const dialog = SpecialtyDialog();
    NavigationService.displayDialog(dialog);
  }
}
