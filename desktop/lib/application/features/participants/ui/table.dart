import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/application/features/participants/state/bloc.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/options.dart';
import '../logic/participant_controller.dart';

class ParticipantsTable extends StatefulWidget {
  const ParticipantsTable({super.key, this.participants = const []});

  final List<ParticipantEntity> participants;
  @override
  State<ParticipantsTable> createState() => _ParticipantsTableState();
}

class _ParticipantsTableState extends State<ParticipantsTable> {
  int _selectedRowIndex = -1;

  final _rowController = RowController();

  void updateSelectedRowIndex(int index) {
    setState(() {
      _selectedRowIndex = index;
    });
  }

  DataRow _buildRow(int index, ThemeData theme) {
    ParticipantEntity participant = widget.participants[index];

    return DataRow(
      selected: index == _selectedRowIndex,
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
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          updateSelectedRowIndex(index);
        }
        final bloc = BlocProvider.of<ParticipantBloc>(context);
        _rowController.displayActionsDialog(DisplayActionsOptions(
            bloc: bloc, context: context, entity: participant));
      },
      cells: [
        DataCell(Text(participant.participantName.toString())),
        DataCell(Text(participant.ageDivision.divisionId.value.toString())),
        DataCell(Text(participant.division.divisionName.value)),
        DataCell(Text(participant.specialty.specialtyName.value)),
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
          showCheckboxColumn: false,
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
            widget.participants.length,
            (index) => _buildRow(index, theme),
          ),
        ),
      ),
    );
  }
}
