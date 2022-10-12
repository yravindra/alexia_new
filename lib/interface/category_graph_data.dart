// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'category_graph_data.g.dart';

@JsonSerializable()
class CategoryGraphData implements Serializable {
  @JsonKey(name: "visitor_count")
  final String visitorCount;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "cat_name")
  final String catName;

  CategoryGraphData({
    required this.visitorCount,
    required this.category,
    required this.catName,
  });

  static CategoryGraphData fromJson(Map<String, dynamic> json) => _$CategoryGraphDataFromJson(json);

  static CategoryGraphData fromApi(Map<String, dynamic> json) {
    final visitorCount = json["visitor_count"] ?? "";

    final category = json["category"] ?? "";

    final catName = json["cat_name"] ?? "";

    return CategoryGraphData(
      visitorCount:visitorCount,
      category:category,
      catName:catName,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CategoryGraphDataToJson(this);
}
