import 'package:dive_club/application/commons/dialogs/common.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/participants/logic/participant_controller.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forms.dart';

class ParticipantActionsDialog extends StatelessWidget {
  const ParticipantActionsDialog({Key? key, required this.entity})
      : super(key: key);

  final ParticipantEntity entity;

  void onDelete(BuildContext context) {
    final bloc = BlocProvider.of<ParticipantBloc>(context);
    
    final dialog = ConfirmationDialog(
      title: "Delete participant",
      content: "Are you sure you want to delete this participant?",
      onConfirm: () => deleteParticipant(entity,bloc),
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
            onPressed: () => onDelete(context),
            child: Text(localizations.deleteParticipantLabel),
          ),
        ],
      ),
    );
  }
}
