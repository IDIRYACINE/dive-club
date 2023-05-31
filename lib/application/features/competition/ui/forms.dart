import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/participants/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class CompetittionScoreForm extends StatefulWidget {
  const CompetittionScoreForm({Key? key, required this.controller})
      : super(key: key);
  final ScoreController controller;

  @override
  State<CompetittionScoreForm> createState() => _CompetittionScoreFormState();
}

class _CompetittionScoreFormState extends State<CompetittionScoreForm> {
  void search() {
    widget.controller.searchParticipant().then((res) => {setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: ScoreController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: localizations.idLabel,
                    ),
                    onChanged: widget.controller.updateSearchId,
                    validator: validatorId,
                  ),
                ),
                Expanded(
                  child: ButtonPrimary(
                    onPressed: search,
                    text: "search",
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Flexible(
              child: _ParticipantProfile(
                  participant: widget.controller.participant)),
          const Divider(),
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.participantScoreLabel,
            ),
            onChanged: widget.controller.updateScore,
            validator: validatorScore,
          ),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onConfirmPressed: () => widget.controller.onRegister(context),
            onCancelPressed: widget.controller.onCancel,
          )
        ],
      ),
    );
  }
}

class _ParticipantProfile extends StatelessWidget {
  final ParticipantEntity? participant;

  const _ParticipantProfile({this.participant});

  @override
  Widget build(BuildContext context) {
    const unkown = "unknown";

    final name = participant?.participantName.toString() ?? unkown;

    final birthDate = participant?.participantBirthDate.toString() ?? unkown;

    final specialty = participant?.specialtyName.value ?? unkown;

    final division = participant?.divisionName.value ?? unkown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('name : $name'),
        Text('birth : $birthDate'),
        Text('specialty : $division $specialty'),
      ],
    );
  }
}

class ScoreDialog extends StatelessWidget {
  const ScoreDialog({Key? key, this.entity}) : super(key: key);

  final ParticipantEntity? entity;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = ScoreController(entity);

    return AlertDialog(
      title: Text(localizations.addScoreLabel),
      content: CompetittionScoreForm(controller: controller),
    );
  }
}
