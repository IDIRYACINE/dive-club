import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/domain/clubs/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class ClubForm extends StatelessWidget {
  const ClubForm({Key? key, required this.controller}) : super(key: key);
  final ClubController controller;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: ClubController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
            controller: controller.nameController,
            validator: validatorEmptyText,
          ),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onConfirmPressed: () => controller.onRegister(context),
            onCancelPressed: controller.onCancel,
          )
        ],
      ),
    );
  }
}

class ClubDialog extends StatelessWidget {
  const ClubDialog({Key? key, this.entity}) : super(key: key);

  final ClubEntity? entity;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = ClubController(entity);
    final isCreate = entity == null;

    if(!isCreate){
      controller.updateName(entity!.clubName.value);
    }

    return AlertDialog(
      title: Text(isCreate
          ? localizations.addClubLabel
          : localizations.updateClubLabel),
      content: ClubForm(
        controller: controller,
      ),
    );
  }
}
