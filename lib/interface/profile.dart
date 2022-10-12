// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'serializable.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile implements Serializable {
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "username")
  final String username;

  Profile({
    required this.token,
    required this.name,
    required this.username,
  });

  static Profile fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  static Profile fromApi(Map<String, dynamic> json) {

    final result = json.containsKey("data") ? json["data"] : [];

    final token = result.containsKey("token") ? result["token"] : [];

    final user = result.containsKey("user") ? result["user"] : [];

    final username = user["username"] ?? "";

    final name = user["name"] ?? "";

    final accessToken = token["access"] ?? "";

    return Profile(
      token: accessToken,
      name: name,
      username: username,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
