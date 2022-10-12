// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_checkin_checkout_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryCheckInCheckOutData _$CategoryCheckInCheckOutDataFromJson(
        Map<String, dynamic> json) =>
    CategoryCheckInCheckOutData(
      totalCategory: json['totalCategory'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      currentZone: json['current_zone'] as String,
    );

Map<String, dynamic> _$CategoryCheckInCheckOutDataToJson(
        CategoryCheckInCheckOutData instance) =>
    <String, dynamic>{
      'totalCategory': instance.totalCategory,
      'category': instance.category,
      'type': instance.type,
      'current_zone': instance.currentZone,
    };
