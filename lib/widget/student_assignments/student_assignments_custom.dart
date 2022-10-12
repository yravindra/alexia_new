import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentAssignments extends StatelessWidget {
  final ImageIcon icon;
  final String university, ddMMyy;

  const StudentAssignments(
      {Key? key,
      required this.icon,
      required this.university,
      required this.ddMMyy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
                child: Align(alignment: Alignment.centerLeft, child: icon)),
            Text(university,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                )),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight, child: Text(ddMMyy))),
          ],
        ),

      ),
    );
  }
}
