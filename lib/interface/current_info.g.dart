// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentInfo _$CurrentInfoFromJson(Map<String, dynamic> json) => CurrentInfo(
      currentZone: json['current_zone'] as String,
      deviceType: json['device_type'] as String,
    );

Map<String, dynamic> _$CurrentInfoToJson(CurrentInfo instance) =>
    <String, dynamic>{
      'current_zone': instance.currentZone,
      'device_type': instance.deviceType,
    };
