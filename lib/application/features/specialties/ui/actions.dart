import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/domain/diving/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

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
      {super.key, required this.onSelected, required this.items});

  final OnSpecialtySelected onSelected;
  final List<DivingSpecialtyEntity> items;

  List<SpecialtyDropdownItem> _buildItems() {
    List<SpecialtyDropdownItem> result = [];

    for (DivingSpecialtyEntity element in items) {
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
    return DropdownButtonFormField<DivingSpecialtyEntity>(
      items: _buildItems(),
      value: items.first,
      onChanged: onSelected,
      validator: validatorDivingSpecialty,
    );
  }
}
