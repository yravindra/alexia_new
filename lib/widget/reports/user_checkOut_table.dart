import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/interface/user_checkin_checkout_data.dart';

import '../../controller/session_controller.dart';
import '../../interface/services/report_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import 'category_table_header.dart';

class UserCheckOutTable extends StatelessWidget {
  final SessionController sessionController = Get.find();

  UserCheckOutTable({Key? key}) : super(key: key);

  Future<List<UserCheckInCheckOutData>> _getCategoryCheckInData(
      String filterDate) async {
    final reportsService = getService<ReportService>();

    final sc = sessionController;

    final token = sc.token;

    final userCheckInCheckOutData = await reportsService.getUserCheckInOutData(
      token: token,
      type: "check_out",
      date: filterDate,
    );

    return userCheckInCheckOutData;
  }

  Widget _buildBody(BuildContext context,
      AsyncSnapshot<List<UserCheckInCheckOutData>> snapshot) {
    final connectionState = snapshot.connectionState;

    final userCheckInCheckOutData = snapshot.data;

    if ((connectionState == ConnectionState.waiting ||
            connectionState == ConnectionState.none) &&
        userCheckInCheckOutData == null) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            "User Check Out Report",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 14.sp,
              letterSpacing: 1.0.sp,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          CategoryTableHeader(
            topRadius: 10.w,
            titleOne: "name",
            titleTwo: "type",
            titleThree: "Total Scan",
          ),
          for (final data in userCheckInCheckOutData ?? [])
            _buildTableBody(data),
        ],
      ),
    );
  }

  _buildTableBody(UserCheckInCheckOutData data) {
    return Container(
      color: Colors.grey.withOpacity(0.20),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  data.name,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  data.type,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  data.totalScan,
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: const Color(0xff1C2C39).withOpacity(0.20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final filterDate = sessionController.selectedFilterDate;

        return FutureBuilder<List<UserCheckInCheckOutData>>(
          future: _getCategoryCheckInData(filterDate),
          builder: _buildBody,
        );
      },
    );
  }
}
