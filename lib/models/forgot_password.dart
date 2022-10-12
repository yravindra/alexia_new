import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class Forgot_password {
  Forgot_password();

  late String status;
  late num status_code;
  late String message;
  late Map<String,dynamic> data;
  
  factory Forgot_password.fromJson(Map<String,dynamic> json) => _$Forgot_passwordFromJson(json);
  Map<String, dynamic> toJson() => _$Forgot_passwordToJson(this);
}
