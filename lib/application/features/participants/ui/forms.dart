import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/core/domain/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/participant_controller.dart';

class ParticipantForm extends StatelessWidget {
  ParticipantForm(
      {super.key, required this.divisions, required this.specialties});

  final ParticipantController controller = ParticipantController();

  final List<DivingDivisionEntity> divisions;
  final List<DivingSpecialtyEntity> specialties;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: ParticipantController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
            validator: validatorEmptyText,
            onChanged: controller.updateName,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.birthDateLabel,
            ),
            controller: controller.birthDateTextController,
            readOnly: true,
            onTap: () => controller.selectBirthDate(context),
            validator: validatorEmptyText,
          ),
          DivisionDropdown(
            items: divisions,
            onSelected: controller.updateDivision,
          ),
          SpecialtyDropdown(
            items: specialties,
            onSelected: controller.updateSpecialty,
          ),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onCancelPressed: controller.onCancel,
            onConfirmPressed: () => controller.onRegister(context),
          )
        ],
      ),
    );
  }
}

class ParticipantDialog extends StatelessWidget {
  const ParticipantDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final divisions = BlocProvider.of<DivisionBloc>(context).state.divisions;
    final specialties =
        BlocProvider.of<SpecialtyBloc>(context).state.specialties;

    return AlertDialog(
      title: Text(localizations.addParticipantLabel),
      content: ParticipantForm(
        divisions: divisions,
        specialties: specialties,
      ),
    );
  }
}
