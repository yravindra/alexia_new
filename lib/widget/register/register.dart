import 'package:alexia/controller/router_controller.dart';
import 'package:alexia/routes/login.dart';
import 'package:alexia/widget/register/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../modules/theme.dart';
import '../my_seperator.dart';
import '../screen/screen.dart';
import '../social_login/social_login_form.dart';

class Register extends StatelessWidget {
  final RouterController routerController = Get.find();

  Register({Key? key}) : super(key: key);


  _handleLoginCall(BuildContext context){
    return () {
      return routerController.navigate(
        path: LoginRoute.ROUTE,
        replace: true,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      scroll: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Create Account",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 34.sp,
              letterSpacing: 4.5.sp,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Please sign up to continue.",
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 12.sp,
              letterSpacing: 0.5.sp,
              color: descriptionColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RegistrationForm(),
          SizedBox(
            height: 15.h,
          ),
          const MySeparator(
            color: Color(0xffADADAD),
          ),
          SizedBox(
            height: 15.h,
          ),
          const SocialLoginForm(),
          InkWell(
            onTap: _handleLoginCall(context),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 25.h,
                  horizontal: 10.w,
                ),
                child: Text(
                  "Already have a account? Login",
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    letterSpacing: 0.5.sp,
                    color: descriptionColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
