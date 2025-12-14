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
      color:
          $enumDecodeNullable(_$UmbrellaColorEnumMap, json['color']) ??
          UmbrellaColor.blue,
      totalRentals: (json['totalRentals'] as num?)?.toInt() ?? 0,
      lastMaintenanceDate: json['lastMaintenanceDate'] == null
          ? null
          : DateTime.parse(json['lastMaintenanceDate'] as String),
      needsRepair: json['needsRepair'] as bool? ?? false,
    );

Map<String, dynamic> _$$UmbrellaImplToJson(_$UmbrellaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stationId': instance.stationId,
      'status': _$UmbrellaStatusEnumMap[instance.status]!,
      'color': _$UmbrellaColorEnumMap[instance.color]!,
      'totalRentals': instance.totalRentals,
      'lastMaintenanceDate': instance.lastMaintenanceDate?.toIso8601String(),
      'needsRepair': instance.needsRepair,
    };

const _$UmbrellaStatusEnumMap = {
  UmbrellaStatus.available: 'available',
  UmbrellaStatus.reserved: 'reserved',
  UmbrellaStatus.inUse: 'inUse',
  UmbrellaStatus.returning: 'returning',
  UmbrellaStatus.maintenance: 'maintenance',
  UmbrellaStatus.broken: 'broken',
};

const _$UmbrellaColorEnumMap = {
  UmbrellaColor.blue: 'blue',
  UmbrellaColor.red: 'red',
  UmbrellaColor.green: 'green',
  UmbrellaColor.black: 'black',
  UmbrellaColor.yellow: 'yellow',
};
