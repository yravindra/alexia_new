//Flutter Import:

import 'package:anim_search_app_bar/anim_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/modules/theme.dart';
import 'package:alexia/routes/visitor_details.dart';

import '../../controller/router_controller.dart';
import '../../interface/scan_visitor.dart';
import '../../interface/services/scan_service.dart';
import '../../utils/get_service.dart';
import '../screen/screen.dart';

class SearchVisitor extends StatelessWidget {
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();
  final TextEditingController searchController = TextEditingController();

  SearchVisitor({Key? key}) : super(key: key);

  Future<List<ScanVisitor>> _handleSearch(
    BuildContext context,
    String query,
  ) async {
    final scanService = getService<ScanService>();

    final sc = sessionController;

    final token = sc.token.trim();

    final result = await scanService.getScanVisitorSearchList(
      token: token,
      name: query,
      page: 1,
      limit: 10,
    );

    return result;
  }

  Widget _buildList(BuildContext context) {
    return Obx(
      () {
        final visitors = sessionController.searchVisitors;

        return Column(
          children: [
            SizedBox(height: 20.h),
            for (int i = 0; i < visitors.length; i++)
              GestureDetector(
                onTap: _handleUserDetails(visitors[i]),
                child: _buildVisitor(visitors[i]),
              ),
          ],
        );
      },
    );
  }

  _handleUserDetails(ScanVisitor visitor) {
    return () {
      final photoUrl = visitor.photoUrl.contains("localhost")
          ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
          : visitor.photoUrl;

      final name = visitor.name;
      final company = visitor.company;
      final category = visitor.category;
      final mobile = visitor.mobile;
      final email = visitor.email;
      final id = visitor.uniqueCode;
      final status = visitor.status;
      final banReason = visitor.banReason;

      return routerController.navigate(
        path: VisitorDetailsRoute.ROUTE,
        replace: false,
        arguments: {
          VisitorDetailsRoute.PARAM_NAME: name,
          VisitorDetailsRoute.PARAM_CATEGORY: category,
          VisitorDetailsRoute.PARAM_COMPANY: company,
          VisitorDetailsRoute.PARAM_EMAIL: email,
          VisitorDetailsRoute.PARAM_MOBILE: mobile,
          VisitorDetailsRoute.PARAM_PHOTO: photoUrl,
          VisitorDetailsRoute.PARAM_ID: id,
          VisitorDetailsRoute.PARAM_STATUS: status,
          VisitorDetailsRoute.PARAM_REASON: banReason,
        },
      );
    };
  }

  _buildVisitor(ScanVisitor visitor) {
    final photoUrl = visitor.photoUrl.contains("localhost")
        ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
        : visitor.photoUrl;

    final name = visitor.name;
    final company = visitor.company;
    final category = visitor.category;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            radius: 50.w,
            backgroundImage: NetworkImage(photoUrl),
            backgroundColor: Colors.transparent,
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: Text(
                  name,
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.left,
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
                  vertical: 5.h,
                ),
                child: Text(
                  company,
                  textAlign: TextAlign.left,
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
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            child: Text(
              category,
              textScaleFactor: 1.0,
              textAlign: TextAlign.left,
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
        SizedBox(width: 5.w),
      ],
    );
  }

  Future<void> _initState(BuildContext context) async {
    final visitors = await _handleSearch(context, "");
    sessionController.setSearchVisitors(visitors);
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: EdgeInsets.zero,
      scroll: true,
      initState: _initState,
      header: AnimSearchAppBar(
        backgroundColor: Colors.white,
        cancelButtonText: "Cancel",
        cancelButtonTextStyle: const TextStyle(color: descriptionColor),
        hintText: 'Search for visitor by name.',
        cSearch: searchController,
        onChanged: (query) async {
          final visitors = await _handleSearch(context, query);
          sessionController.setSearchVisitors(visitors);
        },
        appBar: AppBar(
          foregroundColor: descriptionColor,
          title: const Text(
            'Search Visitor',
            style: TextStyle(color: descriptionColor),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
        ),
        child: _buildList(context),
      ),
    );
  }
}
