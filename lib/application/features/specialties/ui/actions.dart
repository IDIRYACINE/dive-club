

import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SpecialtiesActions extends StatelessWidget{
  const SpecialtiesActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(localizations.specialityLabel),
        ButtonPrimary(
          onPressed: () {},
          text: localizations.addSpecialityLabel,
        ),
      ],
    );
  }
}

