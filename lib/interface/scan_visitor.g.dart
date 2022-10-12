// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanVisitor _$ScanVisitorFromJson(Map<String, dynamic> json) => ScanVisitor(
      company: json['company'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      photoUrl: json['photo_url'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      visitorId: json['visitor_id'] as String,
      message: json['message'] as String,
      status: json['status'] as String,
      uniqueCode: json['unique_code'] as String,
      banReason: json['ban_reason'] as String,
    );

Map<String, dynamic> _$ScanVisitorToJson(ScanVisitor instance) =>
    <String, dynamic>{
      'company': instance.company,
      'name': instance.name,
      'category': instance.category,
      'photo_url': instance.photoUrl,
      'mobile': instance.mobile,
      'email': instance.email,
      'visitor_id': instance.visitorId,
      'status': instance.status,
      'message': instance.message,
      'unique_code': instance.uniqueCode,
      'ban_reason': instance.banReason,
    };
