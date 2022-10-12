// Flutter imports:
import 'package:alexia/controller/router_controller.dart';
import 'package:alexia/routes/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import '../../modules/theme.dart';
import '../../widget/screen/screen.dart';
import '../my_seperator.dart';
import 'login_form.dart';
import '../social_login/social_login_form.dart';

class Login extends StatelessWidget {
  final RouterController routerController = Get.find();

  Login({Key? key}) : super(key: key);

  _handleRegisterCall(BuildContext context){
    return () {
      return routerController.navigate(
        path: RegistrationRoute.ROUTE,
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
            "Login",
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
            "Please sign in to continue.",
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
          LoginForm(),
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
            onTap: _handleRegisterCall(context),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 25.h,
                  horizontal: 10.w,
                ),
                child: Text(
                  "New to Logistics? Sign up",
                  textScaleFactor: 1.0,
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
