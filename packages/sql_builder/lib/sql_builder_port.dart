abstract class SqlBuilderPort {
  void from(List<Table> tables);
  void select(List<Column> columns);
  void insert(List<ColumnField> columns);
  void update(List<ColumnField> columns);
  void delete();
  void where(List<ColumnField> columns);
  void orderBy(OrderBy order);
  void groupBy(GroupBy group);
  void join(List<Join> joinParams);
  void limit(Limit lim);

  String build();
}

abstract class SqlQueryStatePort {
  String build(StateBuildOptions options);
}

class StateBuildOptions {
  final String selectColumns;
  final String fromTables;
  final String whereClause;
  final String limitClause;
  final String groupByClause;
  final String orderByClause;
  final String joinClause;

  StateBuildOptions({
    this.selectColumns = "",
    this.fromTables = "",
    this.whereClause = "",
    this.limitClause = "",
    this.groupByClause = "",
    this.orderByClause = "",
    this.joinClause = "",
  });
}

class Table {
  final String name;
  final String? alias;

  Table(this.name, {this.alias});
}

class JoinParam {
  final Table table;
  final Column column;

  JoinParam(
    this.table,
    this.column,
  );

  String getStatement() {
    String result = "";

    result += table.alias ?? table.name;
    result += '.';
    result += column.name;

    return result;
  }
}

class Join {
  final JoinParam source;
  final JoinParam target;
  final JoinType joinType;

  Join(this.source, this.target, {this.joinType = JoinType.inner});
}

class Column {
  final String name;
  final String? alias;
  final String? prefix;

  Column(this.name, {this.alias, this.prefix});
}

class GroupBy {
  final List<Column> columns;

  GroupBy({required this.columns});
}

class OrderBy {
  final List<Column> columns;
  final bool asc;

  OrderBy({required this.columns, this.asc = true});
}

class Limit {
  final int limit;
  final int offset;

  Limit({required this.limit, this.offset = 0});
}

enum JoinType { inner, left, right }

extension JoinTypeExtension on JoinType {
  String get value {
    switch (this) {
      case JoinType.inner:
        return " INNER JOIN ";
      case JoinType.left:
        return " LEFT JOIN ";
      case JoinType.right:
        return " RIGHT JOIN ";
      default:
        return " ";
    }
  }
}

enum SqlOperator { eq, ne, gt, lt, and, or, empty }

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

  ColumnField(this.column, this.value,
      {this.op = SqlOperator.eq, this.prefixOperator = SqlOperator.empty});
}
