import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../logic/participant_controller.dart';

class ParticipantsActions extends StatelessWidget {
  const ParticipantsActions({Key? key, required this.controler})
      : super(key: key);
  final ParticipantController controler;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(localizations.participantListLabel,
            style: theme.textTheme.headlineSmall),
        Row(
          children: [
          
            ButtonPrimary(
              onPressed: controler.addParticipant,
              text: localizations.addParticipantLabel,
            ),
             const SizedBox(width: 10),
                ButtonPrimary(
              onPressed: controler.filterParticipants,
              text: localizations.filterLabel,
            ),
          ],
        ),
      ],
    );
  }
}
