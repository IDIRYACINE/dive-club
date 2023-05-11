import 'package:dive_club/application/commons/widgets_custom/sized_query_box.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

class SpecialtiesTable extends StatelessWidget {
  const SpecialtiesTable({super.key, this.specialties = const []});

  final List<DivingSpecialtyEntity> specialties;

  DataRow _buildRow(int index, ThemeData theme) {
    DivingSpecialtyEntity specialty = specialties[index];

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
        DataCell(Text(specialty.specialtyId.value.toString())),
        DataCell(Text(specialty.specialtyName.value)),
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
            DataColumn(label: Text(localizations.idLabel)),
            DataColumn(label: Text(localizations.nameLabel)),
          ],
          rows: List<DataRow>.generate(
            specialties.length,
            (index) => _buildRow(index, theme),
          ),
        ),
      ),
    );
  }
}
