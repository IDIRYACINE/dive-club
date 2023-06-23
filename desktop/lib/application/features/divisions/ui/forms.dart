import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/division_controller.dart';

class DivisionForm extends StatelessWidget {
  const DivisionForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DivisionController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: DivisionController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
            validator: validatorEmptyText,
            controller: controller.nameController,
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

class DivisionDialog extends StatelessWidget {
  const DivisionDialog({Key? key, this.entity}) : super(key: key);

  final DivingDivisionEntity? entity;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = DivisionController();
    final bool isCreate = entity == null;

    if (!isCreate) {
      controller.updateName(entity!.divisionName.value);
    }

    return AlertDialog(
      title: Text(isCreate
          ? localizations.addDivisionLabel
          : localizations.updateDivisionLabel),
      content: DivisionForm(
        controller: controller,
      ),
    );
  }
}
