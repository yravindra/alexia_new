// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MirrorAnimation<double>(
      curve: Curves.easeInOutSine,
      tween: Tween<double>(begin: -20, end: 20),
      duration: const Duration(seconds: 7),
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/logo.png",
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/logo_1.png",
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "Alexia Global",
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 18.sp,
                letterSpacing: 0.5.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
