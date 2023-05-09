import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/division_form_controller.dart';

class DivisionForm extends StatelessWidget {
  const DivisionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DivisionFormController();
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: DivisionFormController.key,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
          ),
          GenericFormActions(
            onConfirmPressed: controller.onRegister,
            onCancelPressed: controller.onCancel,
          )
        ],
      ),
    );
  }
}
