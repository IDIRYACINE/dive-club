import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class SpecialtyForm extends StatelessWidget {
  const SpecialtyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SpecialtyFormController();
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: SpecialtyFormController.key,
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
