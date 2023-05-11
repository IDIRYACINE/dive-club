import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

class CompetitionTable extends StatelessWidget {
  const CompetitionTable({super.key, this.scores = const []});

  final List<CompetitionScoreEntity> scores;

  DataRow _buildRow(int index, ThemeData theme) {
    CompetitionScoreEntity score = scores[index];

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
        DataCell(Text(index.toString())),
        DataCell(Text(score.participantId.value.toString())),
        DataCell(Text(score.score.value.toString())),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedQueryBox(
      widthPercentage: AppMeasures.tableWidthPercentage,
      child: SingleChildScrollView(
        child: DataTable(
          decoration: BoxDecoration(
            border: Border.all(color: theme.primaryColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          columns: [
            DataColumn(label: Text(localizations.participantRankingLabel)),
            DataColumn(label: Text(localizations.participantNameLabel)),
            DataColumn(label: Text(localizations.participantScoreLabel)),
          ],
          rows: List<DataRow>.generate(
            scores.length,
            (index) => _buildRow(index, theme),
          ),
        ),
      ),
    );
  }
}
