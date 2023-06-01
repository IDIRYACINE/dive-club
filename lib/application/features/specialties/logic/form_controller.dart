import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import '../ui/forms.dart';
import 'options.dart';

class SpecialtyDataHolder {
  final TextEditingController nameController = TextEditingController();

  String get name => nameController.text;
  set name(String value) {
    nameController.text = value;
  }

  SpecialtyDataHolder();
}

class SpecialtyController {
  static final key = GlobalKey<FormState>();

  TextEditingController get nameController => _data.nameController;

  SpecialtyController([this._entity]);

  final DivingSpecialtyEntity? _entity;
  final SpecialtyDataHolder _data = SpecialtyDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<SpecialtyBloc>(context);

      if (_entity != null) {
        final updatedEntity =
            _entity!.copyWith(specialtyName: SpecialtyName(_data.name));

        final event = UpdateSpecialtyEvent(
          updatedEntity,
        );

        bloc.add(event);

        _updateSpecialty(updatedEntity);
      } else {
        final entity = DivingSpecialtyEntity(
          specialtyId: SpecialtyId(bloc.state.specialties.length + 1),
          specialtyName: SpecialtyName(_data.name),
        );

        _registerSpecialty(entity);

        final event = AddSpecialtyEvent(entity);

        bloc.add(event);
      }
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

class RowController {
  void updateSpecialty(DivingSpecialtyEntity entity) {
    final dialog = SpecialtyDialog(
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
          updateSpecialty(options.entity);
          break;
      }
    }
  }
}

Future<void> _registerSpecialty(DivingSpecialtyEntity entity) async {
  final options =
      CreateDivingSpecialityOptions(specialityName: entity.specialtyName.value);
  ServicesProvider.instance().databasePort.insertDivingSpeciality(options);
}

Future<void> _updateSpecialty(DivingSpecialtyEntity entity) async {
  final options = UpdateDivingSpecialityOptions(
      specialityName: entity.specialtyName.value,
      specialityId: entity.specialtyId.value);
  ServicesProvider.instance().databasePort.updateDivingSpeciality(options);
}
