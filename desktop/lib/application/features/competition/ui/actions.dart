import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/competition/state/bloc.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';

class CompetitionActions extends StatelessWidget {
  const CompetitionActions({Key? key, required this.controller})
      : super(key: key);

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final bloc = BlocProvider.of<CompetitionBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          localizations.competitionLabel,
          style: theme.textTheme.headlineSmall,
        ),
        Row(
          children: [
            ButtonPrimary(
              onPressed: () => controller.printRakings(bloc, ),
              text: localizations.printRankingsLabel,
            ),
            const SizedBox(width: 10),
            ButtonPrimary(
              onPressed: () => controller.printPrizes(bloc, ),
              text: localizations.printPrizesLabel,
            ),
            const SizedBox(width: 10),
            ButtonPrimary(
              onPressed: () => controller.addScore( ),
              text: localizations.addScoreLabel,
            ),
            const SizedBox(width: 10),
             ButtonPrimary(
              onPressed: controller.filterScores,
              text: localizations.filterLabel,
            ),
          ],
        ),
      ],
    );
  }
}
