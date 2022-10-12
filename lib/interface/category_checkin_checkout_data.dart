// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'category_checkin_checkout_data.g.dart';

@JsonSerializable()
class CategoryCheckInCheckOutData implements Serializable {
  @JsonKey(name: "totalCategory")
  final String totalCategory;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "current_zone")
  final String currentZone;

  CategoryCheckInCheckOutData({
    required this.totalCategory,
    required this.category,
    required this.type,
    required this.currentZone,
  });

  static CategoryCheckInCheckOutData fromJson(Map<String, dynamic> json) => _$CategoryCheckInCheckOutDataFromJson(json);

  static CategoryCheckInCheckOutData fromApi(Map<String, dynamic> json) {
    final totalCategory = json["totalCategory"] ?? "";

    final category = json["category"] ?? "";

    final type = json["type"] ?? "";

    final currentZone = json["current_zone"] ?? "";

    return CategoryCheckInCheckOutData(
      totalCategory:totalCategory,
      category:category,
      type:type,
      currentZone:currentZone,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CategoryCheckInCheckOutDataToJson(this);
}
