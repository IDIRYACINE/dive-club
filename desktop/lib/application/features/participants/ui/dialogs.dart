import 'package:dive_club/application/commons/dialogs/common.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/participants/export.dart';
import 'forms.dart';

class ParticipantActionsDialog extends StatelessWidget {
  const ParticipantActionsDialog({Key? key, required this.entity})
      : super(key: key);

  final ParticipantEntity entity;

  void onDelete() {
    final dialog = ConfirmationDialog(
      title: "Delete participant",
      content: "Are you sure you want to delete this participant?",
      onConfirm: () => {},
    );

    NavigationService.replaceDialog(dialog);
  }

  void onEdit() {
    final dialog = ParticipantDialog(participant: entity);
    NavigationService.replaceDialog(dialog);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(localizations.participantActionsLabel),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: onEdit,
            child: Text(localizations.editParticipantLabel),
          ),
          TextButton(
            onPressed: onDelete,
            child: Text(localizations.deleteParticipantLabel),
          ),
        ],
      ),
    );
  }
}
