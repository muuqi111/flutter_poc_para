// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'umbrella.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UmbrellaImpl _$$UmbrellaImplFromJson(Map<String, dynamic> json) =>
    _$UmbrellaImpl(
      id: json['id'] as String,
      stationId: json['stationId'] as String,
      status:
          $enumDecodeNullable(_$UmbrellaStatusEnumMap, json['status']) ??
          UmbrellaStatus.available,
      lastMaintenanceDate: json['lastMaintenanceDate'] == null
          ? null
          : DateTime.parse(json['lastMaintenanceDate'] as String),
      batteryLevel: (json['batteryLevel'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$$UmbrellaImplToJson(_$UmbrellaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stationId': instance.stationId,
      'status': _$UmbrellaStatusEnumMap[instance.status]!,
      'lastMaintenanceDate': instance.lastMaintenanceDate?.toIso8601String(),
      'batteryLevel': instance.batteryLevel,
    };

const _$UmbrellaStatusEnumMap = {
  UmbrellaStatus.available: 'available',
  UmbrellaStatus.rented: 'rented',
  UmbrellaStatus.broken: 'broken',
  UmbrellaStatus.charging: 'charging',
};
