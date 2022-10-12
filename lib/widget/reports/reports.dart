// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/widget/reports/category_graph.dart';
import 'package:alexia/widget/reports/filter.dart';
import 'package:alexia/widget/reports/user_checkOut_table.dart';

import '../../controller/tab_group_obs_controller.dart';
import 'category_checkIn_table.dart';
import 'category_checkout_table.dart';
import 'data_summary.dart';
import 'user_checkIn_table.dart';

class Reports extends StatelessWidget {
  final TabGroupObsController tabController = Get.put(TabGroupObsController());

  Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Text(
          "Reports",
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 16.sp,
            letterSpacing: 4.5.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 30.h),
            margin: EdgeInsets.only(bottom: 30.h, top: 30.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DataSummery(),
                  SizedBox(height: 15.h),
                  CategoryGraph(),
                  // SizedBox(height: 15.h),
                  // Filter(),
                  // SizedBox(height: 15.h),
                  // CategoryCheckInTable(),
                  // SizedBox(height: 15.h),
                  // CategoryCheckOutTable(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
