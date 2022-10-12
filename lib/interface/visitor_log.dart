// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'visitor_log.g.dart';

@JsonSerializable()
class VisitorLog implements Serializable {
  @JsonKey(name: "current_zone")
  final String currentZone;
  @JsonKey(name: "device_type")
  final String deviceType;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  VisitorLog({
    required this.currentZone,
    required this.deviceType,
    required this.createdAt,
    required this.updatedAt,
  });

  static VisitorLog fromJson(Map<String, dynamic> json) => _$VisitorLogFromJson(json);

  static VisitorLog fromApi(Map<String, dynamic> json) {

    final currentZone = json["current_zone"] ?? "";

    final deviceType = json["device_type"] ?? "";

    final createdAt = json["created_at"] ?? "";

    final updatedAt = json["updated_at"] ?? "";

    return VisitorLog(
      currentZone: currentZone,
      deviceType: deviceType,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$VisitorLogToJson(this);
}
