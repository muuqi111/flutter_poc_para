// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationImpl _$$StationImplFromJson(Map<String, dynamic> json) =>
    _$StationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      totalCapacity: (json['totalCapacity'] as num).toInt(),
      umbrellas: (json['umbrellas'] as List<dynamic>)
          .map((e) => Umbrella.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          $enumDecodeNullable(_$StationStatusEnumMap, json['status']) ??
          StationStatus.online,
      lastMaintenanceDate: json['lastMaintenanceDate'] == null
          ? null
          : DateTime.parse(json['lastMaintenanceDate'] as String),
    );

Map<String, dynamic> _$$StationImplToJson(_$StationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'totalCapacity': instance.totalCapacity,
      'umbrellas': instance.umbrellas,
      'status': _$StationStatusEnumMap[instance.status]!,
      'lastMaintenanceDate': instance.lastMaintenanceDate?.toIso8601String(),
    };

const _$StationStatusEnumMap = {
  StationStatus.online: 'online',
  StationStatus.offline: 'offline',
  StationStatus.maintenance: 'maintenance',
};
