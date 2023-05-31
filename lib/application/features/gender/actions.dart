import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:flutter/material.dart';

typedef GenderDropdownItem = DropdownMenuItem<GenderEntity>;
typedef OnDivisionSelected = void Function(GenderEntity? item);

class GenderDropdown extends StatelessWidget {
  const GenderDropdown(
      {super.key, required this.onSelected, required this.items});

  final OnDivisionSelected onSelected;
  final List<GenderEntity> items;

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
    return DropdownButtonFormField<GenderEntity>(
      items: _buildItems(),
      onChanged: onSelected,
      value: items.isNotEmpty ? items.first : null,
      hint: const Text("Gender"),
      validator: validatorGender,
    );
  }
}
