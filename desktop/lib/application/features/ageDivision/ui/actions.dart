import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class AgeDivisionActions extends StatelessWidget {
  const AgeDivisionActions({Key? key, required this.controller})
      : super(key: key);

  final AgeDivisionController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          localizations.ageDivisionList,
          style: theme.textTheme.headlineSmall,
        ),
        ButtonPrimary(
          onPressed: controller.addAgeDivision,
          text: localizations.addAgeDivisionLabel,
        ),
      ],
    );
  }
}

typedef AgeDivisionDropdownItem = DropdownMenuItem<AgeDivisionEntity>;
typedef OnAgeDivisionSelected = void Function(AgeDivisionEntity? item);

class AgeDivisionDropdown extends StatelessWidget {
  const AgeDivisionDropdown(
      {super.key, required this.onSelected, required this.items});

  final OnAgeDivisionSelected onSelected;
  final List<AgeDivisionEntity> items;

  List<AgeDivisionDropdownItem> _buildItems() {
    List<AgeDivisionDropdownItem> result = [];

    for (AgeDivisionEntity element in items) {
      AgeDivisionDropdownItem item = AgeDivisionDropdownItem(
        value: element,
        child: Text(element.divisionName.value),
      );

      result.add(item);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AgeDivisionEntity>(
      items: _buildItems(),
       value: items.isNotEmpty ? items.first : null,
      hint: const Text("Age Division"),
      onChanged: onSelected,
      validator: validatorAgeDivision,
    );
  }
}
