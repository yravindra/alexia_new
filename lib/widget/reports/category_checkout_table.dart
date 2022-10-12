import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/interface/category_checkin_checkout_data.dart';

import '../../controller/session_controller.dart';
import '../../interface/services/report_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import 'category_table_header.dart';

class CategoryCheckOutTable extends StatelessWidget {
  final SessionController sessionController = Get.find();

  CategoryCheckOutTable({Key? key}) : super(key: key);

  Future<List<CategoryCheckInCheckOutData>> _getCategoryCheckOutData(
    String gate,
    String date,
  ) async {
    final reportsService = getService<ReportService>();

    final sc = sessionController;

    final token = sc.token;

    final categoryCheckInOutData = await reportsService.getCategoryCheckOutData(
      token: token,
      gate: gate,
      date: date,
    );

    return categoryCheckInOutData;
  }

  Widget _buildBody(BuildContext context,
      AsyncSnapshot<List<CategoryCheckInCheckOutData>> snapshot) {
    final connectionState = snapshot.connectionState;

    final categoryCheckInCheckOutData = snapshot.data ?? [];

    if ((connectionState == ConnectionState.waiting ||
            connectionState == ConnectionState.none) ||
        categoryCheckInCheckOutData.isEmpty) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }

    final length = categoryCheckInCheckOutData.length > 5
        ? 5
        : categoryCheckInCheckOutData.length;

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
            "Category Check Out Report",
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
            titleOne: "Category",
            titleTwo: "Zone",
            titleThree: "Total CheckOut",
          ),
          for (int i = 0; i < length; i++)
            _buildTableBody(categoryCheckInCheckOutData[i]),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w,
            ),
            child: Center(
              child: Text(
                "VIEW ALL >",
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 14.sp,
                  letterSpacing: 1.0.sp,
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTableBody(CategoryCheckInCheckOutData data) {
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
                  data.category,
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
                  data.currentZone,
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
                  data.totalCategory,
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
        final gate = sessionController.selectedFilterGate;

        final date = sessionController.selectedFilterDate;

        return FutureBuilder<List<CategoryCheckInCheckOutData>>(
          future: _getCategoryCheckOutData(gate, date),
          builder: _buildBody,
        );
      },
    );
  }
}
