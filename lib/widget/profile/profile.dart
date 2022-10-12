import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/profile/profile_header.dart';
import 'package:alexia/widget/profile/profile_option_child.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: const ProfileHeader(),
      scroll: true,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "My Account",
                    textHeaders1: "Make changes to your account",
                    sufix_icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "Wallet",
                    textHeaders1: "Manage your saved account",
                    sufix_icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "textHeaders",
                    textHeaders1: "Further secure your account for safety",
                    sufix_icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "textHeaders",
                    textHeaders1: "Further secure your account for safety",
                    sufix_icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "More",
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19.sp,
                    letterSpacing: 0.5.sp,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "textHeaders",
                    textHeaders1: "textHeaders1",
                    sufix_icon: const Icon(Icons.arrow_forward_ios),
                  ),
                  ProfileOptionChild(
                    prefix_icon: const Icon(Icons.abc),
                    textHeaders: "textHeaders",
                    textHeaders1: "textHeaders1",
                    sufix_icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
