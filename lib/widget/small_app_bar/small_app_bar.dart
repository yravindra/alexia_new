import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/routes/course.dart';
import 'package:alexia/routes/homework.dart';
import 'package:alexia/routes/profile.dart';
import 'package:alexia/routes/splash.dart';
import 'package:alexia/widget/course_details/courses.dart';
import 'package:alexia/widget/home_work/home_completed.dart';
import 'package:alexia/widget/home_work/home_upcomming.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';

import '../../controller/router_controller.dart';
import '../../modules/theme.dart';
import '../post_assigment/post_assigement_custom.dart';

class SmallAppBar extends StatelessWidget {
  SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();
  final String pageName;

  SmallAppBar({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Screen(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          buildAppBar(""),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.2,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.2 - 50,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            pageName,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      //this for search button and field
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            height: 54,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 10),
                                    blurRadius: 50,
                                    color: primaryColor.withOpacity(0.23))
                              ],
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: primaryColor.withOpacity(0.23),
                                  ),
                                  hintText: ' Find the perfect course for you',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          )),
                    ],
                  ),
                ),
                const PostAssigmentCustom(),
                // CompletedHomeWork(
                //     personIcon: SvgPicture.asset(
                //       "assets/happyface.svg",
                //       height: 24,
                //       width: 24,
                //       allowDrawingOutsideViewBox: true,
                //     ),
                //     done: SvgPicture.asset(
                //       "assets/happyface.svg",
                //       height: 24,
                //       width: 24,
                //       allowDrawingOutsideViewBox: true,
                //     ),
                //     subject: 'Mathamatic',
                //     completed: 'Completed'),
                // UpcommingHomeWork(
                //     upload: SvgPicture.asset(
                //       "assets/happyface.svg",
                //       height: 24,
                //       width: 24,
                //       allowDrawingOutsideViewBox: true,
                //     ),
                //     subject: 'Mathematics',
                //     date: '22-22-2222'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(String pageName) {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      leading: IconButton(
        onPressed: () => _goToProfile(),
        icon: const Icon(
          Icons.menu_outlined,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: _handleLogout(),
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _handleLogout() {
    return () {
      sessionController.logout();

      routerController.navigate(
        path: SplashRoute.ROUTE,
        replace: true,
      );
    };
  }

  _goToProfile() {
    return routerController.navigate(
      path: HomeworkRoute.ROUTE,
      replace: true,
    );
  }
}
