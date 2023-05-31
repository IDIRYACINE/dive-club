// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class DivingSpecialties extends Table
    with TableInfo<DivingSpecialties, DivingSpecialtie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingSpecialties(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _specialtyNameMeta =
      const VerificationMeta('specialtyName');
  late final GeneratedColumn<String> specialtyName = GeneratedColumn<String>(
      'specialty_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [specialtyId, specialtyName];
  @override
  String get aliasedName => _alias ?? 'DivingSpecialties';
  @override
  String get actualTableName => 'DivingSpecialties';
  @override
  VerificationContext validateIntegrity(Insertable<DivingSpecialtie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('specialty_id')) {
      context.handle(
          _specialtyIdMeta,
          specialtyId.isAcceptableOrUnknown(
              data['specialty_id']!, _specialtyIdMeta));
    }
    if (data.containsKey('specialty_name')) {
      context.handle(
          _specialtyNameMeta,
          specialtyName.isAcceptableOrUnknown(
              data['specialty_name']!, _specialtyNameMeta));
    } else if (isInserting) {
      context.missing(_specialtyNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {specialtyId};
  @override
  DivingSpecialtie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingSpecialtie(
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id'])!,
      specialtyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}specialty_name'])!,
    );
  }

  @override
  DivingSpecialties createAlias(String alias) {
    return DivingSpecialties(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DivingSpecialtie extends DataClass
    implements Insertable<DivingSpecialtie> {
  final int specialtyId;
  final String specialtyName;
  const DivingSpecialtie(
      {required this.specialtyId, required this.specialtyName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['specialty_id'] = Variable<int>(specialtyId);
    map['specialty_name'] = Variable<String>(specialtyName);
    return map;
  }

  DivingSpecialtiesCompanion toCompanion(bool nullToAbsent) {
    return DivingSpecialtiesCompanion(
      specialtyId: Value(specialtyId),
      specialtyName: Value(specialtyName),
    );
  }

  factory DivingSpecialtie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingSpecialtie(
      specialtyId: serializer.fromJson<int>(json['specialty_id']),
      specialtyName: serializer.fromJson<String>(json['specialty_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'specialty_id': serializer.toJson<int>(specialtyId),
      'specialty_name': serializer.toJson<String>(specialtyName),
    };
  }

  DivingSpecialtie copyWith({int? specialtyId, String? specialtyName}) =>
      DivingSpecialtie(
        specialtyId: specialtyId ?? this.specialtyId,
        specialtyName: specialtyName ?? this.specialtyName,
      );
  @override
  String toString() {
    return (StringBuffer('DivingSpecialtie(')
          ..write('specialtyId: $specialtyId, ')
          ..write('specialtyName: $specialtyName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(specialtyId, specialtyName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DivingSpecialtie &&
          other.specialtyId == this.specialtyId &&
          other.specialtyName == this.specialtyName);
}

class DivingSpecialtiesCompanion extends UpdateCompanion<DivingSpecialtie> {
  final Value<int> specialtyId;
  final Value<String> specialtyName;
  const DivingSpecialtiesCompanion({
    this.specialtyId = const Value.absent(),
    this.specialtyName = const Value.absent(),
  });
  DivingSpecialtiesCompanion.insert({
    this.specialtyId = const Value.absent(),
    required String specialtyName,
  }) : specialtyName = Value(specialtyName);
  static Insertable<DivingSpecialtie> custom({
    Expression<int>? specialtyId,
    Expression<String>? specialtyName,
  }) {
    return RawValuesInsertable({
      if (specialtyId != null) 'specialty_id': specialtyId,
      if (specialtyName != null) 'specialty_name': specialtyName,
    });
  }

  DivingSpecialtiesCompanion copyWith(
      {Value<int>? specialtyId, Value<String>? specialtyName}) {
    return DivingSpecialtiesCompanion(
      specialtyId: specialtyId ?? this.specialtyId,
      specialtyName: specialtyName ?? this.specialtyName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (specialtyId.present) {
      map['specialty_id'] = Variable<int>(specialtyId.value);
    }
    if (specialtyName.present) {
      map['specialty_name'] = Variable<String>(specialtyName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivingSpecialtiesCompanion(')
          ..write('specialtyId: $specialtyId, ')
          ..write('specialtyName: $specialtyName')
          ..write(')'))
        .toString();
  }
}

class DivingDivisions extends Table
    with TableInfo<DivingDivisions, DivingDivision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingDivisions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _divisionIdMeta =
      const VerificationMeta('divisionId');
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
      'division_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _divisionNameMeta =
      const VerificationMeta('divisionName');
  late final GeneratedColumn<String> divisionName = GeneratedColumn<String>(
      'division_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [divisionId, divisionName];
  @override
  String get aliasedName => _alias ?? 'DivingDivisions';
  @override
  String get actualTableName => 'DivingDivisions';
  @override
  VerificationContext validateIntegrity(Insertable<DivingDivision> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('division_id')) {
      context.handle(
          _divisionIdMeta,
          divisionId.isAcceptableOrUnknown(
              data['division_id']!, _divisionIdMeta));
    }
    if (data.containsKey('division_name')) {
      context.handle(
          _divisionNameMeta,
          divisionName.isAcceptableOrUnknown(
              data['division_name']!, _divisionNameMeta));
    } else if (isInserting) {
      context.missing(_divisionNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {divisionId};
  @override
  DivingDivision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingDivision(
      divisionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}division_id'])!,
      divisionName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}division_name'])!,
    );
  }

  @override
  DivingDivisions createAlias(String alias) {
    return DivingDivisions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DivingDivision extends DataClass implements Insertable<DivingDivision> {
  final int divisionId;
  final String divisionName;
  const DivingDivision({required this.divisionId, required this.divisionName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['division_id'] = Variable<int>(divisionId);
    map['division_name'] = Variable<String>(divisionName);
    return map;
  }

  DivingDivisionsCompanion toCompanion(bool nullToAbsent) {
    return DivingDivisionsCompanion(
      divisionId: Value(divisionId),
      divisionName: Value(divisionName),
    );
  }

  factory DivingDivision.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingDivision(
      divisionId: serializer.fromJson<int>(json['division_id']),
      divisionName: serializer.fromJson<String>(json['division_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'division_id': serializer.toJson<int>(divisionId),
      'division_name': serializer.toJson<String>(divisionName),
    };
  }

  DivingDivision copyWith({int? divisionId, String? divisionName}) =>
      DivingDivision(
        divisionId: divisionId ?? this.divisionId,
        divisionName: divisionName ?? this.divisionName,
      );
  @override
  String toString() {
    return (StringBuffer('DivingDivision(')
          ..write('divisionId: $divisionId, ')
          ..write('divisionName: $divisionName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(divisionId, divisionName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DivingDivision &&
          other.divisionId == this.divisionId &&
          other.divisionName == this.divisionName);
}

class DivingDivisionsCompanion extends UpdateCompanion<DivingDivision> {
  final Value<int> divisionId;
  final Value<String> divisionName;
  const DivingDivisionsCompanion({
    this.divisionId = const Value.absent(),
    this.divisionName = const Value.absent(),
  });
  DivingDivisionsCompanion.insert({
    this.divisionId = const Value.absent(),
    required String divisionName,
  }) : divisionName = Value(divisionName);
  static Insertable<DivingDivision> custom({
    Expression<int>? divisionId,
    Expression<String>? divisionName,
  }) {
    return RawValuesInsertable({
      if (divisionId != null) 'division_id': divisionId,
      if (divisionName != null) 'division_name': divisionName,
    });
  }

  DivingDivisionsCompanion copyWith(
      {Value<int>? divisionId, Value<String>? divisionName}) {
    return DivingDivisionsCompanion(
      divisionId: divisionId ?? this.divisionId,
      divisionName: divisionName ?? this.divisionName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (divisionName.present) {
      map['division_name'] = Variable<String>(divisionName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivingDivisionsCompanion(')
          ..write('divisionId: $divisionId, ')
          ..write('divisionName: $divisionName')
          ..write(')'))
        .toString();
  }
}

class Clubs extends Table with TableInfo<Clubs, Club> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Clubs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clubIdMeta = const VerificationMeta('clubId');
  late final GeneratedColumn<int> clubId = GeneratedColumn<int>(
      'club_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _clubNameMeta =
      const VerificationMeta('clubName');
  late final GeneratedColumn<String> clubName = GeneratedColumn<String>(
      'club_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [clubId, clubName];
  @override
  String get aliasedName => _alias ?? 'Clubs';
  @override
  String get actualTableName => 'Clubs';
  @override
  VerificationContext validateIntegrity(Insertable<Club> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('club_id')) {
      context.handle(_clubIdMeta,
          clubId.isAcceptableOrUnknown(data['club_id']!, _clubIdMeta));
    }
    if (data.containsKey('club_name')) {
      context.handle(_clubNameMeta,
          clubName.isAcceptableOrUnknown(data['club_name']!, _clubNameMeta));
    } else if (isInserting) {
      context.missing(_clubNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clubId};
  @override
  Club map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Club(
      clubId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}club_id'])!,
      clubName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}club_name'])!,
    );
  }

  @override
  Clubs createAlias(String alias) {
    return Clubs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Club extends DataClass implements Insertable<Club> {
  final int clubId;
  final String clubName;
  const Club({required this.clubId, required this.clubName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['club_id'] = Variable<int>(clubId);
    map['club_name'] = Variable<String>(clubName);
    return map;
  }

  ClubsCompanion toCompanion(bool nullToAbsent) {
    return ClubsCompanion(
      clubId: Value(clubId),
      clubName: Value(clubName),
    );
  }

  factory Club.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Club(
      clubId: serializer.fromJson<int>(json['club_id']),
      clubName: serializer.fromJson<String>(json['club_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'club_id': serializer.toJson<int>(clubId),
      'club_name': serializer.toJson<String>(clubName),
    };
  }

  Club copyWith({int? clubId, String? clubName}) => Club(
        clubId: clubId ?? this.clubId,
        clubName: clubName ?? this.clubName,
      );
  @override
  String toString() {
    return (StringBuffer('Club(')
          ..write('clubId: $clubId, ')
          ..write('clubName: $clubName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(clubId, clubName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Club &&
          other.clubId == this.clubId &&
          other.clubName == this.clubName);
}

class ClubsCompanion extends UpdateCompanion<Club> {
  final Value<int> clubId;
  final Value<String> clubName;
  const ClubsCompanion({
    this.clubId = const Value.absent(),
    this.clubName = const Value.absent(),
  });
  ClubsCompanion.insert({
    this.clubId = const Value.absent(),
    required String clubName,
  }) : clubName = Value(clubName);
  static Insertable<Club> custom({
    Expression<int>? clubId,
    Expression<String>? clubName,
  }) {
    return RawValuesInsertable({
      if (clubId != null) 'club_id': clubId,
      if (clubName != null) 'club_name': clubName,
    });
  }

  ClubsCompanion copyWith({Value<int>? clubId, Value<String>? clubName}) {
    return ClubsCompanion(
      clubId: clubId ?? this.clubId,
      clubName: clubName ?? this.clubName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clubId.present) {
      map['club_id'] = Variable<int>(clubId.value);
    }
    if (clubName.present) {
      map['club_name'] = Variable<String>(clubName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClubsCompanion(')
          ..write('clubId: $clubId, ')
          ..write('clubName: $clubName')
          ..write(')'))
        .toString();
  }
}

class AgeDivisions extends Table with TableInfo<AgeDivisions, AgeDivision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AgeDivisions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ageDivisionYearMeta =
      const VerificationMeta('ageDivisionYear');
  late final GeneratedColumn<int> ageDivisionYear = GeneratedColumn<int>(
      'age_division_year', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _ageDivisionNameMeta =
      const VerificationMeta('ageDivisionName');
  late final GeneratedColumn<String> ageDivisionName = GeneratedColumn<String>(
      'age_division_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [ageDivisionYear, ageDivisionName];
  @override
  String get aliasedName => _alias ?? 'AgeDivisions';
  @override
  String get actualTableName => 'AgeDivisions';
  @override
  VerificationContext validateIntegrity(Insertable<AgeDivision> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('age_division_year')) {
      context.handle(
          _ageDivisionYearMeta,
          ageDivisionYear.isAcceptableOrUnknown(
              data['age_division_year']!, _ageDivisionYearMeta));
    }
    if (data.containsKey('age_division_name')) {
      context.handle(
          _ageDivisionNameMeta,
          ageDivisionName.isAcceptableOrUnknown(
              data['age_division_name']!, _ageDivisionNameMeta));
    } else if (isInserting) {
      context.missing(_ageDivisionNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ageDivisionYear};
  @override
  AgeDivision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgeDivision(
      ageDivisionYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_division_year'])!,
      ageDivisionName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}age_division_name'])!,
    );
  }

  @override
  AgeDivisions createAlias(String alias) {
    return AgeDivisions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AgeDivision extends DataClass implements Insertable<AgeDivision> {
  final int ageDivisionYear;
  final String ageDivisionName;
  const AgeDivision(
      {required this.ageDivisionYear, required this.ageDivisionName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['age_division_year'] = Variable<int>(ageDivisionYear);
    map['age_division_name'] = Variable<String>(ageDivisionName);
    return map;
  }

  AgeDivisionsCompanion toCompanion(bool nullToAbsent) {
    return AgeDivisionsCompanion(
      ageDivisionYear: Value(ageDivisionYear),
      ageDivisionName: Value(ageDivisionName),
    );
  }

  factory AgeDivision.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgeDivision(
      ageDivisionYear: serializer.fromJson<int>(json['age_division_year']),
      ageDivisionName: serializer.fromJson<String>(json['age_division_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'age_division_year': serializer.toJson<int>(ageDivisionYear),
      'age_division_name': serializer.toJson<String>(ageDivisionName),
    };
  }

  AgeDivision copyWith({int? ageDivisionYear, String? ageDivisionName}) =>
      AgeDivision(
        ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
        ageDivisionName: ageDivisionName ?? this.ageDivisionName,
      );
  @override
  String toString() {
    return (StringBuffer('AgeDivision(')
          ..write('ageDivisionYear: $ageDivisionYear, ')
          ..write('ageDivisionName: $ageDivisionName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ageDivisionYear, ageDivisionName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgeDivision &&
          other.ageDivisionYear == this.ageDivisionYear &&
          other.ageDivisionName == this.ageDivisionName);
}

class AgeDivisionsCompanion extends UpdateCompanion<AgeDivision> {
  final Value<int> ageDivisionYear;
  final Value<String> ageDivisionName;
  const AgeDivisionsCompanion({
    this.ageDivisionYear = const Value.absent(),
    this.ageDivisionName = const Value.absent(),
  });
  AgeDivisionsCompanion.insert({
    this.ageDivisionYear = const Value.absent(),
    required String ageDivisionName,
  }) : ageDivisionName = Value(ageDivisionName);
  static Insertable<AgeDivision> custom({
    Expression<int>? ageDivisionYear,
    Expression<String>? ageDivisionName,
  }) {
    return RawValuesInsertable({
      if (ageDivisionYear != null) 'age_division_year': ageDivisionYear,
      if (ageDivisionName != null) 'age_division_name': ageDivisionName,
    });
  }

  AgeDivisionsCompanion copyWith(
      {Value<int>? ageDivisionYear, Value<String>? ageDivisionName}) {
    return AgeDivisionsCompanion(
      ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
      ageDivisionName: ageDivisionName ?? this.ageDivisionName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ageDivisionYear.present) {
      map['age_division_year'] = Variable<int>(ageDivisionYear.value);
    }
    if (ageDivisionName.present) {
      map['age_division_name'] = Variable<String>(ageDivisionName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgeDivisionsCompanion(')
          ..write('ageDivisionYear: $ageDivisionYear, ')
          ..write('ageDivisionName: $ageDivisionName')
          ..write(')'))
        .toString();
  }
}

class Genders extends Table with TableInfo<Genders, Gender> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Genders(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _genderNameMeta =
      const VerificationMeta('genderName');
  late final GeneratedColumn<String> genderName = GeneratedColumn<String>(
      'gender_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [genderId, genderName];
  @override
  String get aliasedName => _alias ?? 'Genders';
  @override
  String get actualTableName => 'Genders';
  @override
  VerificationContext validateIntegrity(Insertable<Gender> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    }
    if (data.containsKey('gender_name')) {
      context.handle(
          _genderNameMeta,
          genderName.isAcceptableOrUnknown(
              data['gender_name']!, _genderNameMeta));
    } else if (isInserting) {
      context.missing(_genderNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {genderId};
  @override
  Gender map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Gender(
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id'])!,
      genderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender_name'])!,
    );
  }

  @override
  Genders createAlias(String alias) {
    return Genders(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Gender extends DataClass implements Insertable<Gender> {
  final int genderId;
  final String genderName;
  const Gender({required this.genderId, required this.genderName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['gender_id'] = Variable<int>(genderId);
    map['gender_name'] = Variable<String>(genderName);
    return map;
  }

  GendersCompanion toCompanion(bool nullToAbsent) {
    return GendersCompanion(
      genderId: Value(genderId),
      genderName: Value(genderName),
    );
  }

  factory Gender.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gender(
      genderId: serializer.fromJson<int>(json['gender_id']),
      genderName: serializer.fromJson<String>(json['gender_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gender_id': serializer.toJson<int>(genderId),
      'gender_name': serializer.toJson<String>(genderName),
    };
  }

  Gender copyWith({int? genderId, String? genderName}) => Gender(
        genderId: genderId ?? this.genderId,
        genderName: genderName ?? this.genderName,
      );
  @override
  String toString() {
    return (StringBuffer('Gender(')
          ..write('genderId: $genderId, ')
          ..write('genderName: $genderName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(genderId, genderName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gender &&
          other.genderId == this.genderId &&
          other.genderName == this.genderName);
}

class GendersCompanion extends UpdateCompanion<Gender> {
  final Value<int> genderId;
  final Value<String> genderName;
  const GendersCompanion({
    this.genderId = const Value.absent(),
    this.genderName = const Value.absent(),
  });
  GendersCompanion.insert({
    this.genderId = const Value.absent(),
    required String genderName,
  }) : genderName = Value(genderName);
  static Insertable<Gender> custom({
    Expression<int>? genderId,
    Expression<String>? genderName,
  }) {
    return RawValuesInsertable({
      if (genderId != null) 'gender_id': genderId,
      if (genderName != null) 'gender_name': genderName,
    });
  }

  GendersCompanion copyWith({Value<int>? genderId, Value<String>? genderName}) {
    return GendersCompanion(
      genderId: genderId ?? this.genderId,
      genderName: genderName ?? this.genderName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (genderName.present) {
      map['gender_name'] = Variable<String>(genderName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GendersCompanion(')
          ..write('genderId: $genderId, ')
          ..write('genderName: $genderName')
          ..write(')'))
        .toString();
  }
}

class Participants extends Table with TableInfo<Participants, Participant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Participants(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _participantIdMeta =
      const VerificationMeta('participantId');
  late final GeneratedColumn<int> participantId = GeneratedColumn<int>(
      'participant_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _participantFirstNameMeta =
      const VerificationMeta('participantFirstName');
  late final GeneratedColumn<String> participantFirstName =
      GeneratedColumn<String>('participant_first_name', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _participantLastNameMeta =
      const VerificationMeta('participantLastName');
  late final GeneratedColumn<String> participantLastName =
      GeneratedColumn<String>('participant_last_name', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _entryTimeMeta =
      const VerificationMeta('entryTime');
  late final GeneratedColumn<int> entryTime = GeneratedColumn<int>(
      'entry_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _clubIdMeta = const VerificationMeta('clubId');
  late final GeneratedColumn<int> clubId = GeneratedColumn<int>(
      'club_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Clubs(club_id)');
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Genders(gender_id)');
  static const VerificationMeta _divisionIdMeta =
      const VerificationMeta('divisionId');
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
      'division_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingDivisions(division_id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES DivingSpecialties(specialty_id)');
  static const VerificationMeta _ageDivisionYearMeta =
      const VerificationMeta('ageDivisionYear');
  late final GeneratedColumn<int> ageDivisionYear = GeneratedColumn<int>(
      'age_division_year', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES AgeDivisions(age_division_year)');
  @override
  List<GeneratedColumn> get $columns => [
        participantId,
        participantFirstName,
        participantLastName,
        entryTime,
        birthDate,
        clubId,
        genderId,
        divisionId,
        specialtyId,
        ageDivisionYear
      ];
  @override
  String get aliasedName => _alias ?? 'Participants';
  @override
  String get actualTableName => 'Participants';
  @override
  VerificationContext validateIntegrity(Insertable<Participant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('participant_id')) {
      context.handle(
          _participantIdMeta,
          participantId.isAcceptableOrUnknown(
              data['participant_id']!, _participantIdMeta));
    }
    if (data.containsKey('participant_first_name')) {
      context.handle(
          _participantFirstNameMeta,
          participantFirstName.isAcceptableOrUnknown(
              data['participant_first_name']!, _participantFirstNameMeta));
    } else if (isInserting) {
      context.missing(_participantFirstNameMeta);
    }
    if (data.containsKey('participant_last_name')) {
      context.handle(
          _participantLastNameMeta,
          participantLastName.isAcceptableOrUnknown(
              data['participant_last_name']!, _participantLastNameMeta));
    } else if (isInserting) {
      context.missing(_participantLastNameMeta);
    }
    if (data.containsKey('entry_time')) {
      context.handle(_entryTimeMeta,
          entryTime.isAcceptableOrUnknown(data['entry_time']!, _entryTimeMeta));
    } else if (isInserting) {
      context.missing(_entryTimeMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('club_id')) {
      context.handle(_clubIdMeta,
          clubId.isAcceptableOrUnknown(data['club_id']!, _clubIdMeta));
    } else if (isInserting) {
      context.missing(_clubIdMeta);
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    } else if (isInserting) {
      context.missing(_genderIdMeta);
    }
    if (data.containsKey('division_id')) {
      context.handle(
          _divisionIdMeta,
          divisionId.isAcceptableOrUnknown(
              data['division_id']!, _divisionIdMeta));
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('specialty_id')) {
      context.handle(
          _specialtyIdMeta,
          specialtyId.isAcceptableOrUnknown(
              data['specialty_id']!, _specialtyIdMeta));
    } else if (isInserting) {
      context.missing(_specialtyIdMeta);
    }
    if (data.containsKey('age_division_year')) {
      context.handle(
          _ageDivisionYearMeta,
          ageDivisionYear.isAcceptableOrUnknown(
              data['age_division_year']!, _ageDivisionYearMeta));
    } else if (isInserting) {
      context.missing(_ageDivisionYearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {participantId};
  @override
  Participant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Participant(
      participantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participant_id'])!,
      participantFirstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}participant_first_name'])!,
      participantLastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}participant_last_name'])!,
      entryTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_time'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      clubId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}club_id'])!,
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id'])!,
      divisionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}division_id'])!,
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id'])!,
      ageDivisionYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_division_year'])!,
    );
  }

  @override
  Participants createAlias(String alias) {
    return Participants(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Participant extends DataClass implements Insertable<Participant> {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  const Participant(
      {required this.participantId,
      required this.participantFirstName,
      required this.participantLastName,
      required this.entryTime,
      required this.birthDate,
      required this.clubId,
      required this.genderId,
      required this.divisionId,
      required this.specialtyId,
      required this.ageDivisionYear});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['participant_id'] = Variable<int>(participantId);
    map['participant_first_name'] = Variable<String>(participantFirstName);
    map['participant_last_name'] = Variable<String>(participantLastName);
    map['entry_time'] = Variable<int>(entryTime);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['club_id'] = Variable<int>(clubId);
    map['gender_id'] = Variable<int>(genderId);
    map['division_id'] = Variable<int>(divisionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    map['age_division_year'] = Variable<int>(ageDivisionYear);
    return map;
  }

  ParticipantsCompanion toCompanion(bool nullToAbsent) {
    return ParticipantsCompanion(
      participantId: Value(participantId),
      participantFirstName: Value(participantFirstName),
      participantLastName: Value(participantLastName),
      entryTime: Value(entryTime),
      birthDate: Value(birthDate),
      clubId: Value(clubId),
      genderId: Value(genderId),
      divisionId: Value(divisionId),
      specialtyId: Value(specialtyId),
      ageDivisionYear: Value(ageDivisionYear),
    );
  }

  factory Participant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Participant(
      participantId: serializer.fromJson<int>(json['participant_id']),
      participantFirstName:
          serializer.fromJson<String>(json['participant_first_name']),
      participantLastName:
          serializer.fromJson<String>(json['participant_last_name']),
      entryTime: serializer.fromJson<int>(json['entry_time']),
      birthDate: serializer.fromJson<DateTime>(json['birth_date']),
      clubId: serializer.fromJson<int>(json['club_id']),
      genderId: serializer.fromJson<int>(json['gender_id']),
      divisionId: serializer.fromJson<int>(json['division_id']),
      specialtyId: serializer.fromJson<int>(json['specialty_id']),
      ageDivisionYear: serializer.fromJson<int>(json['age_division_year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'participant_id': serializer.toJson<int>(participantId),
      'participant_first_name': serializer.toJson<String>(participantFirstName),
      'participant_last_name': serializer.toJson<String>(participantLastName),
      'entry_time': serializer.toJson<int>(entryTime),
      'birth_date': serializer.toJson<DateTime>(birthDate),
      'club_id': serializer.toJson<int>(clubId),
      'gender_id': serializer.toJson<int>(genderId),
      'division_id': serializer.toJson<int>(divisionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
      'age_division_year': serializer.toJson<int>(ageDivisionYear),
    };
  }

  Participant copyWith(
          {int? participantId,
          String? participantFirstName,
          String? participantLastName,
          int? entryTime,
          DateTime? birthDate,
          int? clubId,
          int? genderId,
          int? divisionId,
          int? specialtyId,
          int? ageDivisionYear}) =>
      Participant(
        participantId: participantId ?? this.participantId,
        participantFirstName: participantFirstName ?? this.participantFirstName,
        participantLastName: participantLastName ?? this.participantLastName,
        entryTime: entryTime ?? this.entryTime,
        birthDate: birthDate ?? this.birthDate,
        clubId: clubId ?? this.clubId,
        genderId: genderId ?? this.genderId,
        divisionId: divisionId ?? this.divisionId,
        specialtyId: specialtyId ?? this.specialtyId,
        ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
      );
  @override
  String toString() {
    return (StringBuffer('Participant(')
          ..write('participantId: $participantId, ')
          ..write('participantFirstName: $participantFirstName, ')
          ..write('participantLastName: $participantLastName, ')
          ..write('entryTime: $entryTime, ')
          ..write('birthDate: $birthDate, ')
          ..write('clubId: $clubId, ')
          ..write('genderId: $genderId, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('ageDivisionYear: $ageDivisionYear')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      participantId,
      participantFirstName,
      participantLastName,
      entryTime,
      birthDate,
      clubId,
      genderId,
      divisionId,
      specialtyId,
      ageDivisionYear);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Participant &&
          other.participantId == this.participantId &&
          other.participantFirstName == this.participantFirstName &&
          other.participantLastName == this.participantLastName &&
          other.entryTime == this.entryTime &&
          other.birthDate == this.birthDate &&
          other.clubId == this.clubId &&
          other.genderId == this.genderId &&
          other.divisionId == this.divisionId &&
          other.specialtyId == this.specialtyId &&
          other.ageDivisionYear == this.ageDivisionYear);
}

class ParticipantsCompanion extends UpdateCompanion<Participant> {
  final Value<int> participantId;
  final Value<String> participantFirstName;
  final Value<String> participantLastName;
  final Value<int> entryTime;
  final Value<DateTime> birthDate;
  final Value<int> clubId;
  final Value<int> genderId;
  final Value<int> divisionId;
  final Value<int> specialtyId;
  final Value<int> ageDivisionYear;
  const ParticipantsCompanion({
    this.participantId = const Value.absent(),
    this.participantFirstName = const Value.absent(),
    this.participantLastName = const Value.absent(),
    this.entryTime = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.clubId = const Value.absent(),
    this.genderId = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
    this.ageDivisionYear = const Value.absent(),
  });
  ParticipantsCompanion.insert({
    this.participantId = const Value.absent(),
    required String participantFirstName,
    required String participantLastName,
    required int entryTime,
    required DateTime birthDate,
    required int clubId,
    required int genderId,
    required int divisionId,
    required int specialtyId,
    required int ageDivisionYear,
  })  : participantFirstName = Value(participantFirstName),
        participantLastName = Value(participantLastName),
        entryTime = Value(entryTime),
        birthDate = Value(birthDate),
        clubId = Value(clubId),
        genderId = Value(genderId),
        divisionId = Value(divisionId),
        specialtyId = Value(specialtyId),
        ageDivisionYear = Value(ageDivisionYear);
  static Insertable<Participant> custom({
    Expression<int>? participantId,
    Expression<String>? participantFirstName,
    Expression<String>? participantLastName,
    Expression<int>? entryTime,
    Expression<DateTime>? birthDate,
    Expression<int>? clubId,
    Expression<int>? genderId,
    Expression<int>? divisionId,
    Expression<int>? specialtyId,
    Expression<int>? ageDivisionYear,
  }) {
    return RawValuesInsertable({
      if (participantId != null) 'participant_id': participantId,
      if (participantFirstName != null)
        'participant_first_name': participantFirstName,
      if (participantLastName != null)
        'participant_last_name': participantLastName,
      if (entryTime != null) 'entry_time': entryTime,
      if (birthDate != null) 'birth_date': birthDate,
      if (clubId != null) 'club_id': clubId,
      if (genderId != null) 'gender_id': genderId,
      if (divisionId != null) 'division_id': divisionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
      if (ageDivisionYear != null) 'age_division_year': ageDivisionYear,
    });
  }

  ParticipantsCompanion copyWith(
      {Value<int>? participantId,
      Value<String>? participantFirstName,
      Value<String>? participantLastName,
      Value<int>? entryTime,
      Value<DateTime>? birthDate,
      Value<int>? clubId,
      Value<int>? genderId,
      Value<int>? divisionId,
      Value<int>? specialtyId,
      Value<int>? ageDivisionYear}) {
    return ParticipantsCompanion(
      participantId: participantId ?? this.participantId,
      participantFirstName: participantFirstName ?? this.participantFirstName,
      participantLastName: participantLastName ?? this.participantLastName,
      entryTime: entryTime ?? this.entryTime,
      birthDate: birthDate ?? this.birthDate,
      clubId: clubId ?? this.clubId,
      genderId: genderId ?? this.genderId,
      divisionId: divisionId ?? this.divisionId,
      specialtyId: specialtyId ?? this.specialtyId,
      ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (participantId.present) {
      map['participant_id'] = Variable<int>(participantId.value);
    }
    if (participantFirstName.present) {
      map['participant_first_name'] =
          Variable<String>(participantFirstName.value);
    }
    if (participantLastName.present) {
      map['participant_last_name'] =
          Variable<String>(participantLastName.value);
    }
    if (entryTime.present) {
      map['entry_time'] = Variable<int>(entryTime.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (clubId.present) {
      map['club_id'] = Variable<int>(clubId.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (specialtyId.present) {
      map['specialty_id'] = Variable<int>(specialtyId.value);
    }
    if (ageDivisionYear.present) {
      map['age_division_year'] = Variable<int>(ageDivisionYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantsCompanion(')
          ..write('participantId: $participantId, ')
          ..write('participantFirstName: $participantFirstName, ')
          ..write('participantLastName: $participantLastName, ')
          ..write('entryTime: $entryTime, ')
          ..write('birthDate: $birthDate, ')
          ..write('clubId: $clubId, ')
          ..write('genderId: $genderId, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('ageDivisionYear: $ageDivisionYear')
          ..write(')'))
        .toString();
  }
}

class Scores extends Table with TableInfo<Scores, Score> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Scores(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _participantIdMeta =
      const VerificationMeta('participantId');
  late final GeneratedColumn<int> participantId = GeneratedColumn<int>(
      'participant_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Participants(participant_id)');
  static const VerificationMeta _divisionIdMeta =
      const VerificationMeta('divisionId');
  late final GeneratedColumn<int> divisionId = GeneratedColumn<int>(
      'division_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingDivisions(division_id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES DivingSpecialties(specialty_id)');
  static const VerificationMeta _ageDivisionYearMeta =
      const VerificationMeta('ageDivisionYear');
  late final GeneratedColumn<int> ageDivisionYear = GeneratedColumn<int>(
      'age_division_year', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES AgeDivisions(age_division_year)');
  static const VerificationMeta _genderIdMeta =
      const VerificationMeta('genderId');
  late final GeneratedColumn<int> genderId = GeneratedColumn<int>(
      'gender_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Genders(gender_id)');
  static const VerificationMeta _scoreDateMeta =
      const VerificationMeta('scoreDate');
  late final GeneratedColumn<DateTime> scoreDate = GeneratedColumn<DateTime>(
      'score_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_DATE',
      defaultValue: const CustomExpression('CURRENT_DATE'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        participantId,
        divisionId,
        specialtyId,
        ageDivisionYear,
        genderId,
        scoreDate,
        score
      ];
  @override
  String get aliasedName => _alias ?? 'Scores';
  @override
  String get actualTableName => 'Scores';
  @override
  VerificationContext validateIntegrity(Insertable<Score> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('participant_id')) {
      context.handle(
          _participantIdMeta,
          participantId.isAcceptableOrUnknown(
              data['participant_id']!, _participantIdMeta));
    } else if (isInserting) {
      context.missing(_participantIdMeta);
    }
    if (data.containsKey('division_id')) {
      context.handle(
          _divisionIdMeta,
          divisionId.isAcceptableOrUnknown(
              data['division_id']!, _divisionIdMeta));
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('specialty_id')) {
      context.handle(
          _specialtyIdMeta,
          specialtyId.isAcceptableOrUnknown(
              data['specialty_id']!, _specialtyIdMeta));
    } else if (isInserting) {
      context.missing(_specialtyIdMeta);
    }
    if (data.containsKey('age_division_year')) {
      context.handle(
          _ageDivisionYearMeta,
          ageDivisionYear.isAcceptableOrUnknown(
              data['age_division_year']!, _ageDivisionYearMeta));
    } else if (isInserting) {
      context.missing(_ageDivisionYearMeta);
    }
    if (data.containsKey('gender_id')) {
      context.handle(_genderIdMeta,
          genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta));
    } else if (isInserting) {
      context.missing(_genderIdMeta);
    }
    if (data.containsKey('score_date')) {
      context.handle(_scoreDateMeta,
          scoreDate.isAcceptableOrUnknown(data['score_date']!, _scoreDateMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {participantId, divisionId, specialtyId, ageDivisionYear};
  @override
  Score map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Score(
      participantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participant_id'])!,
      divisionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}division_id'])!,
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id'])!,
      ageDivisionYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age_division_year'])!,
      genderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender_id'])!,
      scoreDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}score_date'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
    );
  }

  @override
  Scores createAlias(String alias) {
    return Scores(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY(participant_id, division_id, specialty_id, age_division_year)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Score extends DataClass implements Insertable<Score> {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  const Score(
      {required this.participantId,
      required this.divisionId,
      required this.specialtyId,
      required this.ageDivisionYear,
      required this.genderId,
      required this.scoreDate,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['participant_id'] = Variable<int>(participantId);
    map['division_id'] = Variable<int>(divisionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    map['age_division_year'] = Variable<int>(ageDivisionYear);
    map['gender_id'] = Variable<int>(genderId);
    map['score_date'] = Variable<DateTime>(scoreDate);
    map['score'] = Variable<int>(score);
    return map;
  }

  ScoresCompanion toCompanion(bool nullToAbsent) {
    return ScoresCompanion(
      participantId: Value(participantId),
      divisionId: Value(divisionId),
      specialtyId: Value(specialtyId),
      ageDivisionYear: Value(ageDivisionYear),
      genderId: Value(genderId),
      scoreDate: Value(scoreDate),
      score: Value(score),
    );
  }

  factory Score.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Score(
      participantId: serializer.fromJson<int>(json['participant_id']),
      divisionId: serializer.fromJson<int>(json['division_id']),
      specialtyId: serializer.fromJson<int>(json['specialty_id']),
      ageDivisionYear: serializer.fromJson<int>(json['age_division_year']),
      genderId: serializer.fromJson<int>(json['gender_id']),
      scoreDate: serializer.fromJson<DateTime>(json['score_date']),
      score: serializer.fromJson<int>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'participant_id': serializer.toJson<int>(participantId),
      'division_id': serializer.toJson<int>(divisionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
      'age_division_year': serializer.toJson<int>(ageDivisionYear),
      'gender_id': serializer.toJson<int>(genderId),
      'score_date': serializer.toJson<DateTime>(scoreDate),
      'score': serializer.toJson<int>(score),
    };
  }

  Score copyWith(
          {int? participantId,
          int? divisionId,
          int? specialtyId,
          int? ageDivisionYear,
          int? genderId,
          DateTime? scoreDate,
          int? score}) =>
      Score(
        participantId: participantId ?? this.participantId,
        divisionId: divisionId ?? this.divisionId,
        specialtyId: specialtyId ?? this.specialtyId,
        ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
        genderId: genderId ?? this.genderId,
        scoreDate: scoreDate ?? this.scoreDate,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('Score(')
          ..write('participantId: $participantId, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('ageDivisionYear: $ageDivisionYear, ')
          ..write('genderId: $genderId, ')
          ..write('scoreDate: $scoreDate, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(participantId, divisionId, specialtyId,
      ageDivisionYear, genderId, scoreDate, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Score &&
          other.participantId == this.participantId &&
          other.divisionId == this.divisionId &&
          other.specialtyId == this.specialtyId &&
          other.ageDivisionYear == this.ageDivisionYear &&
          other.genderId == this.genderId &&
          other.scoreDate == this.scoreDate &&
          other.score == this.score);
}

class ScoresCompanion extends UpdateCompanion<Score> {
  final Value<int> participantId;
  final Value<int> divisionId;
  final Value<int> specialtyId;
  final Value<int> ageDivisionYear;
  final Value<int> genderId;
  final Value<DateTime> scoreDate;
  final Value<int> score;
  final Value<int> rowid;
  const ScoresCompanion({
    this.participantId = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
    this.ageDivisionYear = const Value.absent(),
    this.genderId = const Value.absent(),
    this.scoreDate = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScoresCompanion.insert({
    required int participantId,
    required int divisionId,
    required int specialtyId,
    required int ageDivisionYear,
    required int genderId,
    this.scoreDate = const Value.absent(),
    required int score,
    this.rowid = const Value.absent(),
  })  : participantId = Value(participantId),
        divisionId = Value(divisionId),
        specialtyId = Value(specialtyId),
        ageDivisionYear = Value(ageDivisionYear),
        genderId = Value(genderId),
        score = Value(score);
  static Insertable<Score> custom({
    Expression<int>? participantId,
    Expression<int>? divisionId,
    Expression<int>? specialtyId,
    Expression<int>? ageDivisionYear,
    Expression<int>? genderId,
    Expression<DateTime>? scoreDate,
    Expression<int>? score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (participantId != null) 'participant_id': participantId,
      if (divisionId != null) 'division_id': divisionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
      if (ageDivisionYear != null) 'age_division_year': ageDivisionYear,
      if (genderId != null) 'gender_id': genderId,
      if (scoreDate != null) 'score_date': scoreDate,
      if (score != null) 'score': score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScoresCompanion copyWith(
      {Value<int>? participantId,
      Value<int>? divisionId,
      Value<int>? specialtyId,
      Value<int>? ageDivisionYear,
      Value<int>? genderId,
      Value<DateTime>? scoreDate,
      Value<int>? score,
      Value<int>? rowid}) {
    return ScoresCompanion(
      participantId: participantId ?? this.participantId,
      divisionId: divisionId ?? this.divisionId,
      specialtyId: specialtyId ?? this.specialtyId,
      ageDivisionYear: ageDivisionYear ?? this.ageDivisionYear,
      genderId: genderId ?? this.genderId,
      scoreDate: scoreDate ?? this.scoreDate,
      score: score ?? this.score,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (participantId.present) {
      map['participant_id'] = Variable<int>(participantId.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (specialtyId.present) {
      map['specialty_id'] = Variable<int>(specialtyId.value);
    }
    if (ageDivisionYear.present) {
      map['age_division_year'] = Variable<int>(ageDivisionYear.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<int>(genderId.value);
    }
    if (scoreDate.present) {
      map['score_date'] = Variable<DateTime>(scoreDate.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoresCompanion(')
          ..write('participantId: $participantId, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('ageDivisionYear: $ageDivisionYear, ')
          ..write('genderId: $genderId, ')
          ..write('scoreDate: $scoreDate, ')
          ..write('score: $score, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final DivingSpecialties divingSpecialties = DivingSpecialties(this);
  late final DivingDivisions divingDivisions = DivingDivisions(this);
  late final Clubs clubs = Clubs(this);
  late final AgeDivisions ageDivisions = AgeDivisions(this);
  late final Genders genders = Genders(this);
  late final Participants participants = Participants(this);
  late final Scores scores = Scores(this);
  late final Index scoreIdx =
      Index('score_idx', 'CREATE INDEX score_idx ON Scores (score)');
  Future<int> createParticipant(
      {required String firstName,
      required String lastName,
      required DateTime birthDate,
      required int divisionId,
      required int specialtyId,
      required int ageDivisionYear,
      required int genderId,
      required int entryTime,
      required int clubId}) {
    return customInsert(
      'INSERT INTO Participants (participant_first_name, participant_last_name, birth_date, division_id, specialty_id, age_division_year, gender_id, entry_time, club_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9)',
      variables: [
        Variable<String>(firstName),
        Variable<String>(lastName),
        Variable<DateTime>(birthDate),
        Variable<int>(divisionId),
        Variable<int>(specialtyId),
        Variable<int>(ageDivisionYear),
        Variable<int>(genderId),
        Variable<int>(entryTime),
        Variable<int>(clubId)
      ],
      updates: {participants},
    );
  }

  Future<int> updateParticipant(
      {required String name,
      required DateTime birthDate,
      required int divisionId,
      required int specialtyId,
      required int id}) {
    return customUpdate(
      'UPDATE Participants SET participant_first_name = ?1, birth_date = ?2, division_id = ?3, specialty_id = ?4 WHERE participant_id = ?5',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(birthDate),
        Variable<int>(divisionId),
        Variable<int>(specialtyId),
        Variable<int>(id)
      ],
      updates: {participants},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createScore(
      {required int participantId,
      required DateTime date,
      required int score,
      required int divisionId,
      required int specialtyId,
      required int ageDivisionYear,
      required int genderId}) {
    return customInsert(
      'INSERT OR REPLACE INTO Scores (participant_id, score_date, score, division_id, specialty_id, age_division_year, gender_id) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<int>(participantId),
        Variable<DateTime>(date),
        Variable<int>(score),
        Variable<int>(divisionId),
        Variable<int>(specialtyId),
        Variable<int>(ageDivisionYear),
        Variable<int>(genderId)
      ],
      updates: {scores},
    );
  }

  Future<int> updateScore(
      {required int score,
      required int participantId,
      required int divisionId,
      required int specialtyId}) {
    return customUpdate(
      'UPDATE Scores SET score_date = CURRENT_DATE, score = ?1 WHERE participant_id = ?2 AND division_id = ?3 AND specialty_id = ?4',
      variables: [
        Variable<int>(score),
        Variable<int>(participantId),
        Variable<int>(divisionId),
        Variable<int>(specialtyId)
      ],
      updates: {scores},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createDivingSpecialties({required String name}) {
    return customInsert(
      'INSERT INTO DivingSpecialties (specialty_name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingSpecialties},
    );
  }

  Future<int> updateDivingSpecialties({required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingSpecialties SET specialty_name = ?1 WHERE specialty_id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingSpecialties},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createDivingDivisions({required String name}) {
    return customInsert(
      'INSERT INTO DivingDivisions (division_name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingDivisions},
    );
  }

  Future<int> updateDivingDivisions({required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingDivisions SET division_name = ?1 WHERE division_id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingDivisions},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createGenders({required String name}) {
    return customInsert(
      'INSERT INTO Genders (gender_name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {genders},
    );
  }

  Future<int> updateGenders({required String name, required int id}) {
    return customUpdate(
      'UPDATE Genders SET gender_name = ?1 WHERE gender_id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {genders},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createAgeDivisions({required int year, required String name}) {
    return customInsert(
      'INSERT INTO AgeDivisions (age_division_year, age_division_name) VALUES (?1, ?2)',
      variables: [Variable<int>(year), Variable<String>(name)],
      updates: {ageDivisions},
    );
  }

  Future<int> updateAgeDivisions({required String name, required int id}) {
    return customUpdate(
      'UPDATE AgeDivisions SET age_division_name = ?1 WHERE age_division_year = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {ageDivisions},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<SelectCompetitionScoresResult> selectCompetitionScores() {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)ORDER BY score ASC',
        variables: [],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
      );
    });
  }

  Selectable<SelectCompetitionScoresBySpecialtyResult>
      selectCompetitionScoresBySpecialty({required int id}) {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)WHERE Scores.specialty_id = ?1 ORDER BY score ASC',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresBySpecialtyResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
      );
    });
  }

  Selectable<SelectCompetitionScoresByDivisionResult>
      selectCompetitionScoresByDivision({required int id}) {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)WHERE Scores.division_id = ?1 ORDER BY score ASC',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresByDivisionResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
      );
    });
  }

  Selectable<SelectCompetitionScoresByAgeResult> selectCompetitionScoresByAge(
      {required int year}) {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name, AgeDivisions.age_division_name, Genders.gender_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Genders USING(gender_id)INNER JOIN AgeDivisions USING(age_division_year)INNER JOIN Participants USING(participant_id)WHERE Scores.age_division_year = ?1 ORDER BY score ASC',
        variables: [
          Variable<int>(year)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          ageDivisions,
          genders,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresByAgeResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        ageDivisionName: row.read<String>('age_division_name'),
        genderName: row.read<String>('gender_name'),
      );
    });
  }

  Selectable<SelectCompetitionScoresBySpecialtyAndDivisionAndAgeResult>
      selectCompetitionScoresBySpecialtyAndDivisionAndAge(
          {required int specialtyId,
          required int divisionId,
          required int year}) {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name, Genders.gender_name, AgeDivisions.age_division_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)INNER JOIN Genders USING(gender_id)INNER JOIN AgeDivisions USING(age_division_year)WHERE Scores.specialty_id = ?1 AND Scores.division_id = ?2 AND Scores.age_division_year = ?3 ORDER BY score ASC',
        variables: [
          Variable<int>(specialtyId),
          Variable<int>(divisionId),
          Variable<int>(year)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          genders,
          ageDivisions,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresBySpecialtyAndDivisionAndAgeResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        genderName: row.read<String>('gender_name'),
        ageDivisionName: row.read<String>('age_division_name'),
      );
    });
  }

  Selectable<SelectCompetitionScoresBySpecialtyAndDivisionResult>
      selectCompetitionScoresBySpecialtyAndDivision(
          {required int specialtyId, required int divisionId}) {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_first_name, Participants.participant_last_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)WHERE Scores.specialty_id = ?1 AND Scores.division_id = ?2 ORDER BY score ASC',
        variables: [
          Variable<int>(specialtyId),
          Variable<int>(divisionId)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
          scores,
        }).map((QueryRow row) {
      return SelectCompetitionScoresBySpecialtyAndDivisionResult(
        participantId: row.read<int>('participant_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        genderId: row.read<int>('gender_id'),
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<int>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
      );
    });
  }

  Selectable<DivingSpecialtie> selectDivingSpecialties() {
    return customSelect('SELECT * FROM DivingSpecialties',
        variables: [],
        readsFrom: {
          divingSpecialties,
        }).asyncMap(divingSpecialties.mapFromRow);
  }

  Selectable<DivingDivision> selectDivingDivisions() {
    return customSelect('SELECT * FROM DivingDivisions',
        variables: [],
        readsFrom: {
          divingDivisions,
        }).asyncMap(divingDivisions.mapFromRow);
  }

  Selectable<SearchParticipantsByIdResult> searchParticipantsById(
      {required int id}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id WHERE participant_id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SearchParticipantsByIdResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  Selectable<SelectParticiapntsResult> selectParticiapnts() {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, AgeDivisions.age_division_year, Genders.gender_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN AgeDivisions ON AgeDivisions.age_division_year = Participants.age_division_year INNER JOIN Genders ON Genders.gender_id = Participants.gender_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id',
        variables: [],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          ageDivisions,
          genders,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        ageDivisionYear1: row.read<int>('age_division_year'),
        genderName: row.read<String>('gender_name'),
      );
    });
  }

  Selectable<SelectParticiapnsBySpecialtyResult> selectParticiapnsBySpecialty(
      {required int id}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, AgeDivisions.age_division_year, Genders.gender_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id INNER JOIN AgeDivisions ON AgeDivisions.age_division_year = Participants.age_division_year INNER JOIN Genders ON Genders.gender_id = Participants.gender_id WHERE Participants.specialty_id = ?1 ORDER BY Participants.entry_time',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          ageDivisions,
          genders,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapnsBySpecialtyResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        ageDivisionYear1: row.read<int>('age_division_year'),
        genderName: row.read<String>('gender_name'),
      );
    });
  }

  Selectable<SelectParticiapntsByDivisionResult> selectParticiapntsByDivision(
      {required int id}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, AgeDivisions.age_division_year, Genders.gender_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id INNER JOIN AgeDivisions ON AgeDivisions.age_division_year = Participants.age_division_year INNER JOIN Genders ON Genders.gender_id = Participants.gender_id WHERE Participants.division_id = ?1 ORDER BY Participants.entry_time',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          ageDivisions,
          genders,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsByDivisionResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        ageDivisionYear1: row.read<int>('age_division_year'),
        genderName: row.read<String>('gender_name'),
      );
    });
  }

  Selectable<SelectParticiapntsByDivisionAndSpecialtyResult>
      selectParticiapntsByDivisionAndSpecialty(
          {required int divisionId, required int specialtyId}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, AgeDivisions.age_division_year, Genders.gender_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id INNER JOIN AgeDivisions ON AgeDivisions.age_division_year = Participants.age_division_year INNER JOIN Genders ON Genders.gender_id = Participants.gender_id WHERE Participants.division_id = ?1 AND Participants.specialty_id = ?2 ORDER BY Participants.entry_time',
        variables: [
          Variable<int>(divisionId),
          Variable<int>(specialtyId)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          ageDivisions,
          genders,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsByDivisionAndSpecialtyResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        ageDivisionYear1: row.read<int>('age_division_year'),
        genderName: row.read<String>('gender_name'),
      );
    });
  }

  Selectable<SelectParticiapntsByClubResult> selectParticiapntsByClub(
      {required int clubId}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, AgeDivisions.age_division_year, Genders.gender_name, Clubs.club_name FROM Participants INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN AgeDivisions USING(age_division_year)INNER JOIN Genders USING(gender_id)INNER JOIN Clubs USING(club_id)WHERE Participants.club_id = ?1 ORDER BY Participants.entry_time',
        variables: [
          Variable<int>(clubId)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          ageDivisions,
          genders,
          clubs,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsByClubResult(
        participantId: row.read<int>('participant_id'),
        participantFirstName: row.read<String>('participant_first_name'),
        participantLastName: row.read<String>('participant_last_name'),
        entryTime: row.read<int>('entry_time'),
        birthDate: row.read<DateTime>('birth_date'),
        clubId: row.read<int>('club_id'),
        genderId: row.read<int>('gender_id'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        ageDivisionYear: row.read<int>('age_division_year'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        ageDivisionYear1: row.read<int>('age_division_year'),
        genderName: row.read<String>('gender_name'),
        clubName: row.read<String>('club_name'),
      );
    });
  }

  Selectable<AgeDivision> selectAgeDivisions() {
    return customSelect('SELECT * FROM AgeDivisions',
        variables: [],
        readsFrom: {
          ageDivisions,
        }).asyncMap(ageDivisions.mapFromRow);
  }

  Selectable<Club> selectClubs() {
    return customSelect('SELECT * FROM Clubs', variables: [], readsFrom: {
      clubs,
    }).asyncMap(clubs.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        divingSpecialties,
        divingDivisions,
        clubs,
        ageDivisions,
        genders,
        participants,
        scores,
        scoreIdx
      ];
}

class SelectCompetitionScoresResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  SelectCompetitionScoresResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
  });
}

class SelectCompetitionScoresBySpecialtyResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  SelectCompetitionScoresBySpecialtyResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
  });
}

class SelectCompetitionScoresByDivisionResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  SelectCompetitionScoresByDivisionResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
  });
}

class SelectCompetitionScoresByAgeResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  final String ageDivisionName;
  final String genderName;
  SelectCompetitionScoresByAgeResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
    required this.ageDivisionName,
    required this.genderName,
  });
}

class SelectCompetitionScoresBySpecialtyAndDivisionAndAgeResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  final String genderName;
  final String ageDivisionName;
  SelectCompetitionScoresBySpecialtyAndDivisionAndAgeResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
    required this.genderName,
    required this.ageDivisionName,
  });
}

class SelectCompetitionScoresBySpecialtyAndDivisionResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final int genderId;
  final DateTime scoreDate;
  final int score;
  final String specialtyName;
  final String divisionName;
  final String participantFirstName;
  final String participantLastName;
  SelectCompetitionScoresBySpecialtyAndDivisionResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.genderId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantFirstName,
    required this.participantLastName,
  });
}

class SearchParticipantsByIdResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  SearchParticipantsByIdResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
  });
}

class SelectParticiapntsResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  final int ageDivisionYear1;
  final String genderName;
  SelectParticiapntsResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
    required this.ageDivisionYear1,
    required this.genderName,
  });
}

class SelectParticiapnsBySpecialtyResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  final int ageDivisionYear1;
  final String genderName;
  SelectParticiapnsBySpecialtyResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
    required this.ageDivisionYear1,
    required this.genderName,
  });
}

class SelectParticiapntsByDivisionResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  final int ageDivisionYear1;
  final String genderName;
  SelectParticiapntsByDivisionResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
    required this.ageDivisionYear1,
    required this.genderName,
  });
}

class SelectParticiapntsByDivisionAndSpecialtyResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  final int ageDivisionYear1;
  final String genderName;
  SelectParticiapntsByDivisionAndSpecialtyResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
    required this.ageDivisionYear1,
    required this.genderName,
  });
}

class SelectParticiapntsByClubResult {
  final int participantId;
  final String participantFirstName;
  final String participantLastName;
  final int entryTime;
  final DateTime birthDate;
  final int clubId;
  final int genderId;
  final int divisionId;
  final int specialtyId;
  final int ageDivisionYear;
  final String specialtyName;
  final String divisionName;
  final int ageDivisionYear1;
  final String genderName;
  final String clubName;
  SelectParticiapntsByClubResult({
    required this.participantId,
    required this.participantFirstName,
    required this.participantLastName,
    required this.entryTime,
    required this.birthDate,
    required this.clubId,
    required this.genderId,
    required this.divisionId,
    required this.specialtyId,
    required this.ageDivisionYear,
    required this.specialtyName,
    required this.divisionName,
    required this.ageDivisionYear1,
    required this.genderName,
    required this.clubName,
  });
}
