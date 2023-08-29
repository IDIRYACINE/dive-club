library sql_builder;

import 'package:sql_builder/sql_builder_port.dart';

import 'helpers/builders.dart';
import 'states/delete_state.dart';
import 'states/insert_state.dart';
import 'states/select_state.dart';
import 'states/update_state.dart';

class SqlBuilder implements SqlBuilderPort {
  final List<Table> _tables = [];
  final List<Column> _columns = [];
  final List<ColumnField> _columnFields = [];
  final List<ColumnField> _whereFileds = [];
  final List<Join> _joins = [];
  
  Limit? _limit  ;
  OrderBy? _orderBy  ;
  GroupBy? _groupBy  ;

  late SqlQueryStatePort _stateBuilder;

  @override
  void delete() {
    _stateBuilder = DeleteStateBuilder();
  }

  @override
  void select(List<Column> columns) {
    _stateBuilder = SelectStateBuilder();
    _columns.addAll(columns);
  }

  @override
  void update(List<ColumnField> columns) {
    _stateBuilder = UpdateStateBuilder();
    _columnFields.addAll(columns);
  }

  @override
  void insert(List<ColumnField> columns) {
    _stateBuilder = InsertStateBuilder();
    _columnFields.addAll(columns);
  }

  @override
  void from(List<Table> tables) {
    _tables.addAll(tables);
  }

  @override
  void groupBy(GroupBy group) {
    _groupBy = group;
  }

  @override
  void join(List<Join> joinParams) {
    _joins.addAll(joinParams);
  }

  @override
  void limit(Limit lim) {
    _limit = lim;
  }

  @override
  void orderBy(OrderBy order) {
    _orderBy = order;
  }

  @override
  void where(List<ColumnField> whereFields) {
    _whereFileds.addAll(whereFields);
  }

  @override
  String build() {
    final options = StateBuildOptions(
      selectColumns: buildSelect(_columns),
      fromTables: buildFrom(_tables),
      whereClause: buildWhere(_whereFileds),
      limitClause: buildLimit(_limit),
      groupByClause: buildGroupBy(_groupBy),
      orderByClause: buildOrderBy(_orderBy),
      joinClause: buildJoin(_joins),
    );

    return _stateBuilder.build(options);
  }
}
