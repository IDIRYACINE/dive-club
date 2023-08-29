
  import 'package:sql_builder/sql_builder_port.dart';

String buildWhere(List<ColumnField> whereFileds) {
    String result = "WHERE ";

    if (whereFileds.isEmpty) return "";

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

  String buildLimit(Limit? limit) {
    if (limit == null) return "";

    String result = "";
    if (limit.limit > 0) {
      result += "LIMIT ${limit.limit}";
    }


    return result;
  }

  String buildOrderBy(OrderBy? orderBy) {
    if (orderBy == null) return "";

    String result = "";
    if (orderBy.column.name.isNotEmpty) {
      result += "ORDER BY ${orderBy.column.name}";
    }

    if (!orderBy.asc) {
      result += " DESC";
    }

    return result;
  }

  String buildGroupBy(GroupBy? groupBy) {
    if (groupBy == null) return "";

    String result = "";
    if (groupBy.columns.isNotEmpty) {
      result += "GROUP BY ";

      for (var i = 0; i < groupBy.columns.length; i++) {
        final column = groupBy.columns[i];

        if (column.prefix != null) {
          result += '${column.prefix}.';
        }

        result += column.name;

        if (i < groupBy.columns.length - 1) {
          result += ',';
        }
      }
    }

    return result;
  }

String buildJoin(List<Join> join){
  String result = "";

  if (join.isEmpty) return result;

  for (var i = 0; i < join.length; i++) {
    final joinParams = join[i];
    
    result += "${joinParams.joinType.value} ${joinParams.source.table.name} ON ${joinParams.target.getStatement()}";

    if (i < join.length - 1) {
      result += ' ';
    }
  }


  return result;
}  