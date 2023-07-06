import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:flutter/material.dart';

typedef GenderDropdownItem = DropdownMenuItem<GenderEntity>;
typedef OnDivisionSelected = void Function(GenderEntity? item);

class GenderDropdown extends StatelessWidget {
  const GenderDropdown(
      {super.key,
      required this.onSelected,
       this.items,
      this.initialValue});

  final OnDivisionSelected onSelected;
  final List<GenderEntity>? items;
  final GenderId? initialValue;

  List<GenderDropdownItem> _buildItems(List<GenderEntity> wItems) {
    List<GenderDropdownItem> result = [];

    for (GenderEntity element in wItems) {
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
    final wItems = items?? gendersList;
    GenderEntity? firstSelection;

    if (initialValue != null) {
      firstSelection =
          wItems.firstWhere((element) => element.genderId.equals(initialValue!) );
    } else if (wItems.isNotEmpty) {
      firstSelection = wItems.first;
    }

    return DropdownButtonFormField<GenderEntity>(
      items: _buildItems(wItems),
      onChanged: onSelected,
      value: firstSelection,
      hint: const Text("Gender"),
      validator: validatorGender,
    );
  }
}
