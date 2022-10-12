// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/modules/theme.dart';
import 'package:alexia/routes/scanner.dart';
import 'package:alexia/routes/search_visitor.dart';
import 'package:alexia/widget/select_zone/select_zone.dart';

import '../../controller/router_controller.dart';
import '../../controller/session_controller.dart';
import '../show_toast.dart';
import '../switch_zone/switch_zone.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();

  @override
  Widget build(BuildContext context) {
    final name = sessionController.name;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 45.h,
          ),
          padding: EdgeInsets.only(bottom: 20.h),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 55.h,
              ),
              Text(
                name,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 18.sp,
                  letterSpacing: 0.5.sp,
                  color: primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () {
                  final selectedZone = sessionController.selectedZone;

                  return Text(
                    "$selectedZone Selected",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5.sp,
                      color: descriptionColor,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () {
                  final checkType = sessionController.checkInType == "check_in"
                      ? "Check In"
                      : "Check Out";

                  return Text(
                    "$checkType Selected",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5.sp,
                      color: descriptionColor,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                sessionController.mobile,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 14.sp,
                  letterSpacing: 0.5.sp,
                  color: descriptionColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: _handleSelectZone(context),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.w),
                      ),
                      child: Container(
                        width: 120.w,
                        height: 100.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/select_zone.png',
                              width: 50.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Select Zone",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 12.sp,
                                letterSpacing: 0.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _handleSwitchZone(context),
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.w),
                      ),
                      child: Container(
                        width: 120.w,
                        height: 100.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 5.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/switch_zone.png',
                              width: 50.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Check In - Check Out",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                letterSpacing: 0.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                child: Material(
                  color: Colors.white,
                  elevation: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _handleScanQR(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 25.h,
                              horizontal: 15.w,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/scan_qr.png',
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "Scan Tickets",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    letterSpacing: 0.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1.w,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _handleSearchUser(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 25.h,
                              horizontal: 15.w,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/search_user.png',
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "Search User",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    letterSpacing: 0.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png",
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  _handleSelectZone(BuildContext context) {
    return () {
      final selectZone = SelectZone();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return selectZone;
        },
      );
    };
  }

  _handleSwitchZone(BuildContext context) {
    return () {
      final selectZone = SwitchZone();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return selectZone;
        },
      );
    };
  }

  _handleScanQR(BuildContext context) {
    return () {
      if (sessionController.selectedZone.isEmpty ||
          sessionController.checkInType.isEmpty) {
        showToast(context, 'Please select zone and check in type.');
      }

      return routerController.navigate(
        path: ScannerRoute.ROUTE,
        replace: false,
      );
    };
  }

  _handleSearchUser(BuildContext context) {
    return () {
      return routerController.navigate(
        path: SearchVisitorRoute.ROUTE,
        replace: false,
      );
    };
  }
}
