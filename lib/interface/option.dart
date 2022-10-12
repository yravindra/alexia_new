// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'option.g.dart';

@JsonSerializable()
class Option implements Serializable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "cat_name")
  final String catName;
  @JsonKey(name: "short_name")
  final String shortName;

  Option({
    required this.id,
    required this.catName,
    required this.shortName,
  });

  static Option fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  static Option fromApi(Map<String, dynamic> json) {

    final id = json["id"] ?? "";

    final catName = json["cat_name"] ?? "";

    final shortName = json["short_name"] ?? "";

    return Option(
      id: id,
      catName: catName,
      shortName: shortName,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
