// Project imports:
import 'package:alexia/interface/scan_visitor.dart';
import 'package:alexia/interface/visitor_log.dart';

abstract class ScanService {
  Future<ScanVisitor> getScanVisitor({
    required String token,
    required String uniqueCode,
    required String deviceType,
    required String zone,
  });

  Future<List<ScanVisitor>> getScanVisitorList({
    required String token,
  });

  Future<List<ScanVisitor>> getScanVisitorSearchList({
    required String token,
    required String name,
    required int limit,
    required int page,
  });

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
  });

  Future<List<VisitorLog>> getVisitorLog({
    required String token,
    required String visitorId,
  });
}
