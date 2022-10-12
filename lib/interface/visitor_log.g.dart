// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorLog _$VisitorLogFromJson(Map<String, dynamic> json) => VisitorLog(
      currentZone: json['current_zone'] as String,
      deviceType: json['device_type'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$VisitorLogToJson(VisitorLog instance) =>
    <String, dynamic>{
      'current_zone': instance.currentZone,
      'device_type': instance.deviceType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
