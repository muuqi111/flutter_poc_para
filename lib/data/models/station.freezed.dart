// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Station _$StationFromJson(Map<String, dynamic> json) {
  return _Station.fromJson(json);
}

/// @nodoc
mixin _$Station {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get totalCapacity => throw _privateConstructorUsedError;
  List<Umbrella> get umbrellas => throw _privateConstructorUsedError;
  StationStatus get status => throw _privateConstructorUsedError;
  DateTime? get lastMaintenanceDate => throw _privateConstructorUsedError;

  /// Serializes this Station to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationCopyWith<Station> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationCopyWith<$Res> {
  factory $StationCopyWith(Station value, $Res Function(Station) then) =
      _$StationCopyWithImpl<$Res, Station>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    double latitude,
    double longitude,
    int totalCapacity,
    List<Umbrella> umbrellas,
    StationStatus status,
    DateTime? lastMaintenanceDate,
  });
}

/// @nodoc
class _$StationCopyWithImpl<$Res, $Val extends Station>
    implements $StationCopyWith<$Res> {
  _$StationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalCapacity = null,
    Object? umbrellas = null,
    Object? status = null,
    Object? lastMaintenanceDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            totalCapacity: null == totalCapacity
                ? _value.totalCapacity
                : totalCapacity // ignore: cast_nullable_to_non_nullable
                      as int,
            umbrellas: null == umbrellas
                ? _value.umbrellas
                : umbrellas // ignore: cast_nullable_to_non_nullable
                      as List<Umbrella>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as StationStatus,
            lastMaintenanceDate: freezed == lastMaintenanceDate
                ? _value.lastMaintenanceDate
                : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StationImplCopyWith<$Res> implements $StationCopyWith<$Res> {
  factory _$$StationImplCopyWith(
    _$StationImpl value,
    $Res Function(_$StationImpl) then,
  ) = __$$StationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    double latitude,
    double longitude,
    int totalCapacity,
    List<Umbrella> umbrellas,
    StationStatus status,
    DateTime? lastMaintenanceDate,
  });
}

/// @nodoc
class __$$StationImplCopyWithImpl<$Res>
    extends _$StationCopyWithImpl<$Res, _$StationImpl>
    implements _$$StationImplCopyWith<$Res> {
  __$$StationImplCopyWithImpl(
    _$StationImpl _value,
    $Res Function(_$StationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? totalCapacity = null,
    Object? umbrellas = null,
    Object? status = null,
    Object? lastMaintenanceDate = freezed,
  }) {
    return _then(
      _$StationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        totalCapacity: null == totalCapacity
            ? _value.totalCapacity
            : totalCapacity // ignore: cast_nullable_to_non_nullable
                  as int,
        umbrellas: null == umbrellas
            ? _value._umbrellas
            : umbrellas // ignore: cast_nullable_to_non_nullable
                  as List<Umbrella>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as StationStatus,
        lastMaintenanceDate: freezed == lastMaintenanceDate
            ? _value.lastMaintenanceDate
            : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StationImpl implements _Station {
  const _$StationImpl({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.totalCapacity,
    required final List<Umbrella> umbrellas,
    this.status = StationStatus.online,
    this.lastMaintenanceDate,
  }) : _umbrellas = umbrellas;

  factory _$StationImpl.fromJson(Map<String, dynamic> json) =>
      _$$StationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int totalCapacity;
  final List<Umbrella> _umbrellas;
  @override
  List<Umbrella> get umbrellas {
    if (_umbrellas is EqualUnmodifiableListView) return _umbrellas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_umbrellas);
  }

  @override
  @JsonKey()
  final StationStatus status;
  @override
  final DateTime? lastMaintenanceDate;

  @override
  String toString() {
    return 'Station(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, totalCapacity: $totalCapacity, umbrellas: $umbrellas, status: $status, lastMaintenanceDate: $lastMaintenanceDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.totalCapacity, totalCapacity) ||
                other.totalCapacity == totalCapacity) &&
            const DeepCollectionEquality().equals(
              other._umbrellas,
              _umbrellas,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastMaintenanceDate, lastMaintenanceDate) ||
                other.lastMaintenanceDate == lastMaintenanceDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    latitude,
    longitude,
    totalCapacity,
    const DeepCollectionEquality().hash(_umbrellas),
    status,
    lastMaintenanceDate,
  );

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      __$$StationImplCopyWithImpl<_$StationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StationImplToJson(this);
  }
}

abstract class _Station implements Station {
  const factory _Station({
    required final String id,
    required final String name,
    required final String address,
    required final double latitude,
    required final double longitude,
    required final int totalCapacity,
    required final List<Umbrella> umbrellas,
    final StationStatus status,
    final DateTime? lastMaintenanceDate,
  }) = _$StationImpl;

  factory _Station.fromJson(Map<String, dynamic> json) = _$StationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get totalCapacity;
  @override
  List<Umbrella> get umbrellas;
  @override
  StationStatus get status;
  @override
  DateTime? get lastMaintenanceDate;

  /// Create a copy of Station
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationImplCopyWith<_$StationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
