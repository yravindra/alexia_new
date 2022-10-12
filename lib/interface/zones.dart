// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'zones.g.dart';

@JsonSerializable()
class Zones implements Serializable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @JsonKey(name: "end_time")
  final DateTime? endTime;

  Zones({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  static Zones fromJson(Map<String, dynamic> json) => _$ZonesFromJson(json);

  static Zones fromApi(Map<String, dynamic> json) {
    final id = json["id"] ?? "";

    final name = json["name"] ?? "";

    final startTime = json["start_time"] ?? "";

    final endTime = json["end_time"] ?? "";

    return Zones(
      id: id,
      name: name,
      startTime: startTime == "" ? null : DateTime.parse(startTime).toLocal(),
      endTime: endTime == "" ? null : DateTime.parse(endTime).toLocal(),
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ZonesToJson(this);
}
