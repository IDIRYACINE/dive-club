import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class SpecialtyForm extends StatelessWidget {
  const SpecialtyForm({Key? key, required this.controller}) : super(key: key);
  final SpecialtyController controller;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: SpecialtyController.key,
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

class SpecialtyDialog extends StatelessWidget {
  const SpecialtyDialog({Key? key, this.entity}) : super(key: key);

  final DivingSpecialtyEntity? entity;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = SpecialtyController(entity);
    final isCreate = entity == null;

    if(!isCreate){
      controller.updateName(entity!.specialtyName.value);
    }

    return AlertDialog(
      title: Text(isCreate
          ? localizations.addSpecialityLabel
          : localizations.updateSpecialtyLabel),
      content: SpecialtyForm(
        controller: controller,
      ),
    );
  }
}
