import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../modules/theme.dart';

showToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 14.sp,
          letterSpacing: 0.5.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
