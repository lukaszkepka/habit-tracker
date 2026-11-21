// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HabitDefinitionsTable extends HabitDefinitions
    with TableInfo<$HabitDefinitionsTable, HabitDefinitionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _frequencyCountMeta = const VerificationMeta(
    'frequencyCount',
  );
  @override
  late final GeneratedColumn<int> frequencyCount = GeneratedColumn<int>(
    'frequency_count',
    aliasedName,
    false,
    check: () => ComparableExpr(frequencyCount).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FrequencyPeriod, String>
  frequencyPeriod =
      GeneratedColumn<String>(
        'frequency_period',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FrequencyPeriod>(
        $HabitDefinitionsTable.$converterfrequencyPeriod,
      );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notificationTimeMinutesMeta =
      const VerificationMeta('notificationTimeMinutes');
  @override
  late final GeneratedColumn<int> notificationTimeMinutes =
      GeneratedColumn<int>(
        'notification_time_minutes',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastRecordedAtMeta = const VerificationMeta(
    'lastRecordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastRecordedAt =
      GeneratedColumn<DateTime>(
        'last_recorded_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    frequencyCount,
    frequencyPeriod,
    startDate,
    endDate,
    notificationTimeMinutes,
    sortOrder,
    lastRecordedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_definitions';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitDefinitionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('frequency_count')) {
      context.handle(
        _frequencyCountMeta,
        frequencyCount.isAcceptableOrUnknown(
          data['frequency_count']!,
          _frequencyCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_frequencyCountMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('notification_time_minutes')) {
      context.handle(
        _notificationTimeMinutesMeta,
        notificationTimeMinutes.isAcceptableOrUnknown(
          data['notification_time_minutes']!,
          _notificationTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('last_recorded_at')) {
      context.handle(
        _lastRecordedAtMeta,
        lastRecordedAt.isAcceptableOrUnknown(
          data['last_recorded_at']!,
          _lastRecordedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitDefinitionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitDefinitionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      frequencyCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}frequency_count'],
      )!,
      frequencyPeriod: $HabitDefinitionsTable.$converterfrequencyPeriod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}frequency_period'],
        )!,
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      notificationTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_time_minutes'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      lastRecordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_recorded_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $HabitDefinitionsTable createAlias(String alias) {
    return $HabitDefinitionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FrequencyPeriod, String, String>
  $converterfrequencyPeriod = const EnumNameConverter<FrequencyPeriod>(
    FrequencyPeriod.values,
  );
}

class HabitDefinitionRow extends DataClass
    implements Insertable<HabitDefinitionRow> {
  final int id;
  final String name;
  final String description;

  /// Habit should be logged [frequencyCount] times per [frequencyPeriod].
  final int frequencyCount;
  final FrequencyPeriod frequencyPeriod;
  final DateTime startDate;
  final DateTime? endDate;

  /// Minutes since midnight for the reminder; null = no notification.
  final int? notificationTimeMinutes;

  /// Position in the user-ordered habit list.
  final int sortOrder;

  /// Most recent log date for this habit. Updated when logging occurs.
  final DateTime? lastRecordedAt;
  final DateTime createdAt;
  const HabitDefinitionRow({
    required this.id,
    required this.name,
    required this.description,
    required this.frequencyCount,
    required this.frequencyPeriod,
    required this.startDate,
    this.endDate,
    this.notificationTimeMinutes,
    required this.sortOrder,
    this.lastRecordedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['frequency_count'] = Variable<int>(frequencyCount);
    {
      map['frequency_period'] = Variable<String>(
        $HabitDefinitionsTable.$converterfrequencyPeriod.toSql(frequencyPeriod),
      );
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || notificationTimeMinutes != null) {
      map['notification_time_minutes'] = Variable<int>(notificationTimeMinutes);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || lastRecordedAt != null) {
      map['last_recorded_at'] = Variable<DateTime>(lastRecordedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return HabitDefinitionsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      frequencyCount: Value(frequencyCount),
      frequencyPeriod: Value(frequencyPeriod),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      notificationTimeMinutes: notificationTimeMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationTimeMinutes),
      sortOrder: Value(sortOrder),
      lastRecordedAt: lastRecordedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastRecordedAt),
      createdAt: Value(createdAt),
    );
  }

  factory HabitDefinitionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitDefinitionRow(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      frequencyCount: serializer.fromJson<int>(json['frequencyCount']),
      frequencyPeriod: $HabitDefinitionsTable.$converterfrequencyPeriod
          .fromJson(serializer.fromJson<String>(json['frequencyPeriod'])),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      notificationTimeMinutes: serializer.fromJson<int?>(
        json['notificationTimeMinutes'],
      ),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      lastRecordedAt: serializer.fromJson<DateTime?>(json['lastRecordedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'frequencyCount': serializer.toJson<int>(frequencyCount),
      'frequencyPeriod': serializer.toJson<String>(
        $HabitDefinitionsTable.$converterfrequencyPeriod.toJson(
          frequencyPeriod,
        ),
      ),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'notificationTimeMinutes': serializer.toJson<int?>(
        notificationTimeMinutes,
      ),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'lastRecordedAt': serializer.toJson<DateTime?>(lastRecordedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitDefinitionRow copyWith({
    int? id,
    String? name,
    String? description,
    int? frequencyCount,
    FrequencyPeriod? frequencyPeriod,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<int?> notificationTimeMinutes = const Value.absent(),
    int? sortOrder,
    Value<DateTime?> lastRecordedAt = const Value.absent(),
    DateTime? createdAt,
  }) => HabitDefinitionRow(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    frequencyCount: frequencyCount ?? this.frequencyCount,
    frequencyPeriod: frequencyPeriod ?? this.frequencyPeriod,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    notificationTimeMinutes: notificationTimeMinutes.present
        ? notificationTimeMinutes.value
        : this.notificationTimeMinutes,
    sortOrder: sortOrder ?? this.sortOrder,
    lastRecordedAt: lastRecordedAt.present
        ? lastRecordedAt.value
        : this.lastRecordedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  HabitDefinitionRow copyWithCompanion(HabitDefinitionsCompanion data) {
    return HabitDefinitionRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      frequencyCount: data.frequencyCount.present
          ? data.frequencyCount.value
          : this.frequencyCount,
      frequencyPeriod: data.frequencyPeriod.present
          ? data.frequencyPeriod.value
          : this.frequencyPeriod,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      notificationTimeMinutes: data.notificationTimeMinutes.present
          ? data.notificationTimeMinutes.value
          : this.notificationTimeMinutes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      lastRecordedAt: data.lastRecordedAt.present
          ? data.lastRecordedAt.value
          : this.lastRecordedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitDefinitionRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('frequencyCount: $frequencyCount, ')
          ..write('frequencyPeriod: $frequencyPeriod, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notificationTimeMinutes: $notificationTimeMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('lastRecordedAt: $lastRecordedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    frequencyCount,
    frequencyPeriod,
    startDate,
    endDate,
    notificationTimeMinutes,
    sortOrder,
    lastRecordedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitDefinitionRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.frequencyCount == this.frequencyCount &&
          other.frequencyPeriod == this.frequencyPeriod &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.notificationTimeMinutes == this.notificationTimeMinutes &&
          other.sortOrder == this.sortOrder &&
          other.lastRecordedAt == this.lastRecordedAt &&
          other.createdAt == this.createdAt);
}

class HabitDefinitionsCompanion extends UpdateCompanion<HabitDefinitionRow> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> frequencyCount;
  final Value<FrequencyPeriod> frequencyPeriod;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<int?> notificationTimeMinutes;
  final Value<int> sortOrder;
  final Value<DateTime?> lastRecordedAt;
  final Value<DateTime> createdAt;
  const HabitDefinitionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.frequencyCount = const Value.absent(),
    this.frequencyPeriod = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notificationTimeMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.lastRecordedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HabitDefinitionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required int frequencyCount,
    required FrequencyPeriod frequencyPeriod,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notificationTimeMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.lastRecordedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       frequencyCount = Value(frequencyCount),
       frequencyPeriod = Value(frequencyPeriod);
  static Insertable<HabitDefinitionRow> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? frequencyCount,
    Expression<String>? frequencyPeriod,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? notificationTimeMinutes,
    Expression<int>? sortOrder,
    Expression<DateTime>? lastRecordedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (frequencyCount != null) 'frequency_count': frequencyCount,
      if (frequencyPeriod != null) 'frequency_period': frequencyPeriod,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (notificationTimeMinutes != null)
        'notification_time_minutes': notificationTimeMinutes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (lastRecordedAt != null) 'last_recorded_at': lastRecordedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HabitDefinitionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<int>? frequencyCount,
    Value<FrequencyPeriod>? frequencyPeriod,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<int?>? notificationTimeMinutes,
    Value<int>? sortOrder,
    Value<DateTime?>? lastRecordedAt,
    Value<DateTime>? createdAt,
  }) {
    return HabitDefinitionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      frequencyCount: frequencyCount ?? this.frequencyCount,
      frequencyPeriod: frequencyPeriod ?? this.frequencyPeriod,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notificationTimeMinutes:
          notificationTimeMinutes ?? this.notificationTimeMinutes,
      sortOrder: sortOrder ?? this.sortOrder,
      lastRecordedAt: lastRecordedAt ?? this.lastRecordedAt,
      createdAt: createdAt ?? this.createdAt,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (frequencyCount.present) {
      map['frequency_count'] = Variable<int>(frequencyCount.value);
    }
    if (frequencyPeriod.present) {
      map['frequency_period'] = Variable<String>(
        $HabitDefinitionsTable.$converterfrequencyPeriod.toSql(
          frequencyPeriod.value,
        ),
      );
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (notificationTimeMinutes.present) {
      map['notification_time_minutes'] = Variable<int>(
        notificationTimeMinutes.value,
      );
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (lastRecordedAt.present) {
      map['last_recorded_at'] = Variable<DateTime>(lastRecordedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('frequencyCount: $frequencyCount, ')
          ..write('frequencyPeriod: $frequencyPeriod, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notificationTimeMinutes: $notificationTimeMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('lastRecordedAt: $lastRecordedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HabitLogsTable extends HabitLogs
    with TableInfo<$HabitLogsTable, HabitLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _habitDefinitionIdMeta = const VerificationMeta(
    'habitDefinitionId',
  );
  @override
  late final GeneratedColumn<int> habitDefinitionId = GeneratedColumn<int>(
    'habit_definition_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habit_definitions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, habitDefinitionId, loggedAt, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_definition_id')) {
      context.handle(
        _habitDefinitionIdMeta,
        habitDefinitionId.isAcceptableOrUnknown(
          data['habit_definition_id']!,
          _habitDefinitionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_habitDefinitionIdMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      habitDefinitionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}habit_definition_id'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $HabitLogsTable createAlias(String alias) {
    return $HabitLogsTable(attachedDatabase, alias);
  }
}

class HabitLogRow extends DataClass implements Insertable<HabitLogRow> {
  final int id;
  final int habitDefinitionId;
  final DateTime loggedAt;
  final String? note;
  const HabitLogRow({
    required this.id,
    required this.habitDefinitionId,
    required this.loggedAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_definition_id'] = Variable<int>(habitDefinitionId);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  HabitLogsCompanion toCompanion(bool nullToAbsent) {
    return HabitLogsCompanion(
      id: Value(id),
      habitDefinitionId: Value(habitDefinitionId),
      loggedAt: Value(loggedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory HabitLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitLogRow(
      id: serializer.fromJson<int>(json['id']),
      habitDefinitionId: serializer.fromJson<int>(json['habitDefinitionId']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitDefinitionId': serializer.toJson<int>(habitDefinitionId),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  HabitLogRow copyWith({
    int? id,
    int? habitDefinitionId,
    DateTime? loggedAt,
    Value<String?> note = const Value.absent(),
  }) => HabitLogRow(
    id: id ?? this.id,
    habitDefinitionId: habitDefinitionId ?? this.habitDefinitionId,
    loggedAt: loggedAt ?? this.loggedAt,
    note: note.present ? note.value : this.note,
  );
  HabitLogRow copyWithCompanion(HabitLogsCompanion data) {
    return HabitLogRow(
      id: data.id.present ? data.id.value : this.id,
      habitDefinitionId: data.habitDefinitionId.present
          ? data.habitDefinitionId.value
          : this.habitDefinitionId,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogRow(')
          ..write('id: $id, ')
          ..write('habitDefinitionId: $habitDefinitionId, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitDefinitionId, loggedAt, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitLogRow &&
          other.id == this.id &&
          other.habitDefinitionId == this.habitDefinitionId &&
          other.loggedAt == this.loggedAt &&
          other.note == this.note);
}

class HabitLogsCompanion extends UpdateCompanion<HabitLogRow> {
  final Value<int> id;
  final Value<int> habitDefinitionId;
  final Value<DateTime> loggedAt;
  final Value<String?> note;
  const HabitLogsCompanion({
    this.id = const Value.absent(),
    this.habitDefinitionId = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  HabitLogsCompanion.insert({
    this.id = const Value.absent(),
    required int habitDefinitionId,
    this.loggedAt = const Value.absent(),
    this.note = const Value.absent(),
  }) : habitDefinitionId = Value(habitDefinitionId);
  static Insertable<HabitLogRow> custom({
    Expression<int>? id,
    Expression<int>? habitDefinitionId,
    Expression<DateTime>? loggedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitDefinitionId != null) 'habit_definition_id': habitDefinitionId,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (note != null) 'note': note,
    });
  }

  HabitLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? habitDefinitionId,
    Value<DateTime>? loggedAt,
    Value<String?>? note,
  }) {
    return HabitLogsCompanion(
      id: id ?? this.id,
      habitDefinitionId: habitDefinitionId ?? this.habitDefinitionId,
      loggedAt: loggedAt ?? this.loggedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitDefinitionId.present) {
      map['habit_definition_id'] = Variable<int>(habitDefinitionId.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogsCompanion(')
          ..write('id: $id, ')
          ..write('habitDefinitionId: $habitDefinitionId, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitDefinitionsTable habitDefinitions = $HabitDefinitionsTable(
    this,
  );
  late final $HabitLogsTable habitLogs = $HabitLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    habitDefinitions,
    habitLogs,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'habit_definitions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('habit_logs', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$HabitDefinitionsTableCreateCompanionBuilder =
    HabitDefinitionsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> description,
      required int frequencyCount,
      required FrequencyPeriod frequencyPeriod,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<int?> notificationTimeMinutes,
      Value<int> sortOrder,
      Value<DateTime?> lastRecordedAt,
      Value<DateTime> createdAt,
    });
typedef $$HabitDefinitionsTableUpdateCompanionBuilder =
    HabitDefinitionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<int> frequencyCount,
      Value<FrequencyPeriod> frequencyPeriod,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<int?> notificationTimeMinutes,
      Value<int> sortOrder,
      Value<DateTime?> lastRecordedAt,
      Value<DateTime> createdAt,
    });

final class $$HabitDefinitionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HabitDefinitionsTable,
          HabitDefinitionRow
        > {
  $$HabitDefinitionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$HabitLogsTable, List<HabitLogRow>>
  _habitLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.habitLogs,
    aliasName: $_aliasNameGenerator(
      db.habitDefinitions.id,
      db.habitLogs.habitDefinitionId,
    ),
  );

  $$HabitLogsTableProcessedTableManager get habitLogsRefs {
    final manager = $$HabitLogsTableTableManager(
      $_db,
      $_db.habitLogs,
    ).filter((f) => f.habitDefinitionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_habitLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitDefinitionsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitDefinitionsTable> {
  $$HabitDefinitionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get frequencyCount => $composableBuilder(
    column: $table.frequencyCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FrequencyPeriod, FrequencyPeriod, String>
  get frequencyPeriod => $composableBuilder(
    column: $table.frequencyPeriod,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationTimeMinutes => $composableBuilder(
    column: $table.notificationTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRecordedAt => $composableBuilder(
    column: $table.lastRecordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> habitLogsRefs(
    Expression<bool> Function($$HabitLogsTableFilterComposer f) f,
  ) {
    final $$HabitLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitLogs,
      getReferencedColumn: (t) => t.habitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitLogsTableFilterComposer(
            $db: $db,
            $table: $db.habitLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitDefinitionsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitDefinitionsTable> {
  $$HabitDefinitionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get frequencyCount => $composableBuilder(
    column: $table.frequencyCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequencyPeriod => $composableBuilder(
    column: $table.frequencyPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationTimeMinutes => $composableBuilder(
    column: $table.notificationTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRecordedAt => $composableBuilder(
    column: $table.lastRecordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitDefinitionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitDefinitionsTable> {
  $$HabitDefinitionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get frequencyCount => $composableBuilder(
    column: $table.frequencyCount,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<FrequencyPeriod, String>
  get frequencyPeriod => $composableBuilder(
    column: $table.frequencyPeriod,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get notificationTimeMinutes => $composableBuilder(
    column: $table.notificationTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get lastRecordedAt => $composableBuilder(
    column: $table.lastRecordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> habitLogsRefs<T extends Object>(
    Expression<T> Function($$HabitLogsTableAnnotationComposer a) f,
  ) {
    final $$HabitLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitLogs,
      getReferencedColumn: (t) => t.habitDefinitionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.habitLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitDefinitionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitDefinitionsTable,
          HabitDefinitionRow,
          $$HabitDefinitionsTableFilterComposer,
          $$HabitDefinitionsTableOrderingComposer,
          $$HabitDefinitionsTableAnnotationComposer,
          $$HabitDefinitionsTableCreateCompanionBuilder,
          $$HabitDefinitionsTableUpdateCompanionBuilder,
          (HabitDefinitionRow, $$HabitDefinitionsTableReferences),
          HabitDefinitionRow,
          PrefetchHooks Function({bool habitLogsRefs})
        > {
  $$HabitDefinitionsTableTableManager(
    _$AppDatabase db,
    $HabitDefinitionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitDefinitionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitDefinitionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitDefinitionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> frequencyCount = const Value.absent(),
                Value<FrequencyPeriod> frequencyPeriod = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int?> notificationTimeMinutes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime?> lastRecordedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => HabitDefinitionsCompanion(
                id: id,
                name: name,
                description: description,
                frequencyCount: frequencyCount,
                frequencyPeriod: frequencyPeriod,
                startDate: startDate,
                endDate: endDate,
                notificationTimeMinutes: notificationTimeMinutes,
                sortOrder: sortOrder,
                lastRecordedAt: lastRecordedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> description = const Value.absent(),
                required int frequencyCount,
                required FrequencyPeriod frequencyPeriod,
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int?> notificationTimeMinutes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime?> lastRecordedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => HabitDefinitionsCompanion.insert(
                id: id,
                name: name,
                description: description,
                frequencyCount: frequencyCount,
                frequencyPeriod: frequencyPeriod,
                startDate: startDate,
                endDate: endDate,
                notificationTimeMinutes: notificationTimeMinutes,
                sortOrder: sortOrder,
                lastRecordedAt: lastRecordedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitDefinitionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (habitLogsRefs) db.habitLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitLogsRefs)
                    await $_getPrefetchedData<
                      HabitDefinitionRow,
                      $HabitDefinitionsTable,
                      HabitLogRow
                    >(
                      currentTable: table,
                      referencedTable: $$HabitDefinitionsTableReferences
                          ._habitLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$HabitDefinitionsTableReferences(
                            db,
                            table,
                            p0,
                          ).habitLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.habitDefinitionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HabitDefinitionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitDefinitionsTable,
      HabitDefinitionRow,
      $$HabitDefinitionsTableFilterComposer,
      $$HabitDefinitionsTableOrderingComposer,
      $$HabitDefinitionsTableAnnotationComposer,
      $$HabitDefinitionsTableCreateCompanionBuilder,
      $$HabitDefinitionsTableUpdateCompanionBuilder,
      (HabitDefinitionRow, $$HabitDefinitionsTableReferences),
      HabitDefinitionRow,
      PrefetchHooks Function({bool habitLogsRefs})
    >;
typedef $$HabitLogsTableCreateCompanionBuilder =
    HabitLogsCompanion Function({
      Value<int> id,
      required int habitDefinitionId,
      Value<DateTime> loggedAt,
      Value<String?> note,
    });
typedef $$HabitLogsTableUpdateCompanionBuilder =
    HabitLogsCompanion Function({
      Value<int> id,
      Value<int> habitDefinitionId,
      Value<DateTime> loggedAt,
      Value<String?> note,
    });

final class $$HabitLogsTableReferences
    extends BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLogRow> {
  $$HabitLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HabitDefinitionsTable _habitDefinitionIdTable(_$AppDatabase db) =>
      db.habitDefinitions.createAlias(
        $_aliasNameGenerator(
          db.habitLogs.habitDefinitionId,
          db.habitDefinitions.id,
        ),
      );

  $$HabitDefinitionsTableProcessedTableManager get habitDefinitionId {
    final $_column = $_itemColumn<int>('habit_definition_id')!;

    final manager = $$HabitDefinitionsTableTableManager(
      $_db,
      $_db.habitDefinitions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitDefinitionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitLogsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitDefinitionsTableFilterComposer get habitDefinitionId {
    final $$HabitDefinitionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitDefinitionId,
      referencedTable: $db.habitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitDefinitionsTableFilterComposer(
            $db: $db,
            $table: $db.habitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitDefinitionsTableOrderingComposer get habitDefinitionId {
    final $$HabitDefinitionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitDefinitionId,
      referencedTable: $db.habitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitDefinitionsTableOrderingComposer(
            $db: $db,
            $table: $db.habitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$HabitDefinitionsTableAnnotationComposer get habitDefinitionId {
    final $$HabitDefinitionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitDefinitionId,
      referencedTable: $db.habitDefinitions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitDefinitionsTableAnnotationComposer(
            $db: $db,
            $table: $db.habitDefinitions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitLogsTable,
          HabitLogRow,
          $$HabitLogsTableFilterComposer,
          $$HabitLogsTableOrderingComposer,
          $$HabitLogsTableAnnotationComposer,
          $$HabitLogsTableCreateCompanionBuilder,
          $$HabitLogsTableUpdateCompanionBuilder,
          (HabitLogRow, $$HabitLogsTableReferences),
          HabitLogRow,
          PrefetchHooks Function({bool habitDefinitionId})
        > {
  $$HabitLogsTableTableManager(_$AppDatabase db, $HabitLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> habitDefinitionId = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => HabitLogsCompanion(
                id: id,
                habitDefinitionId: habitDefinitionId,
                loggedAt: loggedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int habitDefinitionId,
                Value<DateTime> loggedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => HabitLogsCompanion.insert(
                id: id,
                habitDefinitionId: habitDefinitionId,
                loggedAt: loggedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitDefinitionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitDefinitionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitDefinitionId,
                                referencedTable: $$HabitLogsTableReferences
                                    ._habitDefinitionIdTable(db),
                                referencedColumn: $$HabitLogsTableReferences
                                    ._habitDefinitionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitLogsTable,
      HabitLogRow,
      $$HabitLogsTableFilterComposer,
      $$HabitLogsTableOrderingComposer,
      $$HabitLogsTableAnnotationComposer,
      $$HabitLogsTableCreateCompanionBuilder,
      $$HabitLogsTableUpdateCompanionBuilder,
      (HabitLogRow, $$HabitLogsTableReferences),
      HabitLogRow,
      PrefetchHooks Function({bool habitDefinitionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitDefinitionsTableTableManager get habitDefinitions =>
      $$HabitDefinitionsTableTableManager(_db, _db.habitDefinitions);
  $$HabitLogsTableTableManager get habitLogs =>
      $$HabitLogsTableTableManager(_db, _db.habitLogs);
}
