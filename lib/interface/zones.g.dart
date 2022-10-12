// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Zones _$ZonesFromJson(Map<String, dynamic> json) => Zones(
      id: json['id'] as String,
      name: json['name'] as String,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
    );

Map<String, dynamic> _$ZonesToJson(Zones instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
    };
