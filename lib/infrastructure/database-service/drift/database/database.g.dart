// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class DivingSpecialty extends Table
    with TableInfo<DivingSpecialty, DivingSpecialtyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingSpecialty(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'DivingSpecialty';
  @override
  String get actualTableName => 'DivingSpecialty';
  @override
  VerificationContext validateIntegrity(
      Insertable<DivingSpecialtyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DivingSpecialtyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingSpecialtyData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  DivingSpecialty createAlias(String alias) {
    return DivingSpecialty(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DivingSpecialtyData extends DataClass
    implements Insertable<DivingSpecialtyData> {
  final int id;
  final String name;
  const DivingSpecialtyData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DivingSpecialtyCompanion toCompanion(bool nullToAbsent) {
    return DivingSpecialtyCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DivingSpecialtyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingSpecialtyData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DivingSpecialtyData copyWith({int? id, String? name}) => DivingSpecialtyData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DivingSpecialtyData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DivingSpecialtyData &&
          other.id == this.id &&
          other.name == this.name);
}

class DivingSpecialtyCompanion extends UpdateCompanion<DivingSpecialtyData> {
  final Value<int> id;
  final Value<String> name;
  const DivingSpecialtyCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DivingSpecialtyCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DivingSpecialtyData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DivingSpecialtyCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DivingSpecialtyCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivingSpecialtyCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class DivingCompetition extends Table
    with TableInfo<DivingCompetition, DivingCompetitionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingCompetition(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'DivingCompetition';
  @override
  String get actualTableName => 'DivingCompetition';
  @override
  VerificationContext validateIntegrity(
      Insertable<DivingCompetitionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DivingCompetitionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingCompetitionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  DivingCompetition createAlias(String alias) {
    return DivingCompetition(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DivingCompetitionData extends DataClass
    implements Insertable<DivingCompetitionData> {
  final int id;
  final String name;
  const DivingCompetitionData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DivingCompetitionCompanion toCompanion(bool nullToAbsent) {
    return DivingCompetitionCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DivingCompetitionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingCompetitionData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DivingCompetitionData copyWith({int? id, String? name}) =>
      DivingCompetitionData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DivingCompetitionData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DivingCompetitionData &&
          other.id == this.id &&
          other.name == this.name);
}

class DivingCompetitionCompanion
    extends UpdateCompanion<DivingCompetitionData> {
  final Value<int> id;
  final Value<String> name;
  const DivingCompetitionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DivingCompetitionCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DivingCompetitionData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DivingCompetitionCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DivingCompetitionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DivingCompetitionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Participants extends Table with TableInfo<Participants, Participant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Participants(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
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
  static const VerificationMeta _competitionIdMeta =
      const VerificationMeta('competitionId');
  late final GeneratedColumn<int> competitionId = GeneratedColumn<int>(
      'competition_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES DivingCompetition(id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES DivingSpecialty(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, participantName, birthDate, competitionId, specialtyId];
  @override
  String get aliasedName => _alias ?? 'Participants';
  @override
  String get actualTableName => 'Participants';
  @override
  VerificationContext validateIntegrity(Insertable<Participant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('competition_id')) {
      context.handle(
          _competitionIdMeta,
          competitionId.isAcceptableOrUnknown(
              data['competition_id']!, _competitionIdMeta));
    }
    if (data.containsKey('specialty_id')) {
      context.handle(
          _specialtyIdMeta,
          specialtyId.isAcceptableOrUnknown(
              data['specialty_id']!, _specialtyIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Participant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Participant(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      participantName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}participant_name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      competitionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}competition_id']),
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id']),
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
  final int id;
  final String participantName;
  final DateTime birthDate;
  final int? competitionId;
  final int? specialtyId;
  const Participant(
      {required this.id,
      required this.participantName,
      required this.birthDate,
      this.competitionId,
      this.specialtyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['participant_name'] = Variable<String>(participantName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    if (!nullToAbsent || competitionId != null) {
      map['competition_id'] = Variable<int>(competitionId);
    }
    if (!nullToAbsent || specialtyId != null) {
      map['specialty_id'] = Variable<int>(specialtyId);
    }
    return map;
  }

  ParticipantsCompanion toCompanion(bool nullToAbsent) {
    return ParticipantsCompanion(
      id: Value(id),
      participantName: Value(participantName),
      birthDate: Value(birthDate),
      competitionId: competitionId == null && nullToAbsent
          ? const Value.absent()
          : Value(competitionId),
      specialtyId: specialtyId == null && nullToAbsent
          ? const Value.absent()
          : Value(specialtyId),
    );
  }

  factory Participant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Participant(
      id: serializer.fromJson<int>(json['id']),
      participantName: serializer.fromJson<String>(json['participant_name']),
      birthDate: serializer.fromJson<DateTime>(json['birth_date']),
      competitionId: serializer.fromJson<int?>(json['competition_id']),
      specialtyId: serializer.fromJson<int?>(json['specialty_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'participant_name': serializer.toJson<String>(participantName),
      'birth_date': serializer.toJson<DateTime>(birthDate),
      'competition_id': serializer.toJson<int?>(competitionId),
      'specialty_id': serializer.toJson<int?>(specialtyId),
    };
  }

  Participant copyWith(
          {int? id,
          String? participantName,
          DateTime? birthDate,
          Value<int?> competitionId = const Value.absent(),
          Value<int?> specialtyId = const Value.absent()}) =>
      Participant(
        id: id ?? this.id,
        participantName: participantName ?? this.participantName,
        birthDate: birthDate ?? this.birthDate,
        competitionId:
            competitionId.present ? competitionId.value : this.competitionId,
        specialtyId: specialtyId.present ? specialtyId.value : this.specialtyId,
      );
  @override
  String toString() {
    return (StringBuffer('Participant(')
          ..write('id: $id, ')
          ..write('participantName: $participantName, ')
          ..write('birthDate: $birthDate, ')
          ..write('competitionId: $competitionId, ')
          ..write('specialtyId: $specialtyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, participantName, birthDate, competitionId, specialtyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Participant &&
          other.id == this.id &&
          other.participantName == this.participantName &&
          other.birthDate == this.birthDate &&
          other.competitionId == this.competitionId &&
          other.specialtyId == this.specialtyId);
}

class ParticipantsCompanion extends UpdateCompanion<Participant> {
  final Value<int> id;
  final Value<String> participantName;
  final Value<DateTime> birthDate;
  final Value<int?> competitionId;
  final Value<int?> specialtyId;
  const ParticipantsCompanion({
    this.id = const Value.absent(),
    this.participantName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.competitionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
  });
  ParticipantsCompanion.insert({
    this.id = const Value.absent(),
    required String participantName,
    required DateTime birthDate,
    this.competitionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
  })  : participantName = Value(participantName),
        birthDate = Value(birthDate);
  static Insertable<Participant> custom({
    Expression<int>? id,
    Expression<String>? participantName,
    Expression<DateTime>? birthDate,
    Expression<int>? competitionId,
    Expression<int>? specialtyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (participantName != null) 'participant_name': participantName,
      if (birthDate != null) 'birth_date': birthDate,
      if (competitionId != null) 'competition_id': competitionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
    });
  }

  ParticipantsCompanion copyWith(
      {Value<int>? id,
      Value<String>? participantName,
      Value<DateTime>? birthDate,
      Value<int?>? competitionId,
      Value<int?>? specialtyId}) {
    return ParticipantsCompanion(
      id: id ?? this.id,
      participantName: participantName ?? this.participantName,
      birthDate: birthDate ?? this.birthDate,
      competitionId: competitionId ?? this.competitionId,
      specialtyId: specialtyId ?? this.specialtyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (participantName.present) {
      map['participant_name'] = Variable<String>(participantName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (competitionId.present) {
      map['competition_id'] = Variable<int>(competitionId.value);
    }
    if (specialtyId.present) {
      map['specialty_id'] = Variable<int>(specialtyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantsCompanion(')
          ..write('id: $id, ')
          ..write('participantName: $participantName, ')
          ..write('birthDate: $birthDate, ')
          ..write('competitionId: $competitionId, ')
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
      'participant_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES Participants(id)');
  static const VerificationMeta _competitionIdMeta =
      const VerificationMeta('competitionId');
  late final GeneratedColumn<int> competitionId = GeneratedColumn<int>(
      'competition_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES DivingCompetition(id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES DivingSpecialty(id)');
  static const VerificationMeta _scoreDateMeta =
      const VerificationMeta('scoreDate');
  late final GeneratedColumn<DateTime> scoreDate = GeneratedColumn<DateTime>(
      'score_date', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT CURRENT_DATE',
      defaultValue: const CustomExpression('CURRENT_DATE'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [participantId, competitionId, specialtyId, scoreDate, score];
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
    }
    if (data.containsKey('competition_id')) {
      context.handle(
          _competitionIdMeta,
          competitionId.isAcceptableOrUnknown(
              data['competition_id']!, _competitionIdMeta));
    }
    if (data.containsKey('specialty_id')) {
      context.handle(
          _specialtyIdMeta,
          specialtyId.isAcceptableOrUnknown(
              data['specialty_id']!, _specialtyIdMeta));
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
      {participantId, competitionId, specialtyId};
  @override
  Score map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Score(
      participantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participant_id']),
      competitionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}competition_id']),
      specialtyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}specialty_id']),
      scoreDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}score_date']),
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
      const ['PRIMARY KEY(participant_id, competition_id, specialty_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class Score extends DataClass implements Insertable<Score> {
  final int? participantId;
  final int? competitionId;
  final int? specialtyId;
  final DateTime? scoreDate;
  final double score;
  const Score(
      {this.participantId,
      this.competitionId,
      this.specialtyId,
      this.scoreDate,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || participantId != null) {
      map['participant_id'] = Variable<int>(participantId);
    }
    if (!nullToAbsent || competitionId != null) {
      map['competition_id'] = Variable<int>(competitionId);
    }
    if (!nullToAbsent || specialtyId != null) {
      map['specialty_id'] = Variable<int>(specialtyId);
    }
    if (!nullToAbsent || scoreDate != null) {
      map['score_date'] = Variable<DateTime>(scoreDate);
    }
    map['score'] = Variable<double>(score);
    return map;
  }

  ScoresCompanion toCompanion(bool nullToAbsent) {
    return ScoresCompanion(
      participantId: participantId == null && nullToAbsent
          ? const Value.absent()
          : Value(participantId),
      competitionId: competitionId == null && nullToAbsent
          ? const Value.absent()
          : Value(competitionId),
      specialtyId: specialtyId == null && nullToAbsent
          ? const Value.absent()
          : Value(specialtyId),
      scoreDate: scoreDate == null && nullToAbsent
          ? const Value.absent()
          : Value(scoreDate),
      score: Value(score),
    );
  }

  factory Score.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Score(
      participantId: serializer.fromJson<int?>(json['participant_id']),
      competitionId: serializer.fromJson<int?>(json['competition_id']),
      specialtyId: serializer.fromJson<int?>(json['specialty_id']),
      scoreDate: serializer.fromJson<DateTime?>(json['score_date']),
      score: serializer.fromJson<double>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'participant_id': serializer.toJson<int?>(participantId),
      'competition_id': serializer.toJson<int?>(competitionId),
      'specialty_id': serializer.toJson<int?>(specialtyId),
      'score_date': serializer.toJson<DateTime?>(scoreDate),
      'score': serializer.toJson<double>(score),
    };
  }

  Score copyWith(
          {Value<int?> participantId = const Value.absent(),
          Value<int?> competitionId = const Value.absent(),
          Value<int?> specialtyId = const Value.absent(),
          Value<DateTime?> scoreDate = const Value.absent(),
          double? score}) =>
      Score(
        participantId:
            participantId.present ? participantId.value : this.participantId,
        competitionId:
            competitionId.present ? competitionId.value : this.competitionId,
        specialtyId: specialtyId.present ? specialtyId.value : this.specialtyId,
        scoreDate: scoreDate.present ? scoreDate.value : this.scoreDate,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('Score(')
          ..write('participantId: $participantId, ')
          ..write('competitionId: $competitionId, ')
          ..write('specialtyId: $specialtyId, ')
          ..write('scoreDate: $scoreDate, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(participantId, competitionId, specialtyId, scoreDate, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Score &&
          other.participantId == this.participantId &&
          other.competitionId == this.competitionId &&
          other.specialtyId == this.specialtyId &&
          other.scoreDate == this.scoreDate &&
          other.score == this.score);
}

class ScoresCompanion extends UpdateCompanion<Score> {
  final Value<int?> participantId;
  final Value<int?> competitionId;
  final Value<int?> specialtyId;
  final Value<DateTime?> scoreDate;
  final Value<double> score;
  final Value<int> rowid;
  const ScoresCompanion({
    this.participantId = const Value.absent(),
    this.competitionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
    this.scoreDate = const Value.absent(),
    this.score = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScoresCompanion.insert({
    this.participantId = const Value.absent(),
    this.competitionId = const Value.absent(),
    this.specialtyId = const Value.absent(),
    this.scoreDate = const Value.absent(),
    required double score,
    this.rowid = const Value.absent(),
  }) : score = Value(score);
  static Insertable<Score> custom({
    Expression<int>? participantId,
    Expression<int>? competitionId,
    Expression<int>? specialtyId,
    Expression<DateTime>? scoreDate,
    Expression<double>? score,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (participantId != null) 'participant_id': participantId,
      if (competitionId != null) 'competition_id': competitionId,
      if (specialtyId != null) 'specialty_id': specialtyId,
      if (scoreDate != null) 'score_date': scoreDate,
      if (score != null) 'score': score,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScoresCompanion copyWith(
      {Value<int?>? participantId,
      Value<int?>? competitionId,
      Value<int?>? specialtyId,
      Value<DateTime?>? scoreDate,
      Value<double>? score,
      Value<int>? rowid}) {
    return ScoresCompanion(
      participantId: participantId ?? this.participantId,
      competitionId: competitionId ?? this.competitionId,
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
    if (competitionId.present) {
      map['competition_id'] = Variable<int>(competitionId.value);
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
          ..write('competitionId: $competitionId, ')
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
  late final DivingSpecialty divingSpecialty = DivingSpecialty(this);
  late final DivingCompetition divingCompetition = DivingCompetition(this);
  late final Participants participants = Participants(this);
  late final Scores scores = Scores(this);
  late final Index scoreIdx =
      Index('score_idx', 'CREATE INDEX score_idx ON Scores (score)');
  Future<int> createParticipant(
      {required String name,
      required DateTime birthDate,
      required int competitionId,
      required int specialtyId}) {
    return customInsert(
      'INSERT INTO Participants (participant_name, birth_date, competition_id, specialty_id) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(birthDate),
        Variable<int>(competitionId),
        Variable<int>(specialtyId)
      ],
      updates: {participants},
    );
  }

  Future<int> updateParticipant(
      {required String name,
      required DateTime birthDate,
      required int? competitionId,
      required int? specialtyId,
      required int id}) {
    return customUpdate(
      'UPDATE Participants SET participant_name = ?1, birth_date = ?2, competition_id = ?3, specialty_id = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(birthDate),
        Variable<int>(competitionId),
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
      required int competitionId,
      required int specialtyId}) {
    return customInsert(
      'INSERT OR REPLACE INTO Scores (participant_id, score_date, score, competition_id, specialty_id) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(participantId),
        Variable<DateTime>(date),
        Variable<double>(score),
        Variable<int>(competitionId),
        Variable<int>(specialtyId)
      ],
      updates: {scores},
    );
  }

  Future<int> createDivingSpecialty({required String name}) {
    return customInsert(
      'INSERT INTO DivingSpecialty (name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingSpecialty},
    );
  }

  Future<int> updateDivingSpecialty({required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingSpecialty SET name = ?1 WHERE id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingSpecialty},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createDivingCompetition({required String name}) {
    return customInsert(
      'INSERT INTO DivingCompetition (name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingCompetition},
    );
  }

  Future<int> updateDivingCompetition({required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingCompetition SET name = ?1 WHERE id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingCompetition},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Score> selectCompetitionScores() {
    return customSelect('SELECT * FROM Scores ORDER BY score DESC',
        variables: [],
        readsFrom: {
          scores,
        }).asyncMap(scores.mapFromRow);
  }

  Selectable<DivingSpecialtyData> selectDivingSpecialties() {
    return customSelect('SELECT * FROM DivingSpecialty',
        variables: [],
        readsFrom: {
          divingSpecialty,
        }).asyncMap(divingSpecialty.mapFromRow);
  }

  Selectable<DivingCompetitionData> selectDivingCompetitions() {
    return customSelect('SELECT * FROM DivingCompetition',
        variables: [],
        readsFrom: {
          divingCompetition,
        }).asyncMap(divingCompetition.mapFromRow);
  }

  Selectable<Participant> searchParticipantsByName({required String name}) {
    return customSelect(
        'SELECT * FROM Participants WHERE participant_name LIKE ?1',
        variables: [
          Variable<String>(name)
        ],
        readsFrom: {
          participants,
        }).asyncMap(participants.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [divingSpecialty, divingCompetition, participants, scores, scoreIdx];
}
