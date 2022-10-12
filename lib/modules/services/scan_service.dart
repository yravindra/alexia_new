// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../../interface/scan_visitor.dart';
import '../../interface/services/scan_service.dart';
import '../../interface/visitor_log.dart';
import '../../utils/http.dart';
import '../../utils/list_from_any.dart';
import '../atom_api.dart';

@Singleton(as: ScanService, env: [Environment.dev, Environment.prod])
class ApiScanService implements ScanService {
  final Http http;
  final String api;

  ApiScanService({
    @kweb_api required this.api,
    required this.http,
  });

  @override
  Future<ScanVisitor> getScanVisitor({
    required String token,
    required String uniqueCode,
    required String deviceType,
    required String zone,
  }) async {
    final uri = Uri.parse("$api/api/scanapi/visitorScan");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> body = {
      "unique_code": uniqueCode,
      "device_type": deviceType,
      "zone": zone,
    };

    final Map<String, dynamic> list =
        await http.post(uri: uri, headers: headers, body: body);

    final data = list.containsKey("result") ? list["result"] : [];

    if (data == null || data.length == 0) {
      final message = list.containsKey("message")
          ? list["message"]
          : "Invalid QR detected.";
      throw Exception(message);
    }

    return ScanVisitor.fromApi(data);
  }

  @override
  Future<List<ScanVisitor>> getScanVisitorList({
    required String token,
  }) async {
    final uri = Uri.parse("$api/api/visitors/allVisitorsList");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    if (obj.isEmpty) return [];

    return obj.containsKey("result")
        ? listFromAny(
            obj["result"],
            ScanVisitor.fromApi,
          )
        : [];
  }

  @override
  Future<List<ScanVisitor>> getScanVisitorSearchList({
    required String token,
    required String name,
    required int limit,
    required int page,
  }) async {
    final uri = Uri.parse("$api/api/visitors/searchVistitor");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> body = {
      "category": "",
      "name": name,
      "status": "",
      "limit": limit,
      "page": page,
    };

    final Map<String, dynamic> list =
        await http.post(uri: uri, headers: headers, body: body);

    final obj = list.containsKey("0") ? list["0"] : [];

    final List<ScanVisitor> result = obj.containsKey("result")
        ? listFromAny(
            obj["result"],
            ScanVisitor.fromApi,
          )
        : [];

    if (result.isEmpty) {
      final message =
          list.containsKey("message") ? list["message"] : "Records not found.";
      throw Exception(message);
    }

    return result;
  }

  @override
  Future<List<VisitorLog>> getVisitorLog({
    required String token,
    required String visitorId,
  }) async {
    final uri = Uri.parse("$api/api/visitors/visitorLog/$visitorId");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, dynamic> list =
        await http.get(uri: uri, headers: headers);

    final obj = list.containsKey("0") ? list["0"] : [];

    final List<VisitorLog> result = obj.containsKey("result")
        ? listFromAny(
            obj["result"],
            VisitorLog.fromApi,
          )
        : [];

    if (result.isEmpty) {
      final message =
          list.containsKey("message") ? list["message"] : "Logs not available.";
      throw Exception(message);
    }

    return result;
  }

  @override
  Future<String> addVisitor({
    required String token,
    required String company,
    required String name,
    required String email,
    required String mobile,
    required String designation,
    required String category,
    required String photoIdType,
    required String photoIdValue,
    String? photoIdFile,
    String? vaccineFile,
    required String isVc,
    required String source,
    String? photo,
  }) async {
    final uri = Uri.parse("$api/api/visitors/addVisitors");

    final Map<String, String> headers = {"Authtoken": token};

    final Map<String, String> body = {
      "company": company,
      "name": name,
      "email": email,
      "mobile": mobile,
      "designation": designation,
      "category": category,
      "photo_id_type": photoIdType,
      "photo_id_value": photoIdValue,
      "source": "offline",
      "is_vc": isVc,
    };

    final res = await http.postMultipart(
      uri: uri,
      headers: headers,
      photoPath: photo,
      photoIdPath: photoIdFile,
      vaccinePath: vaccineFile,
      body: body,
    );

    final status = res["status"];

    if (status == "error") {
      final Map<String, String>? errorData =
          res.containsKey("errorData") ? res["errorData"] : null;

      var message = "";

      if (errorData == null) {
        message = res.containsKey("message") ? res["message"] : "error occurs";
        return message;
      } else {
        final username =
            errorData.containsKey("company") ? errorData["company"] : "";
        final designation = errorData.containsKey("designation") ? errorData["designation"] : "";
        final name = errorData.containsKey("name") ? errorData["name"] : "";
        final email = errorData.containsKey("email") ? errorData["email"] : "";
        final mobile =
            errorData.containsKey("mobile") ? errorData["mobile"] : "";
        final category =
        errorData.containsKey("category") ? errorData["category"] : "";
        final photoIdType =
        errorData.containsKey("photo_id_type") ? errorData["photo_id_type"] : "";
        final photoIdValue =
        errorData.containsKey("photo_id_value") ? errorData["photo_id_value"] : "";

        message = "$username $designation $name $email $mobile $category $photoIdType $photoIdValue";
        return message;
      }
    }

    return res.containsKey("message") ? res["message"] : status;
  }
}
