// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:alexia/widget/home/dashboard.dart';

import '../../controller/loading_controller.dart';
import '../../controller/router_controller.dart';
import '../../controller/session_controller.dart';
import '../../routes/login.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();
  final LoadingController loadingController = Get.put(
    LoadingController(),
    tag: "Home",
  );

  _handleLogout(BuildContext context) {
    return () {
      sessionController.logout();

      return routerController.navigate(
        path: LoginRoute.ROUTE,
        replace: true,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "admin",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: 0.5.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: _handleLogout(context),
                  child: Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Text(
                      "Logout",
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 12.sp,
                        letterSpacing: 0.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "IIJS 2022",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 34.sp,
              letterSpacing: 4.5.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          DashBoard(),
        ],
      ),
    );
  }
}
