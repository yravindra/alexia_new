import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/controller/session_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../interface/category_graph_data.dart';
import '../../interface/services/report_service.dart';
import '../../utils/get_service.dart';
import 'category_graph_table.dart';

class CategoryGraph extends StatelessWidget {
  final SessionController sessionController = Get.find();

  CategoryGraph({Key? key}) : super(key: key);

  Future<List<CategoryGraphData>> _getCategoryGraphData() async {
    final reportsService = getService<ReportService>();

    final sc = sessionController;

    final token = sc.token;

    final categoryGraphData = await reportsService.getCategoryGraphData(
      token: token,
    );

    return categoryGraphData;
  }

  Widget _buildGraph(
    BuildContext context,
    AsyncSnapshot<List<CategoryGraphData>> snapshot,
  ) {
    final connectionState = snapshot.connectionState;

    final visitorGraph = snapshot.data;

    if ((connectionState == ConnectionState.waiting ||
            connectionState == ConnectionState.none) &&
        visitorGraph == null) {
      return const SizedBox(width: 0,height: 0,);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SfCircularChart(
          title: ChartTitle(text: 'User attended by category'),
          legend: Legend(isVisible: true),
          series: <PieSeries<CategoryGraphData, String>>[
            PieSeries<CategoryGraphData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: visitorGraph,
              xValueMapper: (CategoryGraphData data, _) => data.catName,
              yValueMapper: (CategoryGraphData data, _) =>
                  int.parse(data.visitorCount),
              dataLabelMapper: (CategoryGraphData data, _) => data.category,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
        CategoryGraphTable(graphData: visitorGraph ?? []),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryGraphData>>(
      future: _getCategoryGraphData(),
      builder: _buildGraph,
    );
  }
}
