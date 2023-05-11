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
  static const VerificationMeta _participantNameMeta =
      const VerificationMeta('participantName');
  late final GeneratedColumn<String> participantName = GeneratedColumn<String>(
      'participant_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  @override
  List<GeneratedColumn> get $columns =>
      [participantId, participantName, birthDate, divisionId, specialtyId];
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
    if (data.containsKey('participant_name')) {
      context.handle(
          _participantNameMeta,
          participantName.isAcceptableOrUnknown(
              data['participant_name']!, _participantNameMeta));
    } else if (isInserting) {
      context.missing(_participantNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
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
      participantName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}participant_name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      divisionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}division_id'])!,
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id'])!,
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
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  const Participant(
      {required this.participantId,
      required this.participantName,
      required this.birthDate,
      required this.divisionId,
      required this.specialtyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['participant_id'] = Variable<int>(participantId);
    map['participant_name'] = Variable<String>(participantName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['division_id'] = Variable<int>(divisionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    return map;
  }

  ParticipantsCompanion toCompanion(bool nullToAbsent) {
    return ParticipantsCompanion(
      participantId: Value(participantId),
      participantName: Value(participantName),
      birthDate: Value(birthDate),
      divisionId: Value(divisionId),
      specialtyId: Value(specialtyId),
    );
  }

  factory Participant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Participant(
      participantId: serializer.fromJson<int>(json['participant_id']),
      participantName: serializer.fromJson<String>(json['participant_name']),
      birthDate: serializer.fromJson<DateTime>(json['birth_date']),
      divisionId: serializer.fromJson<int>(json['division_id']),
      specialtyId: serializer.fromJson<int>(json['specialty_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'participant_id': serializer.toJson<int>(participantId),
      'participant_name': serializer.toJson<String>(participantName),
      'birth_date': serializer.toJson<DateTime>(birthDate),
      'division_id': serializer.toJson<int>(divisionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
    };
  }

  Participant copyWith(
          {int? participantId,
          String? participantName,
          DateTime? birthDate,
          int? divisionId,
          int? specialtyId}) =>
      Participant(
        participantId: participantId ?? this.participantId,
        participantName: participantName ?? this.participantName,
        birthDate: birthDate ?? this.birthDate,
        divisionId: divisionId ?? this.divisionId,
        specialtyId: specialtyId ?? this.specialtyId,
      );
  @override
  String toString() {
    return (StringBuffer('Participant(')
          ..write('participantId: $participantId, ')
          ..write('participantName: $participantName, ')
          ..write('birthDate: $birthDate, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      participantId, participantName, birthDate, divisionId, specialtyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Participant &&
          other.participantId == this.participantId &&
          other.participantName == this.participantName &&
          other.birthDate == this.birthDate &&
          other.divisionId == this.divisionId &&
          other.specialtyId == this.specialtyId);
}

class ParticipantsCompanion extends UpdateCompanion<Participant> {
  final Value<int> participantId;
  final Value<String> participantName;
  final Value<DateTime> birthDate;
  final Value<int> divisionId;
  final Value<int> specialtyId;
  const ParticipantsCompanion({
    this.participantId = const Value.absent(),
    this.participantName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
  });
  ParticipantsCompanion.insert({
    this.participantId = const Value.absent(),
    required String participantName,
    required DateTime birthDate,
    required int divisionId,
    required int specialtyId,
  })  : participantName = Value(participantName),
        birthDate = Value(birthDate),
        divisionId = Value(divisionId),
        specialtyId = Value(specialtyId);
  static Insertable<Participant> custom({
    Expression<int>? participantId,
    Expression<String>? participantName,
    Expression<DateTime>? birthDate,
    Expression<int>? divisionId,
    Expression<int>? specialtyId,
  }) {
    return RawValuesInsertable({
      if (participantId != null) 'participant_id': participantId,
      if (participantName != null) 'participant_name': participantName,
      if (birthDate != null) 'birth_date': birthDate,
      if (divisionId != null) 'division_id': divisionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
    });
  }

  ParticipantsCompanion copyWith(
      {Value<int>? participantId,
      Value<String>? participantName,
      Value<DateTime>? birthDate,
      Value<int>? divisionId,
      Value<int>? specialtyId}) {
    return ParticipantsCompanion(
      participantId: participantId ?? this.participantId,
      participantName: participantName ?? this.participantName,
      birthDate: birthDate ?? this.birthDate,
      divisionId: divisionId ?? this.divisionId,
      specialtyId: specialtyId ?? this.specialtyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (participantId.present) {
      map['participant_id'] = Variable<int>(participantId.value);
    }
    if (participantName.present) {
      map['participant_name'] = Variable<String>(participantName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (divisionId.present) {
      map['division_id'] = Variable<int>(divisionId.value);
    }
    if (specialtyId.present) {
      map['specialty_id'] = Variable<int>(specialtyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantsCompanion(')
          ..write('participantId: $participantId, ')
          ..write('participantName: $participantName, ')
          ..write('birthDate: $birthDate, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId')
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
  static const VerificationMeta _scoreDateMeta =
      const VerificationMeta('scoreDate');
  late final GeneratedColumn<DateTime> scoreDate = GeneratedColumn<DateTime>(
      'score_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_DATE',
      defaultValue: const CustomExpression('CURRENT_DATE'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [participantId, divisionId, specialtyId, scoreDate, score];
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
      {participantId, divisionId, specialtyId};
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
      scoreDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}score_date'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score'])!,
    );
  }

  @override
  Scores createAlias(String alias) {
    return Scores(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY(participant_id, division_id, specialty_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class Score extends DataClass implements Insertable<Score> {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final DateTime scoreDate;
  final double score;
  const Score(
      {required this.participantId,
      required this.divisionId,
      required this.specialtyId,
      required this.scoreDate,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['participant_id'] = Variable<int>(participantId);
    map['division_id'] = Variable<int>(divisionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    map['score_date'] = Variable<DateTime>(scoreDate);
    map['score'] = Variable<double>(score);
    return map;
  }

  ScoresCompanion toCompanion(bool nullToAbsent) {
    return ScoresCompanion(
      participantId: Value(participantId),
      divisionId: Value(divisionId),
      specialtyId: Value(specialtyId),
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
      scoreDate: serializer.fromJson<DateTime>(json['score_date']),
      score: serializer.fromJson<double>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'participant_id': serializer.toJson<int>(participantId),
      'division_id': serializer.toJson<int>(divisionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
      'score_date': serializer.toJson<DateTime>(scoreDate),
      'score': serializer.toJson<double>(score),
    };
  }

  Score copyWith(
          {int? participantId,
          int? divisionId,
          int? specialtyId,
          DateTime? scoreDate,
          double? score}) =>
      Score(
        participantId: participantId ?? this.participantId,
        divisionId: divisionId ?? this.divisionId,
        specialtyId: specialtyId ?? this.specialtyId,
        scoreDate: scoreDate ?? this.scoreDate,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('Score(')
          ..write('participantId: $participantId, ')
          ..write('divisionId: $divisionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('scoreDate: $scoreDate, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(participantId, divisionId, specialtyId, scoreDate, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Score &&
          other.participantId == this.participantId &&
          other.divisionId == this.divisionId &&
          other.specialtyId == this.specialtyId &&
          other.scoreDate == this.scoreDate &&
          other.score == this.score);
}

class ScoresCompanion extends UpdateCompanion<Score> {
  final Value<int> participantId;
  final Value<int> divisionId;
  final Value<int> specialtyId;
  final Value<DateTime> scoreDate;
  final Value<double> score;
  final Value<int> rowid;
  const ScoresCompanion({
    this.participantId = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
    this.scoreDate = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScoresCompanion.insert({
    required int participantId,
    required int divisionId,
    required int specialtyId,
    this.scoreDate = const Value.absent(),
    required double score,
    this.rowid = const Value.absent(),
  })  : participantId = Value(participantId),
        divisionId = Value(divisionId),
        specialtyId = Value(specialtyId),
        score = Value(score);
  static Insertable<Score> custom({
    Expression<int>? participantId,
    Expression<int>? divisionId,
    Expression<int>? specialtyId,
    Expression<DateTime>? scoreDate,
    Expression<double>? score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (participantId != null) 'participant_id': participantId,
      if (divisionId != null) 'division_id': divisionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
      if (scoreDate != null) 'score_date': scoreDate,
      if (score != null) 'score': score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScoresCompanion copyWith(
      {Value<int>? participantId,
      Value<int>? divisionId,
      Value<int>? specialtyId,
      Value<DateTime>? scoreDate,
      Value<double>? score,
      Value<int>? rowid}) {
    return ScoresCompanion(
      participantId: participantId ?? this.participantId,
      divisionId: divisionId ?? this.divisionId,
      specialtyId: specialtyId ?? this.specialtyId,
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
    if (scoreDate.present) {
      map['score_date'] = Variable<DateTime>(scoreDate.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
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
  late final Participants participants = Participants(this);
  late final Scores scores = Scores(this);
  late final Index scoreIdx =
      Index('score_idx', 'CREATE INDEX score_idx ON Scores (score)');
  Future<int> createParticipant(
      {required String name,
      required DateTime birthDate,
      required int divisionId,
      required int specialtyId}) {
    return customInsert(
      'INSERT INTO Participants (participant_name, birth_date, division_id, specialty_id) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(birthDate),
        Variable<int>(divisionId),
        Variable<int>(specialtyId)
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
      'UPDATE Participants SET participant_name = ?1, birth_date = ?2, division_id = ?3, specialty_id = ?4 WHERE participant_id = ?5',
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
      required double score,
      required int divisionId,
      required int specialtyId}) {
    return customInsert(
      'INSERT OR REPLACE INTO Scores (participant_id, score_date, score, division_id, specialty_id) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(participantId),
        Variable<DateTime>(date),
        Variable<double>(score),
        Variable<int>(divisionId),
        Variable<int>(specialtyId)
      ],
      updates: {scores},
    );
  }

  Future<int> updateScore(
      {required double score,
      required int participantId,
      required int divisionId,
      required int specialtyId}) {
    return customUpdate(
      'UPDATE Scores SET score_date = CURRENT_DATE, score = ?1 WHERE participant_id = ?2 AND division_id = ?3 AND specialty_id = ?4',
      variables: [
        Variable<double>(score),
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

  Selectable<SelectCompetitionScoresResult> selectCompetitionScores() {
    return customSelect(
        'SELECT Scores.*, DivingSpecialties.specialty_name, DivingDivisions.division_name, Participants.participant_name FROM Scores INNER JOIN DivingSpecialties USING(specialty_id)INNER JOIN DivingDivisions USING(division_id)INNER JOIN Participants USING(participant_id)ORDER BY score DESC',
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
        scoreDate: row.read<DateTime>('score_date'),
        score: row.read<double>('score'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
        participantName: row.read<String>('participant_name'),
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

  Selectable<SearchParticipantsByNameResult> searchParticipantsByName(
      {required String name}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id WHERE participant_name LIKE ?1',
        variables: [
          Variable<String>(name)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SearchParticipantsByNameResult(
        participantId: row.read<int>('participant_id'),
        participantName: row.read<String>('participant_name'),
        birthDate: row.read<DateTime>('birth_date'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  Selectable<SelectParticiapntsResult> selectParticiapnts() {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id',
        variables: [],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsResult(
        participantId: row.read<int>('participant_id'),
        participantName: row.read<String>('participant_name'),
        birthDate: row.read<DateTime>('birth_date'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  Selectable<SelectParticiapnsBySpecialtyResult> selectParticiapnsBySpecialty(
      {required int id}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id WHERE Participants.specialty_id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapnsBySpecialtyResult(
        participantId: row.read<int>('participant_id'),
        participantName: row.read<String>('participant_name'),
        birthDate: row.read<DateTime>('birth_date'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  Selectable<SelectParticiapntsByDivisionResult> selectParticiapntsByDivision(
      {required int id}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id WHERE Participants.division_id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsByDivisionResult(
        participantId: row.read<int>('participant_id'),
        participantName: row.read<String>('participant_name'),
        birthDate: row.read<DateTime>('birth_date'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  Selectable<SelectParticiapntsByDivisionAndSpecialtyResult>
      selectParticiapntsByDivisionAndSpecialty(
          {required int divisionId, required int specialtyId}) {
    return customSelect(
        'SELECT Participants.*, DivingSpecialties.specialty_name, DivingDivisions.division_name FROM Participants INNER JOIN DivingSpecialties ON DivingSpecialties.specialty_id = Participants.specialty_id INNER JOIN DivingDivisions ON DivingDivisions.division_id = Participants.division_id WHERE Participants.division_id = ?1 AND Participants.specialty_id = ?2',
        variables: [
          Variable<int>(divisionId),
          Variable<int>(specialtyId)
        ],
        readsFrom: {
          divingSpecialties,
          divingDivisions,
          participants,
        }).map((QueryRow row) {
      return SelectParticiapntsByDivisionAndSpecialtyResult(
        participantId: row.read<int>('participant_id'),
        participantName: row.read<String>('participant_name'),
        birthDate: row.read<DateTime>('birth_date'),
        divisionId: row.read<int>('division_id'),
        specialtyId: row.read<int>('specialty_id'),
        specialtyName: row.read<String>('specialty_name'),
        divisionName: row.read<String>('division_name'),
      );
    });
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [divingSpecialties, divingDivisions, participants, scores, scoreIdx];
}

class SelectCompetitionScoresResult {
  final int participantId;
  final int divisionId;
  final int specialtyId;
  final DateTime scoreDate;
  final double score;
  final String specialtyName;
  final String divisionName;
  final String participantName;
  SelectCompetitionScoresResult({
    required this.participantId,
    required this.divisionId,
    required this.specialtyId,
    required this.scoreDate,
    required this.score,
    required this.specialtyName,
    required this.divisionName,
    required this.participantName,
  });
}

class SearchParticipantsByNameResult {
  final int participantId;
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  final String specialtyName;
  final String divisionName;
  SearchParticipantsByNameResult({
    required this.participantId,
    required this.participantName,
    required this.birthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.specialtyName,
    required this.divisionName,
  });
}

class SelectParticiapntsResult {
  final int participantId;
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  final String specialtyName;
  final String divisionName;
  SelectParticiapntsResult({
    required this.participantId,
    required this.participantName,
    required this.birthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.specialtyName,
    required this.divisionName,
  });
}

class SelectParticiapnsBySpecialtyResult {
  final int participantId;
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  final String specialtyName;
  final String divisionName;
  SelectParticiapnsBySpecialtyResult({
    required this.participantId,
    required this.participantName,
    required this.birthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.specialtyName,
    required this.divisionName,
  });
}

class SelectParticiapntsByDivisionResult {
  final int participantId;
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  final String specialtyName;
  final String divisionName;
  SelectParticiapntsByDivisionResult({
    required this.participantId,
    required this.participantName,
    required this.birthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.specialtyName,
    required this.divisionName,
  });
}

class SelectParticiapntsByDivisionAndSpecialtyResult {
  final int participantId;
  final String participantName;
  final DateTime birthDate;
  final int divisionId;
  final int specialtyId;
  final String specialtyName;
  final String divisionName;
  SelectParticiapntsByDivisionAndSpecialtyResult({
    required this.participantId,
    required this.participantName,
    required this.birthDate,
    required this.divisionId,
    required this.specialtyId,
    required this.specialtyName,
    required this.divisionName,
  });
}
