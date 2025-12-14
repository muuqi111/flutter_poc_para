// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Rental _$RentalFromJson(Map<String, dynamic> json) {
  return _Rental.fromJson(json);
}

/// @nodoc
mixin _$Rental {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get umbrellaId => throw _privateConstructorUsedError;
  String get startStationId => throw _privateConstructorUsedError;
  String get startStationName => throw _privateConstructorUsedError;
  String? get endStationId => throw _privateConstructorUsedError;
  String? get endStationName => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  RentalStatus get status => throw _privateConstructorUsedError;
  RentalType get type => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError; // Prix de base
  double? get extraCharges =>
      throw _privateConstructorUsedError; // Frais supplémentaires
  double get totalCost =>
      throw _privateConstructorUsedError; // Coût total final
  bool get isDamaged =>
      throw _privateConstructorUsedError; // Signalé comme abîmé
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this Rental to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalCopyWith<Rental> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalCopyWith<$Res> {
  factory $RentalCopyWith(Rental value, $Res Function(Rental) then) =
      _$RentalCopyWithImpl<$Res, Rental>;
  @useResult
  $Res call({
    String id,
    String userId,
    String umbrellaId,
    String startStationId,
    String startStationName,
    String? endStationId,
    String? endStationName,
    DateTime startTime,
    DateTime? endTime,
    RentalStatus status,
    RentalType type,
    double basePrice,
    double? extraCharges,
    double totalCost,
    bool isDamaged,
    String? notes,
  });
}

/// @nodoc
class _$RentalCopyWithImpl<$Res, $Val extends Rental>
    implements $RentalCopyWith<$Res> {
  _$RentalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? umbrellaId = null,
    Object? startStationId = null,
    Object? startStationName = null,
    Object? endStationId = freezed,
    Object? endStationName = freezed,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? type = null,
    Object? basePrice = null,
    Object? extraCharges = freezed,
    Object? totalCost = null,
    Object? isDamaged = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            umbrellaId: null == umbrellaId
                ? _value.umbrellaId
                : umbrellaId // ignore: cast_nullable_to_non_nullable
                      as String,
            startStationId: null == startStationId
                ? _value.startStationId
                : startStationId // ignore: cast_nullable_to_non_nullable
                      as String,
            startStationName: null == startStationName
                ? _value.startStationName
                : startStationName // ignore: cast_nullable_to_non_nullable
                      as String,
            endStationId: freezed == endStationId
                ? _value.endStationId
                : endStationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            endStationName: freezed == endStationName
                ? _value.endStationName
                : endStationName // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as RentalStatus,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as RentalType,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            extraCharges: freezed == extraCharges
                ? _value.extraCharges
                : extraCharges // ignore: cast_nullable_to_non_nullable
                      as double?,
            totalCost: null == totalCost
                ? _value.totalCost
                : totalCost // ignore: cast_nullable_to_non_nullable
                      as double,
            isDamaged: null == isDamaged
                ? _value.isDamaged
                : isDamaged // ignore: cast_nullable_to_non_nullable
                      as bool,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RentalImplCopyWith<$Res> implements $RentalCopyWith<$Res> {
  factory _$$RentalImplCopyWith(
    _$RentalImpl value,
    $Res Function(_$RentalImpl) then,
  ) = __$$RentalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String umbrellaId,
    String startStationId,
    String startStationName,
    String? endStationId,
    String? endStationName,
    DateTime startTime,
    DateTime? endTime,
    RentalStatus status,
    RentalType type,
    double basePrice,
    double? extraCharges,
    double totalCost,
    bool isDamaged,
    String? notes,
  });
}

/// @nodoc
class __$$RentalImplCopyWithImpl<$Res>
    extends _$RentalCopyWithImpl<$Res, _$RentalImpl>
    implements _$$RentalImplCopyWith<$Res> {
  __$$RentalImplCopyWithImpl(
    _$RentalImpl _value,
    $Res Function(_$RentalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? umbrellaId = null,
    Object? startStationId = null,
    Object? startStationName = null,
    Object? endStationId = freezed,
    Object? endStationName = freezed,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? type = null,
    Object? basePrice = null,
    Object? extraCharges = freezed,
    Object? totalCost = null,
    Object? isDamaged = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$RentalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        umbrellaId: null == umbrellaId
            ? _value.umbrellaId
            : umbrellaId // ignore: cast_nullable_to_non_nullable
                  as String,
        startStationId: null == startStationId
            ? _value.startStationId
            : startStationId // ignore: cast_nullable_to_non_nullable
                  as String,
        startStationName: null == startStationName
            ? _value.startStationName
            : startStationName // ignore: cast_nullable_to_non_nullable
                  as String,
        endStationId: freezed == endStationId
            ? _value.endStationId
            : endStationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        endStationName: freezed == endStationName
            ? _value.endStationName
            : endStationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RentalStatus,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as RentalType,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        extraCharges: freezed == extraCharges
            ? _value.extraCharges
            : extraCharges // ignore: cast_nullable_to_non_nullable
                  as double?,
        totalCost: null == totalCost
            ? _value.totalCost
            : totalCost // ignore: cast_nullable_to_non_nullable
                  as double,
        isDamaged: null == isDamaged
            ? _value.isDamaged
            : isDamaged // ignore: cast_nullable_to_non_nullable
                  as bool,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalImpl implements _Rental {
  const _$RentalImpl({
    required this.id,
    required this.userId,
    required this.umbrellaId,
    required this.startStationId,
    required this.startStationName,
    this.endStationId,
    this.endStationName,
    required this.startTime,
    this.endTime,
    this.status = RentalStatus.active,
    this.type = RentalType.rental,
    this.basePrice = 0.0,
    this.extraCharges,
    this.totalCost = 0.0,
    this.isDamaged = false,
    this.notes,
  });

  factory _$RentalImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String umbrellaId;
  @override
  final String startStationId;
  @override
  final String startStationName;
  @override
  final String? endStationId;
  @override
  final String? endStationName;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final RentalStatus status;
  @override
  @JsonKey()
  final RentalType type;
  @override
  @JsonKey()
  final double basePrice;
  // Prix de base
  @override
  final double? extraCharges;
  // Frais supplémentaires
  @override
  @JsonKey()
  final double totalCost;
  // Coût total final
  @override
  @JsonKey()
  final bool isDamaged;
  // Signalé comme abîmé
  @override
  final String? notes;

  @override
  String toString() {
    return 'Rental(id: $id, userId: $userId, umbrellaId: $umbrellaId, startStationId: $startStationId, startStationName: $startStationName, endStationId: $endStationId, endStationName: $endStationName, startTime: $startTime, endTime: $endTime, status: $status, type: $type, basePrice: $basePrice, extraCharges: $extraCharges, totalCost: $totalCost, isDamaged: $isDamaged, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.umbrellaId, umbrellaId) ||
                other.umbrellaId == umbrellaId) &&
            (identical(other.startStationId, startStationId) ||
                other.startStationId == startStationId) &&
            (identical(other.startStationName, startStationName) ||
                other.startStationName == startStationName) &&
            (identical(other.endStationId, endStationId) ||
                other.endStationId == endStationId) &&
            (identical(other.endStationName, endStationName) ||
                other.endStationName == endStationName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.extraCharges, extraCharges) ||
                other.extraCharges == extraCharges) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.isDamaged, isDamaged) ||
                other.isDamaged == isDamaged) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    umbrellaId,
    startStationId,
    startStationName,
    endStationId,
    endStationName,
    startTime,
    endTime,
    status,
    type,
    basePrice,
    extraCharges,
    totalCost,
    isDamaged,
    notes,
  );

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalImplCopyWith<_$RentalImpl> get copyWith =>
      __$$RentalImplCopyWithImpl<_$RentalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalImplToJson(this);
  }
}

abstract class _Rental implements Rental {
  const factory _Rental({
    required final String id,
    required final String userId,
    required final String umbrellaId,
    required final String startStationId,
    required final String startStationName,
    final String? endStationId,
    final String? endStationName,
    required final DateTime startTime,
    final DateTime? endTime,
    final RentalStatus status,
    final RentalType type,
    final double basePrice,
    final double? extraCharges,
    final double totalCost,
    final bool isDamaged,
    final String? notes,
  }) = _$RentalImpl;

  factory _Rental.fromJson(Map<String, dynamic> json) = _$RentalImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get umbrellaId;
  @override
  String get startStationId;
  @override
  String get startStationName;
  @override
  String? get endStationId;
  @override
  String? get endStationName;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  RentalStatus get status;
  @override
  RentalType get type;
  @override
  double get basePrice; // Prix de base
  @override
  double? get extraCharges; // Frais supplémentaires
  @override
  double get totalCost; // Coût total final
  @override
  bool get isDamaged; // Signalé comme abîmé
  @override
  String? get notes;

  /// Create a copy of Rental
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalImplCopyWith<_$RentalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
