// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  photoUrl: json['photoUrl'] as String?,
  balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
  registrationDate: DateTime.parse(json['registrationDate'] as String),
  notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
  language: json['language'] as String? ?? 'fr',
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'balance': instance.balance,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'notificationsEnabled': instance.notificationsEnabled,
      'language': instance.language,
    };
