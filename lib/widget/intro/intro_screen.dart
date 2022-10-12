import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/router_controller.dart';
import '../../modules/theme.dart';
import '../../routes/login_with.dart';

class IntroScreen extends StatelessWidget {
  final RouterController routerController = Get.find();

  IntroScreen({Key? key}) : super(key: key);

  _handleGetStart(BuildContext context) {
    return () {
      routerController.navigate(
        path: LoginWithRoute.ROUTE,
        replace: true,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      createSafeArea: false,
      padding: EdgeInsets.zero,
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 1],
            colors: [
              Color(0xff7455F7),
              Color(0xff8F38FF),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset(
              "assets/intro_1.png",
              width: 270.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                left: 30.w,
                right: 30.w,
              ),
              child: Text(
                "Discover your next skill Learn anything you want!",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.sp,
                  letterSpacing: 0.5.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                left: 50.w,
                right: 50.w,
              ),
              child: Text(
                "Discover the things you want to learn and grow with them",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  letterSpacing: 0.5.sp,
                  color: Colors.white.withOpacity(0.50),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: accentColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 70.w,
                  vertical: 10.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: primaryColor,
                ),
              ),
              onPressed: _handleGetStart(context),
            ),
          ],
        ),
      ),
    );
  }
}
