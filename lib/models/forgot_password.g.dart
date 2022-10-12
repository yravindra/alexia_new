// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forgot_password _$Forgot_passwordFromJson(Map<String, dynamic> json) =>
    Forgot_password()
      ..status = json['status'] as String
      ..status_code = json['status_code'] as num
      ..message = json['message'] as String
      ..data = json['data'] as Map<String, dynamic>;

Map<String, dynamic> _$Forgot_passwordToJson(Forgot_password instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_code': instance.status_code,
      'message': instance.message,
      'data': instance.data,
    };
