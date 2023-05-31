import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class AgeDivisionForm extends StatelessWidget {
  const AgeDivisionForm({Key? key, required this.controller}) : super(key: key);
  final AgeDivisionController controller;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: AgeDivisionController.key,
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
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.idLabel,
            ),
            controller: controller.yearController,
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

class AgeDivisionDialog extends StatelessWidget {
  const AgeDivisionDialog({Key? key, this.entity}) : super(key: key);

  final AgeDivisionEntity? entity;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = AgeDivisionController(entity);
    final isCreate = entity == null;

    if (!isCreate) {
      controller.updateName(entity!.divisionName.value);
    }

    return AlertDialog(
      title: Text(isCreate
          ? localizations.addAgeDivisionLabel
          : localizations.updateAgeDivisionLabel),
      content: AgeDivisionForm(
        controller: controller,
      ),
    );
  }
}
