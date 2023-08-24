
  import 'package:sql_builder/sql_builder_port.dart';

String buildWhere(List<ColumnField> whereFileds) {
    String result = "";

    if (whereFileds.isEmpty) return result;

    for (var i = 0; i < whereFileds.length; i++) {
      final field = whereFileds[i];
      final column = field.column;

      result += field.prefixOperator.value;

      if (column.prefix != null) {
        result += '${column.prefix}.';
      }

      result += "${column.name}${field.op.value}${field.value}";
    }

    return result;
  }

  String buildFrom(List<Table> tables) {
    String result = "";

    for (var i = 0; i < tables.length; i++) {
      final table = tables[i];

      result += table.name;

      if (table.alias != null) {
        result += ' as ${table.alias}';
      }

      if (i < tables.length - 1) {
        result += ',';
      }
    }

    return result;
  }

  String buildSelect(List<Column> columns) {
    String result = "";

    if (columns.isEmpty) return '*';

    for (var i = 0; i < columns.length; i++) {
      final column = columns[i];

      if (column.prefix != null) {
        result += '${column.prefix}.';
      }

      result += column.name;

      if (column.alias != null) {
        result += ' as ${column.alias}';
      }

      if (i < columns.length - 1) {
        result += ',';
      }
    }

    return result;
  }