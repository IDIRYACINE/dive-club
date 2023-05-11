import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class CompetittionScoreForm extends StatelessWidget {
  const CompetittionScoreForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScoreController();
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: ScoreController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.participantScoreLabel,
            ),
            onChanged: controller.updateScore,
            validator: validatorScore,
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

class ScoreDialog extends StatelessWidget {
  const ScoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.addSpecialityLabel),
      content: const CompetittionScoreForm(),
    );
  }
}
