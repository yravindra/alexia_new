import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/theme.dart';

class SocialLoginForm extends StatelessWidget {
  const SocialLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/google.png",
              ),
              SizedBox(width: 10.w),
              Image.asset(
                "assets/apple.png",
              ),
              SizedBox(width: 10.w),
              Image.asset(
                "assets/fb.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
