import 'package:dive_club/application/features/divisions/ui/forms.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import 'options.dart';

class DivisionDataHolder {
  final TextEditingController nameController = TextEditingController();

  DivisionDataHolder();
}

class DivisionController {
  static final key = GlobalKey<FormState>();

  TextEditingController get nameController => _data.nameController;

  DivisionController([this._entity]);

  final DivingDivisionEntity? _entity;
  final DivisionDataHolder _data = DivisionDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<DivisionBloc>(context);

      if (_entity != null) {
        final updatedEntity = _entity!
            .copyWith(divisionName: DivisionName(_data.nameController.text));

        final event = UpdateDivisionEvent(
          updatedEntity,
        );

        bloc.add(event);

        _updateDivision(updatedEntity);
      } else {
        final entity = DivingDivisionEntity(
          divisionId: DivisionId(bloc.state.divisions.length + 1),
          divisionName: DivisionName(_data.nameController.text),
        );
        _registerDivision(entity);

        final event = AddDivisionEvent(entity);

        bloc.add(event);
      }

      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.nameController.text = value;
  }

  void addDivision() {
    const dialog = DivisionDialog();
    NavigationService.displayDialog(dialog);
  }
}

class RowController {
  void updateDivision(DivingDivisionEntity entity) {
    final dialog = DivisionDialog(entity: entity);
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
          updateDivision(
            options.entity,
          );
          break;
      }
    }
  }
}

Future<void> _registerDivision(DivingDivisionEntity entity) async {
  final options =
      CreateDivingDivisionOptions(divisionName: entity.divisionName.value);
  ServicesProvider.instance().databasePort.insertDivingDivision(options);
}

Future<void> _updateDivision(DivingDivisionEntity entity) async {
  final options = UpdateDivingDivisionOptions(
      newName: entity.divisionName.value, divisionId: entity.divisionId.value);
  ServicesProvider.instance().databasePort.updateDivingDivision(options);
}
