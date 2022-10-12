// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'total_visitor_count.g.dart';

@JsonSerializable()
class TotalVisitorCount implements Serializable {
  @JsonKey(name: "total_record")
  final String totalRecord;

  TotalVisitorCount({
    required this.totalRecord,
  });

  static TotalVisitorCount fromJson(Map<String, dynamic> json) => _$TotalVisitorCountFromJson(json);

  static TotalVisitorCount fromApi(Map<String, dynamic> json) {

    final totalRecord = json["total_record"] ?? "0";

    return TotalVisitorCount(
      totalRecord: totalRecord,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$TotalVisitorCountToJson(this);
}
