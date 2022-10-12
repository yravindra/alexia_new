import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExtraClassCustom extends StatelessWidget {
  final ImageIcon icon;
  final String university, ddMMyy, mmHH, videoLink;

  const ExtraClassCustom(
      {Key? key,
      required this.icon,
      required this.university,
      required this.ddMMyy,
      required this.mmHH,
      required this.videoLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          icon,
          SizedBox(
            width: 10.w,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Text(
                  university,
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    Text(
                      ddMMyy,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    const Icon(Icons.watch),
                    Text(
                      mmHH,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    const Icon(Icons.video_call),
                    Text(
                      videoLink,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
