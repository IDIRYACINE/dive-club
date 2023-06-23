import 'package:dive_club/application/features/ageDivision/feature.dart';
import 'package:dive_club/application/features/competition/feature.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/gender/actions.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
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
  final GenderId? genderId;
  final AgeDivisionId? ageDivisionId;

  FilterOptions(
      {this.specialtyId,
      this.participantBloc,
      this.competitionBloc,
      this.divisionId,
      this.genderId,
      this.ageDivisionId,
      this.id})
      : assert(participantBloc != null || competitionBloc != null,
            'Either participantBloc or competitionBloc must be provided');
}

typedef OnFilter = void Function(FilterOptions options);

class FilterController {
  static final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final genderController = TextEditingController();

  final OnFilter onFilter;
  DivingSpecialtyEntity? specialty;
  DivingDivisionEntity? division;
  GenderEntity? gender;
  AgeDivisionEntity? ageDivision;


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
            id: nameController.text.isNotEmpty
                ? int.parse(nameController.text)
                : null,
            specialtyId: specialityId,
            divisionId: divisionId,
            participantBloc: BlocProvider.of<ParticipantBloc>(form.context),
            competitionBloc: BlocProvider.of<CompetitionBloc>(form.context),
            genderId: gender?.genderId,
            ageDivisionId: ageDivision?.divisionId),
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

  void updateGender(GenderEntity? item) {
    gender = item;
  }

  void updateAgeDivision(AgeDivisionEntity? item) {
    ageDivision = item;
  }
}

class FilterForm extends StatelessWidget {
  const FilterForm({
    super.key,
    required this.genders,
    required this.onConfirmPressed, required this.ageDivisions,
  });

  final List<GenderEntity> genders;
  final List<AgeDivisionEntity> ageDivisions;

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
         AgeDivisionDropdown(
            items: ageDivisions,
            onSelected: controller.updateAgeDivision ,
          ),
          const SizedBox(
            height: 20,
          ),
          GenderDropdown(
            items: genders,
            onSelected: controller.updateGender,
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
      content: FilterForm(
        onConfirmPressed: onConfirmPressed,
        genders: gendersList, ageDivisions: ageDivisions,
      ),
    );
  }
}
