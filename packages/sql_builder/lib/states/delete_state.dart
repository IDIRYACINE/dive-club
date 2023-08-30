import 'package:sql_builder/sql_builder_port.dart';

class DeleteStateBuilder implements SqlQueryStatePort {
  @override
  String build(StateBuildOptions options) {
    String query = '';

    query += 'DELETE ${options.fromTables}';
    query += ' ${options.whereClause}';


    return query.toString();
  }
}
