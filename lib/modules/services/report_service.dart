// Project imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/interface/category_checkin_checkout_data.dart';
import 'package:alexia/interface/services/report_service.dart';
import 'package:alexia/interface/total_visitor_count.dart';
import 'package:alexia/interface/user_checkin_checkout_data.dart';

// Package imports:
import '../../interface/category_graph_data.dart';
import '../../utils/http.dart';
import '../../utils/list_from_any.dart';
import '../atom_api.dart';

@Singleton(as: ReportService, env: [Environment.dev, Environment.prod])
class ApiReportService implements ReportService {
  final Http http;
  final String api;

  ApiReportService({
    @kweb_api required this.api,
    required this.http,
  });

  @override
  Future<TotalVisitorCount> getTotalVisitorCount({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/charts/getTotalVisitorCount");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final data = list.containsKey("0") ? list["0"] : [];

    if (data == null || data.length == 0) {
      final message = list.containsKey("message")
          ? list["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final result = data["result"];

    return TotalVisitorCount.fromApi(result[0]);
  }

  @override
  Future<List<CategoryGraphData>> getCategoryGraphData({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/charts/getCategoryWiseCount");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final data = list.containsKey("0") ? list["0"] : [];

    if (data == null || data.length == 0) {
      final message = list.containsKey("message")
          ? list["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final List<CategoryGraphData> graphData = data.containsKey("result")
        ? listFromAny(
            data["result"],
            CategoryGraphData.fromApi,
          )
        : [];

    return graphData;
  }

  @override
  Future<List<CategoryCheckInCheckOutData>> getCategoryCheckInData({
    required String token,
    required String gate,
    required String date,
  }) async {
    final params = <String, String>{
      "gate": gate.replaceAll(" ", ""),
      "created_at": date,
    };

    final checkInUri = Uri.parse("$api/api/reports/getTotalCheckInCategory");

    final Map<String, String> checkInHeaders = {"Authtoken": token};

    final withQueryParams = checkInUri.replace(queryParameters: params);

    final Map<String, dynamic> checkInList =
        await http.get(uri: withQueryParams, headers: checkInHeaders);

    final checkInData = checkInList.containsKey("0") ? checkInList["0"] : [];

    if (checkInData == null || checkInData.length == 0) {
      final message = checkInList.containsKey("message")
          ? checkInList["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final List<CategoryCheckInCheckOutData> catCheckIn =
        checkInData.containsKey("result")
            ? listFromAny(
                checkInData["result"],
                CategoryCheckInCheckOutData.fromApi,
              )
            : [];

    return catCheckIn;
  }

  @override
  Future<List<CategoryCheckInCheckOutData>> getCategoryCheckOutData({
    required String token,
    required String gate,
    required String date,
  }) async {
    final params = <String, String>{
      "gate": gate.replaceAll(" ", ""),
      "created_at": date,
    };

    final checkOutUri = Uri.parse("$api/api/reports/getTotalCheckOutCategory");

    final Map<String, String> checkOutHeaders = {"Authtoken": token};

    final withQueryParams = checkOutUri.replace(queryParameters: params);

    final Map<String, dynamic> checkOutList =
        await http.get(uri: withQueryParams, headers: checkOutHeaders);

    final checkOutData = checkOutList.containsKey("0") ? checkOutList["0"] : [];

    if (checkOutData == null || checkOutData.length == 0) {
      final message = checkOutList.containsKey("message")
          ? checkOutList["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final List<CategoryCheckInCheckOutData> catCheckOut =
        checkOutData.containsKey("result")
            ? listFromAny(
                checkOutData["result"],
                CategoryCheckInCheckOutData.fromApi,
              )
            : [];

    return catCheckOut;
  }

  @override
  Future<List<UserCheckInCheckOutData>> getUserCheckInOutData({
    required String token,
    required String type,
    required String date,
  }) async {
    final uri = Uri.parse("$api/api/reports/getUserWiseScanCount");

    final Map<String, dynamic> body = {
      "type": type,
      "created_at": date,
    };

    final Map<String, dynamic> res = await http.post(uri: uri, body: body);

    final userData = res.containsKey("0") ? res["0"] : [];

    if (userData == null || userData.length == 0) {
      final message = res.containsKey("message")
          ? res["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final List<UserCheckInCheckOutData> userdata =
        userData.containsKey("result")
            ? listFromAny(
                userData["result"],
                UserCheckInCheckOutData.fromApi,
              )
            : [];

    return userdata;
  }

  @override
  Future<List<String>> getFilterDates({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/reports/getEventForDates");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final data = list.containsKey("0") ? list["0"] : [];

    if (data == null || data.length == 0) {
      final message = list.containsKey("message")
          ? list["message"]
          : "Invalid session detected.";
      throw Exception(message);
    }

    final List<String> filterDates = data.containsKey("result")
        ? listFromAny(
            data["result"],
            ((each) => each["created_at"]),
          )
        : [];

    return filterDates;
  }
}
