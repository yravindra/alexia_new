import 'package:alexia/modules/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../course_details/course_detail.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Image.asset(
                "assets/profile.png",
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Richard Johnson",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5.sp,
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5.h),
                  const Icon(
                    Icons.edit,
                    color: accentColor,
                  ),
                ],
              ),
            ],
          ),
          // it will take 20 % of our screen
          height: size.height * 0.2,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        //CourseDetails()
      ],
    );
  }
}
