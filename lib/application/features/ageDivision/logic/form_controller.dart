import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import '../ui/forms.dart';
import 'options.dart';

class AgeDivisionDataHolder {
  final TextEditingController nameController = TextEditingController();

  String get name => nameController.text;
  set name(String value) {
    nameController.text = value;
  }

  final TextEditingController yearController = TextEditingController();

  String get year => yearController.text;

  set year(String value) {
    yearController.text = value;
  }

  AgeDivisionDataHolder();
}

class AgeDivisionController {
  static final key = GlobalKey<FormState>();

  TextEditingController get nameController => _data.nameController;
  TextEditingController get yearController => _data.yearController;

  AgeDivisionController([this._entity]);

  final AgeDivisionEntity? _entity;
  final AgeDivisionDataHolder _data = AgeDivisionDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<AgeDivisionBloc>(context);

      if (_entity != null) {
        final updatedEntity =
            _entity!.copyWith(divisionName: AgeDivisionName(_data.name));

        final event = UpdateAgeDivisionEvent(
          updatedEntity,
        );

        bloc.add(event);

        _updateAgeDivision(updatedEntity);
      } else {
        final entity = AgeDivisionEntity(
          divisionId: AgeDivisionId(int.parse(_data.year)),
          divisionName: AgeDivisionName(_data.name),
        );

        _registerAgeDivision(entity);

        final event = AddAgeDivisionEvent(entity);

        bloc.add(event);
      }
      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.name = value;
  }

  void addAgeDivision() {
    const dialog = AgeDivisionDialog();
    NavigationService.displayDialog(dialog);
  }
}

class RowController {
  void updateAgeDivision(AgeDivisionEntity entity) {
    final dialog = AgeDivisionDialog(
      entity: entity,
    );
    NavigationService.displayDialog(dialog);
  }

  Future<void> displayActions(DisplayActionsOptions options) async {
    final RenderBox overlay =
        Overlay.of(options.context).context.findRenderObject() as RenderBox;
    final RenderBox button = options.context.findRenderObject() as RenderBox;
    final position = button.localToGlobal(Offset.zero);

    final action = await showMenu(
      context: options.context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + 50,
        overlay.size.width - position.dx - button.size.width,
        overlay.size.height - position.dy,
      ),
      items: const [
        PopupMenuItem(
          value: 'update',
          child: Text('Update'),
        ),
      ],
    );

    if (action != null) {
      switch (action) {
        case 'update':
          updateAgeDivision(options.entity);
          break;
      }
    }
  }
}

Future<void> _registerAgeDivision(AgeDivisionEntity entity) async {
  final options = CreateAgeDivisionOptions(
      divisionName: entity.divisionName.value, year: entity.divisionId.value);
  ServicesProvider.instance().databasePort.insertAgeDivision(options);
}

Future<void> _updateAgeDivision(AgeDivisionEntity entity) async {
  final options = UpdateAgeDivisionOptions(
      divisionName: entity.divisionName.value,
      divisionId: entity.divisionId.value);

  ServicesProvider.instance().databasePort.updateAgeDivision(options);
}
