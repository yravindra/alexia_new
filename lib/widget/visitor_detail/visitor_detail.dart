//Flutter Import:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:alexia/interface/visitor_log.dart';

//Package Import:
import 'package:alexia/widget/screen/screen.dart';

import '../../controller/session_controller.dart';
import '../../interface/services/scan_service.dart';
import '../../modules/theme.dart';
import '../../utils/get_service.dart';
import '../../utils/with_snackbar.dart';
import '../header/header.dart';

class VisitorDetail extends StatelessWidget {
  final String photoUrl, name, company, category, mobile, email, id, status,reason;
  final SessionController sessionController = Get.find();

  VisitorDetail({
    Key? key,
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.company,
    required this.category,
    required this.mobile,
    required this.email,
    required this.status,
    required this.reason,
  }) : super(key: key);

  Future<List<VisitorLog>?> _handleGetVisitorLog(BuildContext context) async {
    final scanService = getService<ScanService>();

    final sc = sessionController;

    final token = sc.token.trim();

    final result = await withSnackbar(
        context: context,
        callbackWithException: () async {
          return await scanService.getVisitorLog(
            token: token,
            visitorId: id,
          );
        });

    return result.value;
  }

  @override
  Widget build(BuildContext context) {
    var statusColors = Colors.green;

    if (status.trim() == "P") {
      statusColors = Colors.yellow;
    } else if (status.trim() == "D") {
      statusColors = Colors.red;
    }

    return Screen(
      scroll: false,
      header: Header(
        title: "Visitor Details",
        backgroundColor: Colors.white,
        showBack: true,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child:SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 30.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
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
                            fontSize: 25.sp,
                            letterSpacing: 0.5.sp,
                            color: statusColors,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 70.w,
                              backgroundImage: NetworkImage(photoUrl),
                              backgroundColor: Colors.transparent,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: Text(
                                name,
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
                            Visibility(
                              visible: company.isNotEmpty,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                child: Text(
                                  company,
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
                            ),
                            Visibility(
                              visible: mobile.isNotEmpty,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                child: Text(
                                  mobile,
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
                            ),
                            Visibility(
                              visible: email.isNotEmpty,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                child: Text(
                                  email,
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
                            ),
                            Visibility(
                              visible: reason.isNotEmpty,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                child: Text(
                                  reason,
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
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: Text(
                                category,
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  letterSpacing: 0.5.sp,
                                  color: descriptionColor,
                                  fontWeight: FontWeight.normal,
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
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 30.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: FutureBuilder<List<VisitorLog>?>(
                    future: _handleGetVisitorLog(context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<VisitorLog>? data = snapshot.data;
                        return ListView.builder(
                            itemCount: data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        data![index].currentZone,
                                        textScaleFactor: 1.0,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          letterSpacing: 0.5.sp,
                                          color: descriptionColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        _buildDate(data![index].updatedAt),
                                        textScaleFactor: 1.0,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          letterSpacing: 0.5.sp,
                                          color: descriptionColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        data[index].deviceType == "check_in"
                                            ? "Check In"
                                            : "Check Out",
                                        textScaleFactor: 1.0,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          letterSpacing: 0.5.sp,
                                          color: descriptionColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Text(
                            "Log records not available",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 16.sp,
                              letterSpacing: 0.5.sp,
                              color: descriptionColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _buildDate(String updatedAt) {
    if (updatedAt.isEmpty) {
      return "";
    }

    final date = DateTime.parse(updatedAt);

    return DateFormat('MMM yyyy hh:mm').format(date);
  }
}
