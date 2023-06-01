import 'package:dive_club/application/features/competition/feature.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buttons.dart';
import 'package:dive_club/application/navigation/navigation_service.dart';

class FilterOptions {
  final SpecialtyId? specialtyId;
  final DivisionId? divisionId;
  final int? id;
  final ParticipantBloc? participantBloc;
  final CompetitionBloc? competitionBloc;

  FilterOptions(
      {this.specialtyId,
      this.participantBloc,
      this.competitionBloc,
      this.divisionId,
      this.id})
      : assert(participantBloc != null || competitionBloc != null,
            'Either participantBloc or competitionBloc must be provided');
}

typedef OnFilter = void Function(FilterOptions options);

class FilterController {
  static final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final OnFilter onFilter;
  DivingSpecialtyEntity? specialty;
  DivingDivisionEntity? division;

  FilterController(this.onFilter);

  void validateForm() {
    final form = formKey.currentState;
    if (form!.validate()) {

      DivisionId? divisionId = division?.divisionId;
      if ((divisionId != null) && (divisionId.value == -1)) {
        divisionId = null;
      }

      SpecialtyId? specialityId = specialty?.specialtyId;
      if ((specialityId != null) && (specialityId.value == -1)) {
        specialityId = null;
      }

      onFilter(
        FilterOptions(
          id: nameController.text.isNotEmpty ? int.parse(nameController.text) : null,
          specialtyId: specialityId,
          divisionId: divisionId,
          participantBloc: BlocProvider.of<ParticipantBloc>(form.context),
          competitionBloc: BlocProvider.of<CompetitionBloc>(form.context),
        ),
      );

      NavigationService.pop();
    }
  }

  void onCancel() {
    NavigationService.pop();
  }

  void selectSpecialty(DivingSpecialtyEntity? item) {
    specialty = item;
  }

  void selectDivision(DivingDivisionEntity? item) {
    division = item;
  }
}

class FilterForm extends StatelessWidget {
  const FilterForm({
    super.key,
    required this.onConfirmPressed,
  });

  final OnFilter onConfirmPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = FilterController(onConfirmPressed);

    final divisions = [
      DivingDivisionEntity(
          divisionId: DivisionId(-1), divisionName: DivisionName('All')),
      ...BlocProvider.of<DivisionBloc>(context).state.divisions,
    ];

    final specialties = [
      DivingSpecialtyEntity(
          specialtyId: SpecialtyId(-1), specialtyName: SpecialtyName('All')),
      ...BlocProvider.of<SpecialtyBloc>(context).state.specialties,
    ];

    

    return Form(
      key: FilterController.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
            ),
            controller: controller.nameController,
          ),
          const SizedBox(
            height: 20,
          ),
          DivisionDropdown(
              onSelected: controller.selectDivision, items: divisions),
          const SizedBox(
            height: 20,
          ),
          SpecialtyDropdown(
              onSelected: controller.selectSpecialty, items: specialties),
          const SizedBox(
            height: 20,
          ),
          GenericFormActions(
            onConfirmPressed: controller.validateForm,
            onCancelPressed: controller.onCancel,
          )
        ],
      ),
    );
  }
}

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key, required this.onConfirmPressed})
      : super(key: key);

  final OnFilter onConfirmPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.filterLabel),
      content: FilterForm(onConfirmPressed: onConfirmPressed),
    );
  }
}
