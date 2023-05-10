import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/division_controller.dart';

class DivisionForm extends StatelessWidget {
  const DivisionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DivisionController();
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
            onChanged: controller.updateName,
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
  const DivisionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.addDivisionLabel),
      content: const DivisionForm(),
    );
  }
}
