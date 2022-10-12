// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'user_checkin_checkout_data.g.dart';

@JsonSerializable()
class UserCheckInCheckOutData implements Serializable {
  @JsonKey(name: "totalScan")
  final String totalScan;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "type")
  final String type;

  UserCheckInCheckOutData({
    required this.totalScan,
    required this.name,
    required this.type,
  });

  static UserCheckInCheckOutData fromJson(Map<String, dynamic> json) => _$UserCheckInCheckOutDataFromJson(json);

  static UserCheckInCheckOutData fromApi(Map<String, dynamic> json) {
    final totalScan = json["totalScan"] ?? "";

    final name = json["name"] ?? "";

    final type = json["type"] ?? "";

    return UserCheckInCheckOutData(
      totalScan:totalScan,
      name:name,
      type:type,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$UserCheckInCheckOutDataToJson(this);
}
