// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'umbrella.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Umbrella _$UmbrellaFromJson(Map<String, dynamic> json) {
  return _Umbrella.fromJson(json);
}

/// @nodoc
mixin _$Umbrella {
  String get id => throw _privateConstructorUsedError;
  String get stationId => throw _privateConstructorUsedError;
  UmbrellaStatus get status => throw _privateConstructorUsedError;
  DateTime? get lastMaintenanceDate => throw _privateConstructorUsedError;
  int get batteryLevel => throw _privateConstructorUsedError;

  /// Serializes this Umbrella to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Umbrella
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UmbrellaCopyWith<Umbrella> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UmbrellaCopyWith<$Res> {
  factory $UmbrellaCopyWith(Umbrella value, $Res Function(Umbrella) then) =
      _$UmbrellaCopyWithImpl<$Res, Umbrella>;
  @useResult
  $Res call({
    String id,
    String stationId,
    UmbrellaStatus status,
    DateTime? lastMaintenanceDate,
    int batteryLevel,
  });
}

/// @nodoc
class _$UmbrellaCopyWithImpl<$Res, $Val extends Umbrella>
    implements $UmbrellaCopyWith<$Res> {
  _$UmbrellaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Umbrella
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stationId = null,
    Object? status = null,
    Object? lastMaintenanceDate = freezed,
    Object? batteryLevel = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            stationId: null == stationId
                ? _value.stationId
                : stationId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UmbrellaStatus,
            lastMaintenanceDate: freezed == lastMaintenanceDate
                ? _value.lastMaintenanceDate
                : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            batteryLevel: null == batteryLevel
                ? _value.batteryLevel
                : batteryLevel // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UmbrellaImplCopyWith<$Res>
    implements $UmbrellaCopyWith<$Res> {
  factory _$$UmbrellaImplCopyWith(
    _$UmbrellaImpl value,
    $Res Function(_$UmbrellaImpl) then,
  ) = __$$UmbrellaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String stationId,
    UmbrellaStatus status,
    DateTime? lastMaintenanceDate,
    int batteryLevel,
  });
}

/// @nodoc
class __$$UmbrellaImplCopyWithImpl<$Res>
    extends _$UmbrellaCopyWithImpl<$Res, _$UmbrellaImpl>
    implements _$$UmbrellaImplCopyWith<$Res> {
  __$$UmbrellaImplCopyWithImpl(
    _$UmbrellaImpl _value,
    $Res Function(_$UmbrellaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Umbrella
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stationId = null,
    Object? status = null,
    Object? lastMaintenanceDate = freezed,
    Object? batteryLevel = null,
  }) {
    return _then(
      _$UmbrellaImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        stationId: null == stationId
            ? _value.stationId
            : stationId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UmbrellaStatus,
        lastMaintenanceDate: freezed == lastMaintenanceDate
            ? _value.lastMaintenanceDate
            : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        batteryLevel: null == batteryLevel
            ? _value.batteryLevel
            : batteryLevel // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UmbrellaImpl implements _Umbrella {
  const _$UmbrellaImpl({
    required this.id,
    required this.stationId,
    this.status = UmbrellaStatus.available,
    this.lastMaintenanceDate,
    this.batteryLevel = 100,
  });

  factory _$UmbrellaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UmbrellaImplFromJson(json);

  @override
  final String id;
  @override
  final String stationId;
  @override
  @JsonKey()
  final UmbrellaStatus status;
  @override
  final DateTime? lastMaintenanceDate;
  @override
  @JsonKey()
  final int batteryLevel;

  @override
  String toString() {
    return 'Umbrella(id: $id, stationId: $stationId, status: $status, lastMaintenanceDate: $lastMaintenanceDate, batteryLevel: $batteryLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UmbrellaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastMaintenanceDate, lastMaintenanceDate) ||
                other.lastMaintenanceDate == lastMaintenanceDate) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    stationId,
    status,
    lastMaintenanceDate,
    batteryLevel,
  );

  /// Create a copy of Umbrella
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UmbrellaImplCopyWith<_$UmbrellaImpl> get copyWith =>
      __$$UmbrellaImplCopyWithImpl<_$UmbrellaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UmbrellaImplToJson(this);
  }
}

abstract class _Umbrella implements Umbrella {
  const factory _Umbrella({
    required final String id,
    required final String stationId,
    final UmbrellaStatus status,
    final DateTime? lastMaintenanceDate,
    final int batteryLevel,
  }) = _$UmbrellaImpl;

  factory _Umbrella.fromJson(Map<String, dynamic> json) =
      _$UmbrellaImpl.fromJson;

  @override
  String get id;
  @override
  String get stationId;
  @override
  UmbrellaStatus get status;
  @override
  DateTime? get lastMaintenanceDate;
  @override
  int get batteryLevel;

  /// Create a copy of Umbrella
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UmbrellaImplCopyWith<_$UmbrellaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
