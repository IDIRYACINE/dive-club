import 'package:dive_club/application/features/divisions/ui/forms.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';

class DivisionDataHolder {
  String name;

  DivisionDataHolder({this.name = ''});
}

class DivisionController {
  static final key = GlobalKey<FormState>();

  DivisionController();

  final DivisionDataHolder _data = DivisionDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<DivisionBloc>(context);

      final entity = DivingDivisionEntity(
        divisionId: DivisionId(bloc.state.divisions.length +1),
        divisionName: DivisionName(_data.name),
      );
      _registerDivision(entity);

      final event = AddDivisionEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.name = value;
  }

  void addDivision() {
    const dialog = DivisionDialog();
    NavigationService.displayDialog(dialog);
  }

  Future<void> _registerDivision(DivingDivisionEntity entity) async {
    final options =
        CreateDivingDivisionOptions(divisionName: entity.divisionName.value);
    ServicesProvider.instance().databasePort.insertDivingDivision(options);
  }
}
