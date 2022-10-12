import 'package:alexia/modules/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      color: primaryColor,
      padding: EdgeInsets.symmetric(vertical: 20.h),
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
          SizedBox(height: 5.h),
          Text(
            "San Francisco, CA",
            textScaleFactor: 1.0,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              letterSpacing: 0.5.sp,
              color: accentColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
