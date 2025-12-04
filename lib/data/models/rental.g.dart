// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalImpl _$$RentalImplFromJson(Map<String, dynamic> json) => _$RentalImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  umbrellaId: json['umbrellaId'] as String,
  startStationId: json['startStationId'] as String,
  startStationName: json['startStationName'] as String,
  endStationId: json['endStationId'] as String?,
  endStationName: json['endStationName'] as String?,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: json['endTime'] == null
      ? null
      : DateTime.parse(json['endTime'] as String),
  status:
      $enumDecodeNullable(_$RentalStatusEnumMap, json['status']) ??
      RentalStatus.active,
  totalCost: (json['totalCost'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$RentalImplToJson(_$RentalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'umbrellaId': instance.umbrellaId,
      'startStationId': instance.startStationId,
      'startStationName': instance.startStationName,
      'endStationId': instance.endStationId,
      'endStationName': instance.endStationName,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'status': _$RentalStatusEnumMap[instance.status]!,
      'totalCost': instance.totalCost,
    };

const _$RentalStatusEnumMap = {
  RentalStatus.active: 'active',
  RentalStatus.completed: 'completed',
  RentalStatus.cancelled: 'cancelled',
};
