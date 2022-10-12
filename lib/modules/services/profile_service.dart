// Package imports:
import 'dart:async';
import 'dart:core';

import 'package:alexia/interface/current_info.dart';
import 'package:alexia/interface/option.dart';
import 'package:alexia/interface/profile.dart';
import 'package:alexia/interface/zones.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../interface/services/profile_service.dart';
import '../../models/forgot_password.dart';
import '../../utils/http.dart';
import '../../utils/list_from_any.dart';
import '../atom_api.dart';

@Singleton(as: ProfileService, env: [Environment.dev, Environment.prod])
class ApiProfileService implements ProfileService {
  final Http http;
  final String api;

  ApiProfileService({
    @kweb_api required this.api,
    required this.http,
  });

  @override
  Future<Profile> getProfile({
    required String password,
    required String email,
  }) async {
    final uri = Uri.parse("$api/api/user/signin/");

    final Map<String, dynamic> body = {
      "password": password,
      "email": email,
      "user_type": "STUDENT",
    };

    final Map<String, dynamic> res = await http.post(uri: uri, body: body);

    final statusCode =
        res.containsKey("status_code") ? res["status_code"] : "100";

    if (statusCode != "200") {
      var message = res.containsKey("message")
          ? res["message"]
          : "Failed to login try again";

      throw Exception(message);
    }

    return Profile.fromApi(res);
  }

  @override
  Future<Profile> registerProfile({
    required String password,
    required String email,
    required String name,
  }) async {
    final uri = Uri.parse("$api/api/user/signup/");

    final Map<String, dynamic> body = {
      "password": password,
      "email": email,
      "name": name,
    };

    final Map<String, dynamic> res = await http.post(uri: uri, body: body);

    final statusCode =
        res.containsKey("status_code") ? res["status_code"] : "100";

    if (statusCode != "200") {
      var message = res.containsKey("message")
          ? res["message"]
          : "Failed to register try again";

      throw Exception(message);
    }

    return Profile.fromApi(res);
  }

  @override
  Future<List<Zones>> getZones({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/masters/getZoneList");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    if (obj.isEmpty) return [];

    return obj.containsKey("result")
        ? listFromAny(
            obj["result"],
            Zones.fromApi,
          )
        : [];
  }

  @override
  Future<List<Option>> getCategories({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/masters/getVisitorCategoryList");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    if (obj.isEmpty) return [];

    return obj.containsKey("result")
        ? listFromAny(
            obj["result"],
            Option.fromApi,
          )
        : [];
  }

  @override
  Future<List<Option>> getDocumentType({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/masters/getIdProofDocumentList");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    if (obj.isEmpty) return [];

    final List result = obj.containsKey("result") ? obj["result"] : [];

    final mapped = result.map(
      (e) => Option(
        catName: e["name"] ?? "",
        id: e["id"] ?? "",
        shortName: "",
      ),
    );

    return mapped.toList();
  }

  @override
  Future<CurrentInfo> getInfo({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/user/appUserCurrentInfo");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    if (obj.isEmpty) return CurrentInfo(currentZone: "", deviceType: "");

    return obj.containsKey("result")
        ? CurrentInfo.fromApi(obj["result"])
        : CurrentInfo(currentZone: "", deviceType: "");
  }

  @override
  Future<String> switchZone({
    required String token,
    required String pinNumber,
    required String checkType,
    required String zone,
  }) async {
    final uri = Uri.parse("$api/api/zone/switchZone");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> body = {
      "pin_number": pinNumber,
      "check_type": checkType,
      "zone": zone,
    };

    final Map<String, dynamic> list =
        await http.post(uri: uri, headers: headers, body: body);

    return list.containsKey("message")
        ? list["message"]
        : "Something went wrong.";
  }

  @override
  Future<Forgot_password> getForgotPassword(
      {required String email, required String medium}) async {
    final uri = Uri.parse("$api/api/user/forget-password-otp");

    final Map<String, dynamic> body = {
      "email": email,
      "medium": medium,
    };

    final Map<String, dynamic> res = await http.post(uri: uri, body: body);

    final statusCode =
        res.containsKey('status_code') ? res["status_code"] : "100";
    if (statusCode != "200") {
      var message = res.containsKey("message")
          ? res["message"]
          : "Failed to register try again";
      throw Exception(message);
    }
    return Forgot_password.fromJson(res);
  }
}
