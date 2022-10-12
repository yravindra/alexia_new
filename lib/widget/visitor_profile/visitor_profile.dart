//Flutter import:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/interface/services/scan_service.dart';
import 'package:alexia/widget/header/header.dart';
import 'package:alexia/widget/screen/screen.dart';

import '../../controller/router_controller.dart';
import '../../controller/session_controller.dart';
import '../../interface/scan_visitor.dart';
import '../../modules/theme.dart';
import '../../routes/scanner.dart';
import '../../utils/get_service.dart';
import '../../utils/with_snackbar.dart';

class VisitorProfile extends StatelessWidget {
  VisitorProfile({Key? key}) : super(key: key);
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();

  Future<ScanVisitor?> _handleGetUserProfile(BuildContext context) async {
    final scanService = getService<ScanService>();

    final sc = sessionController;

    final token = sc.token.trim();
    final visitorCode = sc.visitorCode.trim();
    final deviceType = sc.checkInType.trim();
    final zone = sc.selectedZone.trim();

    final result = await withSnackbar(
        context: context,
        callbackWithException: () async {
          return await scanService.getScanVisitor(
            token: token,
            uniqueCode: visitorCode,
            deviceType: deviceType,
            zone: zone,
          );
        });

    return result.value;
  }

  _handleScan() {
    return routerController.navigate(
      path: ScannerRoute.ROUTE,
      replace: true,
    );
  }

  Widget _buildScreen(
    BuildContext context,
    AsyncSnapshot<ScanVisitor?> snapshot,
  ) {
    return Screen(
      header: Header(
        title: "Visitor Profile",
        backgroundColor: Colors.white,
        showBack: true,
      ),
      child: _buildBody(snapshot),
    );
  }

  _buildBody(AsyncSnapshot<ScanVisitor?> snapshot) {
    if (snapshot.data == null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 32.h,
          horizontal: 16.w,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 7.h,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Rescan',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onPressed: _handleScan,
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 40.w,
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                  strokeWidth: 2.w,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final status = snapshot.data!.status;
    var statusColors = Colors.green;

    if (status.trim() == "PENDING") {
      statusColors = Colors.yellow;
    } else if (status.trim() == "BLOCKED") {
      statusColors = Colors.red;
    }

    return snapshot.hasData
        ? Center(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 30.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 155.w,
                        height: 155.h,
                        child: Image.network(
                          snapshot.data!.photoUrl,
                          height: 150.h,
                          width: 150.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Text(
                          snapshot.data!.name,
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.5.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Text(
                          snapshot.data!.company,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.0,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.5.sp,
                            color: descriptionColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Text(
                          snapshot.data!.category,
                          textScaleFactor: 1.0,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.sp,
                            letterSpacing: 0.5.sp,
                            color: descriptionColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Text(
                          status,
                          maxLines: 1,
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.5.sp,
                            color: statusColors,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: Text(
                          snapshot.data!.message,
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 14.sp,
                            letterSpacing: 0.5.sp,
                            color: statusColors,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 7.h,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Rescan',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onPressed: _handleScan,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.h,
              horizontal: 16.w,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 7.h,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Rescan',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      onPressed: _handleScan,
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                      strokeWidth: 2.w,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _handleGetUserProfile(context),
      builder: _buildScreen,
    );
  }
}
