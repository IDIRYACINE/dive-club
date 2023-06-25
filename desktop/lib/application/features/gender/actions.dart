import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:flutter/material.dart';

typedef GenderDropdownItem = DropdownMenuItem<GenderEntity>;
typedef OnDivisionSelected = void Function(GenderEntity? item);

class GenderDropdown extends StatelessWidget {
  const GenderDropdown(
      {super.key,
      required this.onSelected,
      required this.items,
      this.initialValue});

  final OnDivisionSelected onSelected;
  final List<GenderEntity> items;
  final GenderId? initialValue;

  List<GenderDropdownItem> _buildItems() {
    List<GenderDropdownItem> result = [];

    for (GenderEntity element in items) {
      GenderDropdownItem item = GenderDropdownItem(
        value: element,
        child: Text(element.genderName.value),
      );

      result.add(item);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    GenderEntity? firstSelection;
    if (initialValue != null) {
      firstSelection =
          items.firstWhere((element) => element.genderId.equals(initialValue!) );
    } else if (items.isNotEmpty) {
      firstSelection = items.first;
    }

    return DropdownButtonFormField<GenderEntity>(
      items: _buildItems(),
      onChanged: onSelected,
      value: firstSelection,
      hint: const Text("Gender"),
      validator: validatorGender,
    );
  }
}
