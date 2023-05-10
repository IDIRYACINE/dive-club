import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ParticipantsTable extends StatelessWidget {
  const ParticipantsTable({super.key, this.participants = const []});

  final List<ParticipantEntity> participants;

  DataRow _buildRow(int index,ThemeData theme) {
    ParticipantEntity participant = participants[index];

    return DataRow(
      color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return theme.colorScheme.primary.withOpacity(0.08);
        }
        if (index.isEven) {
          return Colors.grey.withOpacity(0.3);
        }
        return null; 
      }),
      cells: [
        DataCell(Text(participant.participantName.value)),
        DataCell(Text(participant.participantBirthDate.value.toString())),
        DataCell(Text(participant.divisionId.value.toString())),
        DataCell(Text(participant.specialtyId.value.toString())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return DataTable(
      decoration: BoxDecoration(
    border: Border.all(color: theme.primaryColor, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(5)),
  ),
      columns: [
        DataColumn(label: Text(localizations.nameLabel)),
        DataColumn(label: Text(localizations.birthdateLabel)),
        DataColumn(label: Text(localizations.competitionLabel)),
        DataColumn(label: Text(localizations.specialityLabel)),
      ],
      rows: List<DataRow>.generate(
        participants.length,
        (index) => _buildRow(index,theme),
      ),
    );
  }
}
