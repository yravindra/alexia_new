// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_graph_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryGraphData _$CategoryGraphDataFromJson(Map<String, dynamic> json) =>
    CategoryGraphData(
      visitorCount: json['visitor_count'] as String,
      category: json['category'] as String,
      catName: json['cat_name'] as String,
    );

Map<String, dynamic> _$CategoryGraphDataToJson(CategoryGraphData instance) =>
    <String, dynamic>{
      'visitor_count': instance.visitorCount,
      'category': instance.category,
      'cat_name': instance.catName,
    };
