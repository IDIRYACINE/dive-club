import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/divisions/state/bloc.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/division_controller.dart';

class DivisionsActions extends StatelessWidget {
  const DivisionsActions({Key? key, required this.formController})
      : super(key: key);

  final DivisionController formController;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(localizations.divisionListLabel,
            style: theme.textTheme.headlineSmall),
        ButtonPrimary(
          onPressed: formController.addDivision,
          text: localizations.addDivisionLabel,
        ),
      ],
    );
  }
}

typedef DivisionDropdownItem = DropdownMenuItem<DivingDivisionEntity>;
typedef OnDivisionSelected = void Function(DivingDivisionEntity? item);

class DivisionDropdown extends StatelessWidget {
  const DivisionDropdown(
      {super.key, required this.onSelected,  this.items, this.initialValue});

  final OnDivisionSelected onSelected;
  final List<DivingDivisionEntity>? items;
  final DivingDivisionEntity? initialValue;

  List<DivisionDropdownItem> _buildItems(List<DivingDivisionEntity> wItems) {
    List<DivisionDropdownItem> result = [];

    for (DivingDivisionEntity element in wItems) {
      DivisionDropdownItem item = DivisionDropdownItem(
        value: element,
        child: Text(element.divisionName.value),
      );

      result.add(item);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    final wItems = items ?? BlocProvider.of<DivisionBloc>(context).state.divisions;

     DivingDivisionEntity? firstSelection;
    
    if (initialValue != null) {
      firstSelection =
          wItems.firstWhere((element) => element.equals(initialValue!));
    } else if (wItems.isNotEmpty) {
      firstSelection = wItems.first;
    }

    return DropdownButtonFormField<DivingDivisionEntity>(
        items: _buildItems(wItems),
         onChanged: onSelected,
        value:  firstSelection,
              hint: const Text("Division"),

        validator: validatorDivingDivision,
        );
  }
}
