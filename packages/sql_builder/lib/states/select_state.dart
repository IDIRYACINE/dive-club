

import 'package:sql_builder/sql_builder_port.dart';

class SelectStateBuilder implements SqlQueryStatePort {
  @override
  String build(StateBuildOptions options) {
    String query = "SELECT ";

    query += options.selectColumns;
    query += " FROM ";
    query += options.fromTables;
    query += " WHERE";
    query += options.whereClause;

    return query;

  }
}