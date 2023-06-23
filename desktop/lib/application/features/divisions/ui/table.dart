import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/application/features/divisions/state/bloc.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/division_controller.dart';
import '../logic/options.dart';

class DivisionsTable extends StatefulWidget {
  const DivisionsTable({super.key, this.divisions = const []});

  final List<DivingDivisionEntity> divisions;

  @override
  State<DivisionsTable> createState() => _DivisionsTableState();
}

class _DivisionsTableState extends State<DivisionsTable> {
  int _selectedRowIndex = -1;
  final _rowController = RowController();

  void updateSelectedRowIndex(int index) {
    setState(() {
      _selectedRowIndex = index;
    });
  }

  DataRow _buildRow(int index, ThemeData theme) {
    DivingDivisionEntity division = widget.divisions[index];

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

        if (_selectedRowIndex == index) {
          final bloc = BlocProvider.of<DivisionBloc>(context);
          _rowController.displayActions(DisplayActionsOptions(
              bloc: bloc, context: context, entity: division));
        }
      },
      cells: [
        DataCell(Text(division.divisionId.value.toString())),
        DataCell(Text(division.divisionName.value)),
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
            widget.divisions.length,
            (index) => _buildRow(index, theme),
          ),
        ),
      ),
    );
  }
}
