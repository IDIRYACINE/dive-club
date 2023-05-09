import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/registration_form_controller.dart';
import 'actions.dart';

class ParticipantRegistartionForm extends StatelessWidget {
  ParticipantRegistartionForm({super.key});

  final RegistrationFormController controller = RegistrationFormController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Form(
      key: RegistrationFormController.key,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(localizations.registrationFormTitle,
              style: theme.textTheme.displaySmall),
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
            validator: validateName,
            onChanged: controller.onNameChanged,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: localizations.birthDateLabel,
            ),
            readOnly: true,
            onTap: () => controller.selectBirthDate(context),
          ),
          RegistartionFormActions(
            onCancelPressed: controller.onCancel,
            onConfirmPressed: controller.onRegister,
          )
        ],
      ),
    );
  }
}
