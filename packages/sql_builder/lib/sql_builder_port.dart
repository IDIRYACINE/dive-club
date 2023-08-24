abstract class SqlBuilderPort {
  void from(List<Table> tables);
  void select(List<Column> columns);
  void insert(List<ColumnField> columns);
  void update(List<ColumnField> columns);
  void delete();
  void where(List<ColumnField> columns);
  void orderBy();
  void groupBy();
  void join();
  void limit();

  String build();
}

abstract class SqlQueryStatePort {
  String build(StateBuildOptions options);
}

class StateBuildOptions {
  final String selectColumns;
  final String fromTables;
  final String whereClause;

  StateBuildOptions({
    this.selectColumns = "",
    this.fromTables = "",
    this.whereClause = "",
  });
}

class Table {
  final String name;
  final String? alias;

  Table(this.name, {this.alias});
}

class Column {
  final String name;
  final String? alias;
  final String? prefix;

  Column(this.name, {this.alias, this.prefix});
}

class OrderBy {
  final Column column;
  final bool asc;

  OrderBy({required this.column, this.asc = true});
}

class Limit {
  final int limit;
  final int offset;

  Limit({required this.limit, this.offset = 0});
}

enum SqlOperator { eq, ne, gt, lt, and, or,empty }

extension SqlOperatorExtension on SqlOperator {
  String get value {
    switch (this) {
      case SqlOperator.eq:
        return " = ";
      case SqlOperator.ne:
        return " != ";
      case SqlOperator.gt:
        return " > ";
      case SqlOperator.lt:
        return " < ";

      case SqlOperator.and:
        return " AND ";

      case SqlOperator.or:
        return " OR ";
      default:
        return " ";
    }
  }
}

class ColumnField {
  final Column column;
  final dynamic value;
  final SqlOperator op;
  final SqlOperator prefixOperator;

  ColumnField(this.column, this.value, {this.op = SqlOperator.eq,this.prefixOperator= SqlOperator.empty});
}
