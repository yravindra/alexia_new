// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'current_info.g.dart';

@JsonSerializable()
class CurrentInfo implements Serializable {
  @JsonKey(name: "current_zone")
  final String currentZone;
  @JsonKey(name: "device_type")
  final String deviceType;

  CurrentInfo({
    required this.currentZone,
    required this.deviceType,
  });

  static CurrentInfo fromJson(Map<String, dynamic> json) => _$CurrentInfoFromJson(json);

  static CurrentInfo fromApi(Map<String, dynamic> json) {
    final currentZone = json["current_zone"] ?? "";

    final deviceType = json["device_type"] ?? "";

    return CurrentInfo(
      currentZone: currentZone,
      deviceType: deviceType,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CurrentInfoToJson(this);
}
