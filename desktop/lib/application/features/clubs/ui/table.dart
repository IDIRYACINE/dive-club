import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../logic/options.dart';
import '../state/bloc.dart';

class ClubTable extends StatefulWidget {
  const ClubTable({super.key, this.clubs = const []});

  final List<ClubEntity> clubs;

  @override
  State<ClubTable> createState() => _ClubTableState();
}

class _ClubTableState extends State<ClubTable> {
  int _selectedRowIndex = -1;

  final _rowController = RowController();

  void updateSelectedRowIndex(int index) {
    setState(() {
      _selectedRowIndex = index;
    });
  }

  DataRow _buildRow(int index, ThemeData theme) {
    ClubEntity club = widget.clubs[index];

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

          if (_selectedRowIndex == index) {
          final bloc = BlocProvider.of<ClubBloc>(context);
          _rowController.displayActions(DisplayActionsOptions(
              bloc: bloc, context: context, entity: club));
        }
        
        if (selected != null && selected) {
          updateSelectedRowIndex(index);
        }

      },
      cells: [
        DataCell(Text(club.clubId.value.toString())),
        DataCell(Text(club.clubName.value)),
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
            DataColumn(label: Text(localizations.idLabel)),
            DataColumn(label: Text(localizations.nameLabel)),
          ],
          rows: List<DataRow>.generate(
            widget.clubs.length,
            (index) => _buildRow(index, theme),
          ),
        ),
      ),
    );
  }
}
