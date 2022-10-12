import 'package:alexia/modules/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Courses extends StatelessWidget {
  final String subject, fetured, star, likes;
  final Icon editIcon, iocn;

  const Courses(
      {Key? key,
      required this.subject,
      required this.fetured,
      required this.star,
      required this.likes,
      required this.editIcon,
      required this.iocn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              "Course",
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
          color: Colors.pink.shade50,
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.topRight, child: Icon(Icons.pan_tool)),
              Text(
                subject,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                fetured,
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  Text(
                    star,
                  ),
                  const Icon(Icons.heart_broken),
                  Text(
                    star,
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              "Extra Classes",
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
      ],
    );
  }
}
