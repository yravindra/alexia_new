//Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/interface/services/report_service.dart';
import 'package:alexia/interface/total_visitor_count.dart';

import '../../modules/theme.dart';
import '../../utils/get_service.dart';

class DataSummery extends StatelessWidget {
  final SessionController sessionController = Get.find();

  DataSummery({Key? key}) : super(key: key);

  Future<TotalVisitorCount> _getTotalVisitorCount() async {
    final reportsService = getService<ReportService>();

    final sc = sessionController;

    final token = sc.token;

    final visitorCount = await reportsService.getTotalVisitorCount(
      token: token,
    );

    return visitorCount;
  }

  Widget _buildVisitorCountInfo(
    BuildContext context,
    AsyncSnapshot<TotalVisitorCount?> snapshot,
  ) {
    final connectionState = snapshot.connectionState;

    final visitorCountInfo = snapshot.data;

    if ((connectionState == ConnectionState.waiting ||
            connectionState == ConnectionState.none) &&
        visitorCountInfo == null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        child: Center(
          child: SizedBox(
            width: 40.w,
            height: 40.w,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 10.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 10.w,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                visitorCountInfo?.totalRecord ?? "",
                textScaleFactor: 1.0,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  letterSpacing: 0.5.sp,
                  color: descriptionColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Total Visitors Count",
                textScaleFactor: 1.0,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  letterSpacing: 0.5.sp,
                  color: descriptionColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TotalVisitorCount?>(
      future: _getTotalVisitorCount(),
      builder: _buildVisitorCountInfo,
    );
  }
}
