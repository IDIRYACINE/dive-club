import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
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
          specialtyId: SpecialtyId(bloc.state.specialties.length + 1),
          specialtyName: SpecialtyName(_data.name));

      _registerSpecialty(entity);
      
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

  Future<void> _registerSpecialty(DivingSpecialtyEntity entity) async {
    final options = CreateDivingSpecialityOptions(
        specialityName: entity.specialtyName.value);
    ServicesProvider.instance().databasePort.insertDivingSpeciality(options);
  }
}
