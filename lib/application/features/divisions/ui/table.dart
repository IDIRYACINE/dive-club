import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';

class DivisionsTable extends StatelessWidget {
  const DivisionsTable({super.key, this.divisions = const []});

  final List<DivingDivisionEntity> divisions;

  DataRow _buildRow(int index, ThemeData theme) {
    DivingDivisionEntity division = divisions[index];

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
        DataCell(Text(division.competitionId.value.toString())),
        DataCell(Text(division.competitionName.value)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return DataTable(
      columns: [
        DataColumn(label: Text(localizations.idLabel)),
        DataColumn(label: Text(localizations.nameLabel)),
      ],
      rows: List<DataRow>.generate(
        divisions.length,
        (index) => _buildRow(index, theme),
      ),
    );
  }
}
