import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/core/entities/clubs/entity.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class ClubActions extends StatelessWidget {
  const ClubActions({Key? key, required this.controller}) : super(key: key);

  final ClubController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          localizations.clubList,
          style: theme.textTheme.headlineSmall,
        ),
        ButtonPrimary(
          onPressed: controller.addClub,
          text: localizations.addClubLabel,
        ),
      ],
    );
  }
}

typedef ClubDropdownItem = DropdownMenuItem<ClubEntity>;
typedef OnSpecialtySelected = void Function(ClubEntity? item);

class ClubDropdown extends StatelessWidget {
  const ClubDropdown(
      {super.key, required this.onSelected, required this.items});

  final OnSpecialtySelected onSelected;
  final List<ClubEntity> items;

  List<ClubDropdownItem> _buildItems() {
    List<ClubDropdownItem> result = [];

    for (ClubEntity element in items) {
      ClubDropdownItem item = ClubDropdownItem(
        value: element,
        child: Text(element.clubName.value),
      );

      result.add(item);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ClubEntity>(
      items: _buildItems(),
      value: items.isNotEmpty ? items.first : null,
      hint: const Text("Club"),
      onChanged: onSelected,
      validator: validatorClub,
    );
  }
}
