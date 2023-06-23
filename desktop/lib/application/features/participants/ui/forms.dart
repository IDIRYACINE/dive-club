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
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/participants/export.dart';
import '../logic/participant_controller.dart';

class ParticipantForm extends StatelessWidget {
  ParticipantForm({
    super.key,
    required this.divisions,
    required this.specialties,
    required this.ageDivisions,
    required this.clubs,
    required this.genders,
  });

  final ParticipantController controller = ParticipantController();

  final List<DivingDivisionEntity> divisions;
  final List<DivingSpecialtyEntity> specialties;
  final List<AgeDivisionEntity> ageDivisions;
  final List<GenderEntity> genders;
  final List<ClubEntity> clubs;

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
            decoration: const InputDecoration(
              labelText: "firstName",
            ),
            validator: validatorEmptyText,
            onChanged: controller.updateFirstName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "lastName",
            ),
            validator: validatorEmptyText,
            onChanged: controller.updateLastName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "entry time",
            ),
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
          ),
          SpecialtyDropdown(
            items: specialties,
            onSelected: controller.updateSpecialty,
          ),
          GenderDropdown(
            items: genders,
            onSelected: controller.updateGender,
          ),
          ClubDropdown(
            items: clubs,
            onSelected: controller.updateClub,
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

class UpdateParticipantForm extends StatelessWidget {
  UpdateParticipantForm({
    super.key,
    required this.ageDivisions,
    required this.clubs,
    required this.genders,
    required this.participant,
  });

  final ParticipantEntity participant;
  final ParticipantController controller = ParticipantController();
  final List<AgeDivisionEntity> ageDivisions;
  final List<GenderEntity> genders;
  final List<ClubEntity> clubs;

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
            decoration: const InputDecoration(
              labelText: "firstName",
            ),
            initialValue: participant.participantName.firstName,
            validator: validatorEmptyText,
            onChanged: controller.updateFirstName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "lastName",
            ),
            initialValue: participant.participantName.lastName,
            validator: validatorEmptyText,
            onChanged: controller.updateLastName,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "entry time",
            ),
            initialValue: participant.entryTime.toString(),
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
          GenderDropdown(
            items: genders,
            onSelected: controller.updateGender,
          ),
          ClubDropdown(
            items: clubs,
            onSelected: controller.updateClub,
          ),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onCancelPressed: controller.onCancel,
            onConfirmPressed: () => controller.onUpdate(context,participant),
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

    return AlertDialog(
      title: Text(localizations.addParticipantLabel),
      content: ParticipantForm(
        divisions: divisions,
        specialties: specialties,
        ageDivisions: ageDivisions,
        genders: gendersList,
        clubs: clubs,
      ),
    );
  }
}
