import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/specialties/state/bloc.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';

class SpecialtiesActions extends StatelessWidget {
  const SpecialtiesActions({Key? key, required this.controller})
      : super(key: key);

  final SpecialtyController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          localizations.specialityListLabel,
          style: theme.textTheme.headlineSmall,
        ),
        ButtonPrimary(
          onPressed: controller.addSpecialty,
          text: localizations.addSpecialityLabel,
        ),
      ],
    );
  }
}

typedef SpecialtyDropdownItem = DropdownMenuItem<DivingSpecialtyEntity>;
typedef OnSpecialtySelected = void Function(DivingSpecialtyEntity? item);

class SpecialtyDropdown extends StatelessWidget {
  const SpecialtyDropdown(
      {super.key,
      required this.onSelected,
       this.items,
      this.initialValue});

  final OnSpecialtySelected onSelected;
  final List<DivingSpecialtyEntity>? items;
  final DivingSpecialtyEntity? initialValue;

  List<SpecialtyDropdownItem> _buildItems( List<DivingSpecialtyEntity> wItems) {
    List<SpecialtyDropdownItem> result = [];

    for (DivingSpecialtyEntity element in wItems) {
      SpecialtyDropdownItem item = SpecialtyDropdownItem(
        value: element,
        child: Text(element.specialtyName.value),
      );

      result.add(item);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final wItems = items ?? BlocProvider.of<SpecialtyBloc>(context).state.specialties;

    DivingSpecialtyEntity? firstSelection;
    
    if (initialValue != null) {
      firstSelection =
          wItems.firstWhere((element) => element.equals(initialValue!));
    } else if (wItems.isNotEmpty) {
      firstSelection = wItems.first;
    }

    return DropdownButtonFormField<DivingSpecialtyEntity>(
      items: _buildItems(wItems),
      value: firstSelection,
      onChanged: onSelected,
      hint: const Text("Specialty"),
      validator: validatorDivingSpecialty,
    );
  }
}
