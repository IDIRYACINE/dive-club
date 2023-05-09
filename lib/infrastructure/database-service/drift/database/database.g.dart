// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class DivingSpecialties extends Table
    with TableInfo<DivingSpecialties, DivingSpecialtie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingSpecialties(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'DivingSpecialties';
  @override
  String get actualTableName => 'DivingSpecialties';
  @override
  VerificationContext validateIntegrity(Insertable<DivingSpecialtie> instance,
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
  DivingSpecialtie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingSpecialtie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
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
  final int id;
  final String name;
  const DivingSpecialtie({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DivingSpecialtiesCompanion toCompanion(bool nullToAbsent) {
    return DivingSpecialtiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DivingSpecialtie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingSpecialtie(
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

  DivingSpecialtie copyWith({int? id, String? name}) => DivingSpecialtie(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DivingSpecialtie(')
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
      (other is DivingSpecialtie &&
          other.id == this.id &&
          other.name == this.name);
}

class DivingSpecialtiesCompanion extends UpdateCompanion<DivingSpecialtie> {
  final Value<int> id;
  final Value<String> name;
  const DivingSpecialtiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DivingSpecialtiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DivingSpecialtie> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DivingSpecialtiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DivingSpecialtiesCompanion(
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
    return (StringBuffer('DivingSpecialtiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class DivingCompetitions extends Table
    with TableInfo<DivingCompetitions, DivingCompetition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DivingCompetitions(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'DivingCompetitions';
  @override
  String get actualTableName => 'DivingCompetitions';
  @override
  VerificationContext validateIntegrity(Insertable<DivingCompetition> instance,
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
  DivingCompetition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DivingCompetition(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  DivingCompetitions createAlias(String alias) {
    return DivingCompetitions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DivingCompetition extends DataClass
    implements Insertable<DivingCompetition> {
  final int id;
  final String name;
  const DivingCompetition({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DivingCompetitionsCompanion toCompanion(bool nullToAbsent) {
    return DivingCompetitionsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory DivingCompetition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DivingCompetition(
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

  DivingCompetition copyWith({int? id, String? name}) => DivingCompetition(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('DivingCompetition(')
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
      (other is DivingCompetition &&
          other.id == this.id &&
          other.name == this.name);
}

class DivingCompetitionsCompanion extends UpdateCompanion<DivingCompetition> {
  final Value<int> id;
  final Value<String> name;
  const DivingCompetitionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DivingCompetitionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DivingCompetition> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DivingCompetitionsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DivingCompetitionsCompanion(
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
    return (StringBuffer('DivingCompetitionsCompanion(')
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
      'competition_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingCompetitions(id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingSpecialties(id)');
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
    } else if (isInserting) {
      context.missing(_competitionIdMeta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}competition_id'])!,
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
  final int id;
  final String participantName;
  final DateTime birthDate;
  final int competitionId;
  final int specialtyId;
  const Participant(
      {required this.id,
      required this.participantName,
      required this.birthDate,
      required this.competitionId,
      required this.specialtyId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['participant_name'] = Variable<String>(participantName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['competition_id'] = Variable<int>(competitionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    return map;
  }

  ParticipantsCompanion toCompanion(bool nullToAbsent) {
    return ParticipantsCompanion(
      id: Value(id),
      participantName: Value(participantName),
      birthDate: Value(birthDate),
      competitionId: Value(competitionId),
      specialtyId: Value(specialtyId),
    );
  }

  factory Participant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Participant(
      id: serializer.fromJson<int>(json['id']),
      participantName: serializer.fromJson<String>(json['participant_name']),
      birthDate: serializer.fromJson<DateTime>(json['birth_date']),
      competitionId: serializer.fromJson<int>(json['competition_id']),
      specialtyId: serializer.fromJson<int>(json['specialty_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'participant_name': serializer.toJson<String>(participantName),
      'birth_date': serializer.toJson<DateTime>(birthDate),
      'competition_id': serializer.toJson<int>(competitionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
    };
  }

  Participant copyWith(
          {int? id,
          String? participantName,
          DateTime? birthDate,
          int? competitionId,
          int? specialtyId}) =>
      Participant(
        id: id ?? this.id,
        participantName: participantName ?? this.participantName,
        birthDate: birthDate ?? this.birthDate,
        competitionId: competitionId ?? this.competitionId,
        specialtyId: specialtyId ?? this.specialtyId,
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
  final Value<int> competitionId;
  final Value<int> specialtyId;
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
    required int competitionId,
    required int specialtyId,
  })  : participantName = Value(participantName),
        birthDate = Value(birthDate),
        competitionId = Value(competitionId),
        specialtyId = Value(specialtyId);
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
      Value<int>? competitionId,
      Value<int>? specialtyId}) {
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
      'participant_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Participants(id)');
  static const VerificationMeta _competitionIdMeta =
      const VerificationMeta('competitionId');
  late final GeneratedColumn<int> competitionId = GeneratedColumn<int>(
      'competition_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingCompetitions(id)');
  static const VerificationMeta _specialtyIdMeta =
      const VerificationMeta('specialtyId');
  late final GeneratedColumn<int> specialtyId = GeneratedColumn<int>(
      'specialty_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES DivingSpecialties(id)');
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
    } else if (isInserting) {
      context.missing(_participantIdMeta);
    }
    if (data.containsKey('competition_id')) {
      context.handle(
          _competitionIdMeta,
          competitionId.isAcceptableOrUnknown(
              data['competition_id']!, _competitionIdMeta));
    } else if (isInserting) {
      context.missing(_competitionIdMeta);
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
      {participantId, competitionId, specialtyId};
  @override
  Score map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Score(
      participantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}participant_id'])!,
      competitionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}competition_id'])!,
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
      const ['PRIMARY KEY(participant_id, competition_id, specialty_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class Score extends DataClass implements Insertable<Score> {
  final int participantId;
  final int competitionId;
  final int specialtyId;
  final DateTime scoreDate;
  final double score;
  const Score(
      {required this.participantId,
      required this.competitionId,
      required this.specialtyId,
      required this.scoreDate,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['participant_id'] = Variable<int>(participantId);
    map['competition_id'] = Variable<int>(competitionId);
    map['specialty_id'] = Variable<int>(specialtyId);
    map['score_date'] = Variable<DateTime>(scoreDate);
    map['score'] = Variable<double>(score);
    return map;
  }

  ScoresCompanion toCompanion(bool nullToAbsent) {
    return ScoresCompanion(
      participantId: Value(participantId),
      competitionId: Value(competitionId),
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
      competitionId: serializer.fromJson<int>(json['competition_id']),
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
      'competition_id': serializer.toJson<int>(competitionId),
      'specialty_id': serializer.toJson<int>(specialtyId),
      'score_date': serializer.toJson<DateTime>(scoreDate),
      'score': serializer.toJson<double>(score),
    };
  }

  Score copyWith(
          {int? participantId,
          int? competitionId,
          int? specialtyId,
          DateTime? scoreDate,
          double? score}) =>
      Score(
        participantId: participantId ?? this.participantId,
        competitionId: competitionId ?? this.competitionId,
        specialtyId: specialtyId ?? this.specialtyId,
        scoreDate: scoreDate ?? this.scoreDate,
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
  final Value<int> participantId;
  final Value<int> competitionId;
  final Value<int> specialtyId;
  final Value<DateTime> scoreDate;
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
    required int participantId,
    required int competitionId,
    required int specialtyId,
    this.scoreDate = const Value.absent(),
    required double score,
    this.rowid = const Value.absent(),
  })  : participantId = Value(participantId),
        competitionId = Value(competitionId),
        specialtyId = Value(specialtyId),
        score = Value(score);
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
      {Value<int>? participantId,
      Value<int>? competitionId,
      Value<int>? specialtyId,
      Value<DateTime>? scoreDate,
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
  late final DivingSpecialties divingSpecialties = DivingSpecialties(this);
  late final DivingCompetitions divingCompetitions = DivingCompetitions(this);
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
      required int competitionId,
      required int specialtyId,
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

  Future<int> updateScore(
      {required double score,
      required int participantId,
      required int competitionId,
      required int specialtyId}) {
    return customUpdate(
      'UPDATE Scores SET score_date = CURRENT_DATE, score = ?1 WHERE participant_id = ?2 AND competition_id = ?3 AND specialty_id = ?4',
      variables: [
        Variable<double>(score),
        Variable<int>(participantId),
        Variable<int>(competitionId),
        Variable<int>(specialtyId)
      ],
      updates: {scores},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createDivingSpecialties({required String name}) {
    return customInsert(
      'INSERT INTO DivingSpecialties (name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingSpecialties},
    );
  }

  Future<int> updateDivingSpecialties({required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingSpecialties SET name = ?1 WHERE id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingSpecialties},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> createDivingCompetitions({required String name}) {
    return customInsert(
      'INSERT INTO DivingCompetitions (name) VALUES (?1)',
      variables: [Variable<String>(name)],
      updates: {divingCompetitions},
    );
  }

  Future<int> updateDivingCompetitions(
      {required String name, required int id}) {
    return customUpdate(
      'UPDATE DivingCompetitions SET name = ?1 WHERE id = ?2',
      variables: [Variable<String>(name), Variable<int>(id)],
      updates: {divingCompetitions},
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

  Selectable<DivingSpecialtie> selectDivingSpecialties() {
    return customSelect('SELECT * FROM DivingSpecialties',
        variables: [],
        readsFrom: {
          divingSpecialties,
        }).asyncMap(divingSpecialties.mapFromRow);
  }

  Selectable<DivingCompetition> selectDivingCompetitions() {
    return customSelect('SELECT * FROM DivingCompetitions',
        variables: [],
        readsFrom: {
          divingCompetitions,
        }).asyncMap(divingCompetitions.mapFromRow);
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

  Selectable<Participant> selectParticiapnts() {
    return customSelect('SELECT * FROM Participants',
        variables: [],
        readsFrom: {
          participants,
        }).asyncMap(participants.mapFromRow);
  }

  Selectable<Participant> selectParticiapnsBySpecialty({required int id}) {
    return customSelect('SELECT * FROM Participants WHERE specialty_id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          participants,
        }).asyncMap(participants.mapFromRow);
  }

  Selectable<Participant> selectParticiapntsByCompetition({required int id}) {
    return customSelect('SELECT * FROM Participants WHERE competition_id = ?1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          participants,
        }).asyncMap(participants.mapFromRow);
  }

  Selectable<Participant> selectParticiapntsByCompetitionAndSpecialty(
      {required int competitionId, required int specialtyId}) {
    return customSelect(
        'SELECT * FROM Participants WHERE competition_id = ?1 AND specialty_id = ?2',
        variables: [
          Variable<int>(competitionId),
          Variable<int>(specialtyId)
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
      [divingSpecialties, divingCompetitions, participants, scores, scoreIdx];
}
