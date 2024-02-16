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
  void _onUpdateId(String? value) {
    int? id = int.tryParse(value ?? "");

    if (id != null) {
      widget.controller.searchParticipant(id).then((res) => {setState(() {})});
    }
  }
void _onSubmit() {
    widget.controller.onRegister(context);
  }
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SizedBox(
      width: 300,
      child: Form(
        key: ScoreController.key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             TextFormField(
                decoration: InputDecoration(
                  labelText: localizations.idLabel,
                ),
                onChanged: _onUpdateId,
                validator: validatorId,
              
            ),
            const SizedBox(
              width: 10,
            ),
             CompetitionScoreTextField(
                onUpdateScore: widget.controller.updateScore, onFieldSubmit: (_) => _onSubmit(),
              
            ),
            const Divider(),
            Flexible(
                child: _ParticipantProfile(
                    participant: widget.controller.participant)),
            const SizedBox(
              height: 30,
            ),
            GenericFormActions(
              onConfirmPressed: _onSubmit,
              onCancelPressed: widget.controller.onCancel,

            )
          ],
        ),
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

    final birthDate =
        participant?.ageDivision.divisionId.value.toString() ?? unkown;

    final specialty = participant?.specialty.specialtyName.value ?? unkown;

    final division = participant?.division.divisionName.value ?? unkown;

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

typedef OnUpdateScore = void Function(String? value);
typedef OnFieldSubmit = void Function(String value);
class CompetitionScoreTextField extends StatefulWidget {
  final OnUpdateScore onUpdateScore;
  final OnFieldSubmit onFieldSubmit;
  const CompetitionScoreTextField({super.key, required this.onUpdateScore, required this.onFieldSubmit});

  @override
  State<CompetitionScoreTextField> createState() =>
      _CompetitionScoreTextFieldState();
}

class _CompetitionScoreTextFieldState extends State<CompetitionScoreTextField> {
  final _textController = TextEditingController();

  void _onUpdate(String? display) {
    if (display != null) {
      display = display.replaceAll(r'\s', '');
      widget.onUpdateScore(display);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
  
    return TextFormField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: localizations.participantScoreLabel,
      ),
      onFieldSubmitted: widget.onFieldSubmit,
      onChanged: _onUpdate,
      validator: validatorScore,
      keyboardType: TextInputType.number,
    );
  }
}
