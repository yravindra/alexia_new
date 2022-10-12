// Project imports:
import 'package:alexia/interface/category_checkin_checkout_data.dart';
import 'package:alexia/interface/category_graph_data.dart';
import 'package:alexia/interface/user_checkin_checkout_data.dart';

import '../total_visitor_count.dart';

abstract class ReportService {
  Future<TotalVisitorCount> getTotalVisitorCount({
    required String token,
  });

  Future<List<CategoryGraphData>> getCategoryGraphData({
    required String token,
  });

  Future<List<CategoryCheckInCheckOutData>> getCategoryCheckInData({
    required String token,
    required String gate,
    required String date,
  });

  Future<List<CategoryCheckInCheckOutData>> getCategoryCheckOutData({
    required String token,
    required String gate,
    required String date,
  });

  Future<List<UserCheckInCheckOutData>> getUserCheckInOutData({
    required String token,
    required String type,
    required String date,
  });

  Future<List<String>> getFilterDates({
    required String token,
  });

}
