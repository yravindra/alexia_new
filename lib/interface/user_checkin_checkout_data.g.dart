// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_checkin_checkout_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCheckInCheckOutData _$UserCheckInCheckOutDataFromJson(
        Map<String, dynamic> json) =>
    UserCheckInCheckOutData(
      totalScan: json['totalScan'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserCheckInCheckOutDataToJson(
        UserCheckInCheckOutData instance) =>
    <String, dynamic>{
      'totalScan': instance.totalScan,
      'name': instance.name,
      'type': instance.type,
    };
