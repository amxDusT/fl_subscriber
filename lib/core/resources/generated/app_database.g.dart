// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_database.dart';

// ignore_for_file: type=lint
class $SubscriptionsTableTable extends SubscriptionsTable
    with TableInfo<$SubscriptionsTableTable, SubscriptionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _serviceIdMeta = const VerificationMeta(
    'serviceId',
  );
  @override
  late final GeneratedColumn<String> serviceId = GeneratedColumn<String>(
    'service_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceNameMeta = const VerificationMeta(
    'serviceName',
  );
  @override
  late final GeneratedColumn<String> serviceName = GeneratedColumn<String>(
    'service_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconCodePointMeta = const VerificationMeta(
    'iconCodePoint',
  );
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
    'icon_code_point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconFontFamilyMeta = const VerificationMeta(
    'iconFontFamily',
  );
  @override
  late final GeneratedColumn<String> iconFontFamily = GeneratedColumn<String>(
    'icon_font_family',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('MaterialIcons'),
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('EUR'),
  );
  static const VerificationMeta _planNameMeta = const VerificationMeta(
    'planName',
  );
  @override
  late final GeneratedColumn<String> planName = GeneratedColumn<String>(
    'plan_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextPaymentDateMeta = const VerificationMeta(
    'nextPaymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> nextPaymentDate =
      GeneratedColumn<DateTime>(
        'next_payment_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _logoAssetMeta = const VerificationMeta(
    'logoAsset',
  );
  @override
  late final GeneratedColumn<String> logoAsset = GeneratedColumn<String>(
    'logo_asset',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alertDaysBeforeMeta = const VerificationMeta(
    'alertDaysBefore',
  );
  @override
  late final GeneratedColumn<int> alertDaysBefore = GeneratedColumn<int>(
    'alert_days_before',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
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
    serviceId,
    serviceName,
    iconCodePoint,
    iconFontFamily,
    colorValue,
    amount,
    currency,
    planName,
    frequency,
    startDate,
    nextPaymentDate,
    logoAsset,
    category,
    alertDaysBefore,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubscriptionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(
        _serviceIdMeta,
        serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('service_name')) {
      context.handle(
        _serviceNameMeta,
        serviceName.isAcceptableOrUnknown(
          data['service_name']!,
          _serviceNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceNameMeta);
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
        _iconCodePointMeta,
        iconCodePoint.isAcceptableOrUnknown(
          data['icon_code_point']!,
          _iconCodePointMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_iconCodePointMeta);
    }
    if (data.containsKey('icon_font_family')) {
      context.handle(
        _iconFontFamilyMeta,
        iconFontFamily.isAcceptableOrUnknown(
          data['icon_font_family']!,
          _iconFontFamilyMeta,
        ),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('plan_name')) {
      context.handle(
        _planNameMeta,
        planName.isAcceptableOrUnknown(data['plan_name']!, _planNameMeta),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('next_payment_date')) {
      context.handle(
        _nextPaymentDateMeta,
        nextPaymentDate.isAcceptableOrUnknown(
          data['next_payment_date']!,
          _nextPaymentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextPaymentDateMeta);
    }
    if (data.containsKey('logo_asset')) {
      context.handle(
        _logoAssetMeta,
        logoAsset.isAcceptableOrUnknown(data['logo_asset']!, _logoAssetMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('alert_days_before')) {
      context.handle(
        _alertDaysBeforeMeta,
        alertDaysBefore.isAcceptableOrUnknown(
          data['alert_days_before']!,
          _alertDaysBeforeMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
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
  SubscriptionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubscriptionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      serviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_id'],
      )!,
      serviceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_name'],
      )!,
      iconCodePoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_code_point'],
      )!,
      iconFontFamily: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_font_family'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      planName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_name'],
      ),
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      nextPaymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_payment_date'],
      )!,
      logoAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_asset'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      alertDaysBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_days_before'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SubscriptionsTableTable createAlias(String alias) {
    return $SubscriptionsTableTable(attachedDatabase, alias);
  }
}

class SubscriptionsTableData extends DataClass
    implements Insertable<SubscriptionsTableData> {
  final int id;
  final String serviceId;
  final String serviceName;
  final int iconCodePoint;
  final String iconFontFamily;
  final int colorValue;
  final double amount;
  final String currency;
  final String? planName;
  final String frequency;
  final DateTime startDate;
  final DateTime nextPaymentDate;
  final String? logoAsset;
  final String? category;
  final int? alertDaysBefore;
  final bool isActive;
  final DateTime createdAt;
  const SubscriptionsTableData({
    required this.id,
    required this.serviceId,
    required this.serviceName,
    required this.iconCodePoint,
    required this.iconFontFamily,
    required this.colorValue,
    required this.amount,
    required this.currency,
    this.planName,
    required this.frequency,
    required this.startDate,
    required this.nextPaymentDate,
    this.logoAsset,
    this.category,
    this.alertDaysBefore,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_id'] = Variable<String>(serviceId);
    map['service_name'] = Variable<String>(serviceName);
    map['icon_code_point'] = Variable<int>(iconCodePoint);
    map['icon_font_family'] = Variable<String>(iconFontFamily);
    map['color_value'] = Variable<int>(colorValue);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || planName != null) {
      map['plan_name'] = Variable<String>(planName);
    }
    map['frequency'] = Variable<String>(frequency);
    map['start_date'] = Variable<DateTime>(startDate);
    map['next_payment_date'] = Variable<DateTime>(nextPaymentDate);
    if (!nullToAbsent || logoAsset != null) {
      map['logo_asset'] = Variable<String>(logoAsset);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || alertDaysBefore != null) {
      map['alert_days_before'] = Variable<int>(alertDaysBefore);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SubscriptionsTableCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsTableCompanion(
      id: Value(id),
      serviceId: Value(serviceId),
      serviceName: Value(serviceName),
      iconCodePoint: Value(iconCodePoint),
      iconFontFamily: Value(iconFontFamily),
      colorValue: Value(colorValue),
      amount: Value(amount),
      currency: Value(currency),
      planName: planName == null && nullToAbsent
          ? const Value.absent()
          : Value(planName),
      frequency: Value(frequency),
      startDate: Value(startDate),
      nextPaymentDate: Value(nextPaymentDate),
      logoAsset: logoAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(logoAsset),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      alertDaysBefore: alertDaysBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(alertDaysBefore),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory SubscriptionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubscriptionsTableData(
      id: serializer.fromJson<int>(json['id']),
      serviceId: serializer.fromJson<String>(json['serviceId']),
      serviceName: serializer.fromJson<String>(json['serviceName']),
      iconCodePoint: serializer.fromJson<int>(json['iconCodePoint']),
      iconFontFamily: serializer.fromJson<String>(json['iconFontFamily']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      planName: serializer.fromJson<String?>(json['planName']),
      frequency: serializer.fromJson<String>(json['frequency']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      nextPaymentDate: serializer.fromJson<DateTime>(json['nextPaymentDate']),
      logoAsset: serializer.fromJson<String?>(json['logoAsset']),
      category: serializer.fromJson<String?>(json['category']),
      alertDaysBefore: serializer.fromJson<int?>(json['alertDaysBefore']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serviceId': serializer.toJson<String>(serviceId),
      'serviceName': serializer.toJson<String>(serviceName),
      'iconCodePoint': serializer.toJson<int>(iconCodePoint),
      'iconFontFamily': serializer.toJson<String>(iconFontFamily),
      'colorValue': serializer.toJson<int>(colorValue),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'planName': serializer.toJson<String?>(planName),
      'frequency': serializer.toJson<String>(frequency),
      'startDate': serializer.toJson<DateTime>(startDate),
      'nextPaymentDate': serializer.toJson<DateTime>(nextPaymentDate),
      'logoAsset': serializer.toJson<String?>(logoAsset),
      'category': serializer.toJson<String?>(category),
      'alertDaysBefore': serializer.toJson<int?>(alertDaysBefore),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SubscriptionsTableData copyWith({
    int? id,
    String? serviceId,
    String? serviceName,
    int? iconCodePoint,
    String? iconFontFamily,
    int? colorValue,
    double? amount,
    String? currency,
    Value<String?> planName = const Value.absent(),
    String? frequency,
    DateTime? startDate,
    DateTime? nextPaymentDate,
    Value<String?> logoAsset = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<int?> alertDaysBefore = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => SubscriptionsTableData(
    id: id ?? this.id,
    serviceId: serviceId ?? this.serviceId,
    serviceName: serviceName ?? this.serviceName,
    iconCodePoint: iconCodePoint ?? this.iconCodePoint,
    iconFontFamily: iconFontFamily ?? this.iconFontFamily,
    colorValue: colorValue ?? this.colorValue,
    amount: amount ?? this.amount,
    currency: currency ?? this.currency,
    planName: planName.present ? planName.value : this.planName,
    frequency: frequency ?? this.frequency,
    startDate: startDate ?? this.startDate,
    nextPaymentDate: nextPaymentDate ?? this.nextPaymentDate,
    logoAsset: logoAsset.present ? logoAsset.value : this.logoAsset,
    category: category.present ? category.value : this.category,
    alertDaysBefore: alertDaysBefore.present
        ? alertDaysBefore.value
        : this.alertDaysBefore,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  SubscriptionsTableData copyWithCompanion(SubscriptionsTableCompanion data) {
    return SubscriptionsTableData(
      id: data.id.present ? data.id.value : this.id,
      serviceId: data.serviceId.present ? data.serviceId.value : this.serviceId,
      serviceName: data.serviceName.present
          ? data.serviceName.value
          : this.serviceName,
      iconCodePoint: data.iconCodePoint.present
          ? data.iconCodePoint.value
          : this.iconCodePoint,
      iconFontFamily: data.iconFontFamily.present
          ? data.iconFontFamily.value
          : this.iconFontFamily,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      planName: data.planName.present ? data.planName.value : this.planName,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      nextPaymentDate: data.nextPaymentDate.present
          ? data.nextPaymentDate.value
          : this.nextPaymentDate,
      logoAsset: data.logoAsset.present ? data.logoAsset.value : this.logoAsset,
      category: data.category.present ? data.category.value : this.category,
      alertDaysBefore: data.alertDaysBefore.present
          ? data.alertDaysBefore.value
          : this.alertDaysBefore,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsTableData(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('serviceName: $serviceName, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('iconFontFamily: $iconFontFamily, ')
          ..write('colorValue: $colorValue, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('planName: $planName, ')
          ..write('frequency: $frequency, ')
          ..write('startDate: $startDate, ')
          ..write('nextPaymentDate: $nextPaymentDate, ')
          ..write('logoAsset: $logoAsset, ')
          ..write('category: $category, ')
          ..write('alertDaysBefore: $alertDaysBefore, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    serviceId,
    serviceName,
    iconCodePoint,
    iconFontFamily,
    colorValue,
    amount,
    currency,
    planName,
    frequency,
    startDate,
    nextPaymentDate,
    logoAsset,
    category,
    alertDaysBefore,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscriptionsTableData &&
          other.id == this.id &&
          other.serviceId == this.serviceId &&
          other.serviceName == this.serviceName &&
          other.iconCodePoint == this.iconCodePoint &&
          other.iconFontFamily == this.iconFontFamily &&
          other.colorValue == this.colorValue &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.planName == this.planName &&
          other.frequency == this.frequency &&
          other.startDate == this.startDate &&
          other.nextPaymentDate == this.nextPaymentDate &&
          other.logoAsset == this.logoAsset &&
          other.category == this.category &&
          other.alertDaysBefore == this.alertDaysBefore &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class SubscriptionsTableCompanion
    extends UpdateCompanion<SubscriptionsTableData> {
  final Value<int> id;
  final Value<String> serviceId;
  final Value<String> serviceName;
  final Value<int> iconCodePoint;
  final Value<String> iconFontFamily;
  final Value<int> colorValue;
  final Value<double> amount;
  final Value<String> currency;
  final Value<String?> planName;
  final Value<String> frequency;
  final Value<DateTime> startDate;
  final Value<DateTime> nextPaymentDate;
  final Value<String?> logoAsset;
  final Value<String?> category;
  final Value<int?> alertDaysBefore;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const SubscriptionsTableCompanion({
    this.id = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.serviceName = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.iconFontFamily = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.planName = const Value.absent(),
    this.frequency = const Value.absent(),
    this.startDate = const Value.absent(),
    this.nextPaymentDate = const Value.absent(),
    this.logoAsset = const Value.absent(),
    this.category = const Value.absent(),
    this.alertDaysBefore = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SubscriptionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String serviceId,
    required String serviceName,
    required int iconCodePoint,
    this.iconFontFamily = const Value.absent(),
    required int colorValue,
    required double amount,
    this.currency = const Value.absent(),
    this.planName = const Value.absent(),
    required String frequency,
    required DateTime startDate,
    required DateTime nextPaymentDate,
    this.logoAsset = const Value.absent(),
    this.category = const Value.absent(),
    this.alertDaysBefore = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : serviceId = Value(serviceId),
       serviceName = Value(serviceName),
       iconCodePoint = Value(iconCodePoint),
       colorValue = Value(colorValue),
       amount = Value(amount),
       frequency = Value(frequency),
       startDate = Value(startDate),
       nextPaymentDate = Value(nextPaymentDate);
  static Insertable<SubscriptionsTableData> custom({
    Expression<int>? id,
    Expression<String>? serviceId,
    Expression<String>? serviceName,
    Expression<int>? iconCodePoint,
    Expression<String>? iconFontFamily,
    Expression<int>? colorValue,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? planName,
    Expression<String>? frequency,
    Expression<DateTime>? startDate,
    Expression<DateTime>? nextPaymentDate,
    Expression<String>? logoAsset,
    Expression<String>? category,
    Expression<int>? alertDaysBefore,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceId != null) 'service_id': serviceId,
      if (serviceName != null) 'service_name': serviceName,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (iconFontFamily != null) 'icon_font_family': iconFontFamily,
      if (colorValue != null) 'color_value': colorValue,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (planName != null) 'plan_name': planName,
      if (frequency != null) 'frequency': frequency,
      if (startDate != null) 'start_date': startDate,
      if (nextPaymentDate != null) 'next_payment_date': nextPaymentDate,
      if (logoAsset != null) 'logo_asset': logoAsset,
      if (category != null) 'category': category,
      if (alertDaysBefore != null) 'alert_days_before': alertDaysBefore,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SubscriptionsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? serviceId,
    Value<String>? serviceName,
    Value<int>? iconCodePoint,
    Value<String>? iconFontFamily,
    Value<int>? colorValue,
    Value<double>? amount,
    Value<String>? currency,
    Value<String?>? planName,
    Value<String>? frequency,
    Value<DateTime>? startDate,
    Value<DateTime>? nextPaymentDate,
    Value<String?>? logoAsset,
    Value<String?>? category,
    Value<int?>? alertDaysBefore,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return SubscriptionsTableCompanion(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      iconFontFamily: iconFontFamily ?? this.iconFontFamily,
      colorValue: colorValue ?? this.colorValue,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      planName: planName ?? this.planName,
      frequency: frequency ?? this.frequency,
      startDate: startDate ?? this.startDate,
      nextPaymentDate: nextPaymentDate ?? this.nextPaymentDate,
      logoAsset: logoAsset ?? this.logoAsset,
      category: category ?? this.category,
      alertDaysBefore: alertDaysBefore ?? this.alertDaysBefore,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<String>(serviceId.value);
    }
    if (serviceName.present) {
      map['service_name'] = Variable<String>(serviceName.value);
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (iconFontFamily.present) {
      map['icon_font_family'] = Variable<String>(iconFontFamily.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (planName.present) {
      map['plan_name'] = Variable<String>(planName.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (nextPaymentDate.present) {
      map['next_payment_date'] = Variable<DateTime>(nextPaymentDate.value);
    }
    if (logoAsset.present) {
      map['logo_asset'] = Variable<String>(logoAsset.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (alertDaysBefore.present) {
      map['alert_days_before'] = Variable<int>(alertDaysBefore.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsTableCompanion(')
          ..write('id: $id, ')
          ..write('serviceId: $serviceId, ')
          ..write('serviceName: $serviceName, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('iconFontFamily: $iconFontFamily, ')
          ..write('colorValue: $colorValue, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('planName: $planName, ')
          ..write('frequency: $frequency, ')
          ..write('startDate: $startDate, ')
          ..write('nextPaymentDate: $nextPaymentDate, ')
          ..write('logoAsset: $logoAsset, ')
          ..write('category: $category, ')
          ..write('alertDaysBefore: $alertDaysBefore, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubscriptionsTableTable subscriptionsTable =
      $SubscriptionsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [subscriptionsTable];
}

typedef $$SubscriptionsTableTableCreateCompanionBuilder =
    SubscriptionsTableCompanion Function({
      Value<int> id,
      required String serviceId,
      required String serviceName,
      required int iconCodePoint,
      Value<String> iconFontFamily,
      required int colorValue,
      required double amount,
      Value<String> currency,
      Value<String?> planName,
      required String frequency,
      required DateTime startDate,
      required DateTime nextPaymentDate,
      Value<String?> logoAsset,
      Value<String?> category,
      Value<int?> alertDaysBefore,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$SubscriptionsTableTableUpdateCompanionBuilder =
    SubscriptionsTableCompanion Function({
      Value<int> id,
      Value<String> serviceId,
      Value<String> serviceName,
      Value<int> iconCodePoint,
      Value<String> iconFontFamily,
      Value<int> colorValue,
      Value<double> amount,
      Value<String> currency,
      Value<String?> planName,
      Value<String> frequency,
      Value<DateTime> startDate,
      Value<DateTime> nextPaymentDate,
      Value<String?> logoAsset,
      Value<String?> category,
      Value<int?> alertDaysBefore,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

class $$SubscriptionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableFilterComposer({
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

  ColumnFilters<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconFontFamily => $composableBuilder(
    column: $table.iconFontFamily,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planName => $composableBuilder(
    column: $table.planName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextPaymentDate => $composableBuilder(
    column: $table.nextPaymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoAsset => $composableBuilder(
    column: $table.logoAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get alertDaysBefore => $composableBuilder(
    column: $table.alertDaysBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubscriptionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableOrderingComposer({
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

  ColumnOrderings<String> get serviceId => $composableBuilder(
    column: $table.serviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconFontFamily => $composableBuilder(
    column: $table.iconFontFamily,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planName => $composableBuilder(
    column: $table.planName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextPaymentDate => $composableBuilder(
    column: $table.nextPaymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoAsset => $composableBuilder(
    column: $table.logoAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get alertDaysBefore => $composableBuilder(
    column: $table.alertDaysBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubscriptionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTableTable> {
  $$SubscriptionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serviceId =>
      $composableBuilder(column: $table.serviceId, builder: (column) => column);

  GeneratedColumn<String> get serviceName => $composableBuilder(
    column: $table.serviceName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get iconCodePoint => $composableBuilder(
    column: $table.iconCodePoint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconFontFamily => $composableBuilder(
    column: $table.iconFontFamily,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get planName =>
      $composableBuilder(column: $table.planName, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get nextPaymentDate => $composableBuilder(
    column: $table.nextPaymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoAsset =>
      $composableBuilder(column: $table.logoAsset, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get alertDaysBefore => $composableBuilder(
    column: $table.alertDaysBefore,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SubscriptionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscriptionsTableTable,
          SubscriptionsTableData,
          $$SubscriptionsTableTableFilterComposer,
          $$SubscriptionsTableTableOrderingComposer,
          $$SubscriptionsTableTableAnnotationComposer,
          $$SubscriptionsTableTableCreateCompanionBuilder,
          $$SubscriptionsTableTableUpdateCompanionBuilder,
          (
            SubscriptionsTableData,
            BaseReferences<
              _$AppDatabase,
              $SubscriptionsTableTable,
              SubscriptionsTableData
            >,
          ),
          SubscriptionsTableData,
          PrefetchHooks Function()
        > {
  $$SubscriptionsTableTableTableManager(
    _$AppDatabase db,
    $SubscriptionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> serviceId = const Value.absent(),
                Value<String> serviceName = const Value.absent(),
                Value<int> iconCodePoint = const Value.absent(),
                Value<String> iconFontFamily = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String?> planName = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> nextPaymentDate = const Value.absent(),
                Value<String?> logoAsset = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int?> alertDaysBefore = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubscriptionsTableCompanion(
                id: id,
                serviceId: serviceId,
                serviceName: serviceName,
                iconCodePoint: iconCodePoint,
                iconFontFamily: iconFontFamily,
                colorValue: colorValue,
                amount: amount,
                currency: currency,
                planName: planName,
                frequency: frequency,
                startDate: startDate,
                nextPaymentDate: nextPaymentDate,
                logoAsset: logoAsset,
                category: category,
                alertDaysBefore: alertDaysBefore,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String serviceId,
                required String serviceName,
                required int iconCodePoint,
                Value<String> iconFontFamily = const Value.absent(),
                required int colorValue,
                required double amount,
                Value<String> currency = const Value.absent(),
                Value<String?> planName = const Value.absent(),
                required String frequency,
                required DateTime startDate,
                required DateTime nextPaymentDate,
                Value<String?> logoAsset = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int?> alertDaysBefore = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubscriptionsTableCompanion.insert(
                id: id,
                serviceId: serviceId,
                serviceName: serviceName,
                iconCodePoint: iconCodePoint,
                iconFontFamily: iconFontFamily,
                colorValue: colorValue,
                amount: amount,
                currency: currency,
                planName: planName,
                frequency: frequency,
                startDate: startDate,
                nextPaymentDate: nextPaymentDate,
                logoAsset: logoAsset,
                category: category,
                alertDaysBefore: alertDaysBefore,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubscriptionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscriptionsTableTable,
      SubscriptionsTableData,
      $$SubscriptionsTableTableFilterComposer,
      $$SubscriptionsTableTableOrderingComposer,
      $$SubscriptionsTableTableAnnotationComposer,
      $$SubscriptionsTableTableCreateCompanionBuilder,
      $$SubscriptionsTableTableUpdateCompanionBuilder,
      (
        SubscriptionsTableData,
        BaseReferences<
          _$AppDatabase,
          $SubscriptionsTableTable,
          SubscriptionsTableData
        >,
      ),
      SubscriptionsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubscriptionsTableTableTableManager get subscriptionsTable =>
      $$SubscriptionsTableTableTableManager(_db, _db.subscriptionsTable);
}
