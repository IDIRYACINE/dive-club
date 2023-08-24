import 'package:flutter_test/flutter_test.dart';
import 'package:sql_builder/sql_builder.dart';
import 'package:sql_builder/sql_builder_port.dart';

void main() {
  test('simple select', () {
    final sqlBuilder = SqlBuilder();

    final query = sqlBuilder
      ..select([
        Column('id'),
        Column('name'),
        Column('age'),
      ])
      ..from([
        Table('users'),
      ]);

    expect(query.build(), 'SELECT id,name,age FROM users');
  });

  test('simple select with where', () {
    final sqlBuilder = SqlBuilder();

    final query = sqlBuilder
      ..select([
        Column('id'),
        Column('name'),
        Column('age'),
      ])
      ..from([
        Table('users'),
      ])
      ..where([
        ColumnField(Column("id"), 1),
        ColumnField(Column("name"), "John", prefixOperator: SqlOperator.and),
      ]);

    expect(query.build(), 'SELECT id,name,age FROM users WHERE id = 1 AND name = John');
  });
}
