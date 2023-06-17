import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/infrastrucutre/database/options.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import '../ui/forms.dart';
import 'options.dart';

class ClubDataHolder {
  final TextEditingController nameController = TextEditingController();

  String get name => nameController.text;
  set name(String value) {
    nameController.text = value;
  }

  ClubDataHolder();
}

class ClubController {
  static final key = GlobalKey<FormState>();

  TextEditingController get nameController => _data.nameController;

  ClubController([this._entity]);

  final ClubEntity? _entity;
  final ClubDataHolder _data = ClubDataHolder();

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<ClubBloc>(context);

      if (_entity != null) {
        final updatedEntity =
            _entity!.copyWith(clubName: ClubName(_data.name));

        final event = UpdateClubEvent(
          updatedEntity,
        );

        bloc.add(event);

        _updateClub(updatedEntity);
      } else {
        final entity = ClubEntity(
          clubId: ClubId(bloc.state.clubs.length + 1),
          clubName: ClubName(_data.name),
        );

        _registerClub(entity);

        final event = AddClubEvent(entity);

        bloc.add(event);
      }
      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.name = value;
  }

  void addClub() {
    const dialog = ClubDialog();
    NavigationService.displayDialog(dialog);
  }
}

class RowController {
  void updateClub(ClubEntity entity) {
    final dialog = ClubDialog(
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
          updateClub(options.entity);
          break;
      }
    }
  }
}

Future<void> _registerClub(ClubEntity entity) async {
  final options =
      CreateClubOptions(clubName: entity.clubName.value);
  ServicesProvider.instance().databasePort.insertClub(options);
}

Future<void> _updateClub(ClubEntity entity) async {
  final options = UpdateClubOptions(
      clubName: entity.clubName.value,
      clubId: entity.clubId.value);

  ServicesProvider.instance().databasePort.updateClub(options);
}
