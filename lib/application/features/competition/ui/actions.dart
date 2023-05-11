import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../logic/form_controller.dart';

class CompetitionActions extends StatelessWidget {
  const CompetitionActions({Key? key, required this.controller})
      : super(key: key);

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          localizations.competitionLabel,
          style: theme.textTheme.headlineSmall,
        ),
        ButtonPrimary(
          onPressed: controller.printRakings,
          text: localizations.printRankingsLabel,
        ),
        ButtonPrimary(
          onPressed: controller.printPrizes,
          text: localizations.printPrizesLabel,
        ),
      ],
    );
  }
}