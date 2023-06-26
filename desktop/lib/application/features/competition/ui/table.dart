import 'package:dive_club/application/commons/dialogs/common.dart';
import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/application/features/competition/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';

class CompetitionTable extends StatelessWidget {
  const CompetitionTable({super.key, this.scores = const []});

  final List<CompetitionScoreEntity> scores;

  DataRow _buildRow(int index, ThemeData theme, BuildContext context) {
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
          DataCell(Text((index + 1).toString())),
          DataCell(Text(score.participantName.toString())),
          DataCell(Text(score.score.toString())),
        ],
        onSelectChanged: (isSelected) {
          final bloc = BlocProvider.of<CompetitionBloc>(context);

          final dialog = ConfirmationDialog(
              title: "Score",
              content: "Are you sure you want to delete this score?",
              onConfirm: () => deleteScore(bloc, score));
          NavigationService.displayDialog(dialog);
        });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedQueryBox(
      widthPercentage: AppMeasures.tableWidthPercentage,
      child: SingleChildScrollView(
        child: DataTable(
          showCheckboxColumn: false,
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
            (index) => _buildRow(index, theme, context),
          ),
        ),
      ),
    );
  }
}
