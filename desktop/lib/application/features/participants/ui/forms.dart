import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/ageDivision/feature.dart';
import 'package:dive_club/application/features/clubs/feature.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/gender/actions.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/participant_controller.dart';

class ParticipantForm extends StatelessWidget {
  ParticipantForm({
    super.key,
    required this.divisions,
    required this.specialties,
    required this.ageDivisions,
    required this.clubs,
    required this.genders,
    this.participant,
  });

  final ParticipantController controller = ParticipantController();

  final List<DivingDivisionEntity> divisions;
  final List<DivingSpecialtyEntity> specialties;
  final List<AgeDivisionEntity> ageDivisions;
  final List<GenderEntity> genders;
  final List<ClubEntity> clubs;
  final ParticipantEntity? participant;

  void onConfirm(bool isUpdateMode, ParticipantController controller,BuildContext context){
    if (isUpdateMode) {
      controller.onUpdate(context,participant!);
    } else {
      controller.onRegister(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final isUpdateMode = participant != null;

    if(isUpdateMode){
      controller.setupUpdateMode(participant!);
    }

    return Form(
      key: ParticipantController.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "firstName",
            ),
            initialValue: participant?.participantName.firstName,
            validator: validatorEmptyText,
            onChanged: controller.updateFirstName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "lastName",
            ),
            initialValue: participant?.participantName.lastName,
            validator: validatorEmptyText,
            onChanged: controller.updateLastName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "entry time",
            ),
            initialValue: participant?.entryTime.toString(),
            onChanged: controller.updateEntryTime,
            validator: validatorScore,
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
            initialValue: participant?.division,
          ),
          SpecialtyDropdown(
            items: specialties,
            onSelected: controller.updateSpecialty,
            initialValue: participant?.specialty,
          ),
          GenderDropdown(
            items: genders,
            onSelected: controller.updateGender,
            initialValue : participant?.genderId

          ),
          ClubDropdown(
            items: clubs,
            onSelected: controller.updateClub,
            initialValue: participant?.club,
          ),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onCancelPressed: controller.onCancel,
            onConfirmPressed: () => onConfirm(isUpdateMode,controller,context),
          )
        ],
      ),
    );
  }
}


class ParticipantDialog extends StatelessWidget {
  const ParticipantDialog({Key? key, this.participant}) : super(key: key);

  final ParticipantEntity? participant;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final divisions = BlocProvider.of<DivisionBloc>(context).state.divisions;
    final specialties =
        BlocProvider.of<SpecialtyBloc>(context).state.specialties;
    final ageDivisions =
        BlocProvider.of<AgeDivisionBloc>(context).state.ageDivisions;
    final clubs = BlocProvider.of<ClubBloc>(context).state.clubs;

    final title = participant == null ? localizations.addParticipantLabel : localizations.editParticipantLabel;
    return AlertDialog(
      title: Text(title),
      content: ParticipantForm(
        participant: participant,
        divisions: divisions,
        specialties: specialties,
        ageDivisions: ageDivisions,
        genders: gendersList,
        clubs: clubs,
      ),
    );
  }
}
