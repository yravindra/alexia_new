// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'scan_visitor.g.dart';

@JsonSerializable()
class ScanVisitor implements Serializable {
  @JsonKey(name: "company")
  final String company;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "photo_url")
  final String photoUrl;
  @JsonKey(name: "mobile")
  final String mobile;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "visitor_id")
  final String visitorId;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "unique_code")
  final String uniqueCode;
  @JsonKey(name: "ban_reason")
  final String banReason;

  ScanVisitor({
    required this.company,
    required this.name,
    required this.category,
    required this.photoUrl,
    required this.mobile,
    required this.email,
    required this.visitorId,
    required this.message,
    required this.status,
    required this.uniqueCode,
    required this.banReason,
  });

  static ScanVisitor fromJson(Map<String, dynamic> json) =>
      _$ScanVisitorFromJson(json);

  static ScanVisitor fromApi(Map<String, dynamic> result) {
    final company = result["company"] ?? "";

    final name = result["name"] ?? "";

    final category = result["category"] ?? "";

    final photoUrl = result["photo_url"] ?? "";

    final mobile = result["mobile"] ?? "";

    final email = result["email"] ?? "";

    final visitorId = result["visitor_id"] ?? "";

    final message = result["message"] ?? "";

    final status = result["status"] ?? "";

    final uniqueCode = result["unique_code"] ?? "";

    final banReason = result["ban_reason"] ?? "";

    return ScanVisitor(
      company: company,
      name: name,
      category: category,
      photoUrl: photoUrl,
      mobile: mobile,
      email: email,
      visitorId: visitorId,
      message: message,
      status: status,
      uniqueCode: uniqueCode,
      banReason: banReason,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ScanVisitorToJson(this);
}
