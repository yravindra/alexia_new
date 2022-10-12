//Flutter imports:
import 'package:flutter/material.dart';

//Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/theme.dart';

class CategoryTableHeader extends StatelessWidget {
  final double topRadius;
  final String titleOne, titleTwo, titleThree;

  const CategoryTableHeader({
    Key? key,
    this.topRadius = 0,
    this.titleOne = "Category",
    this.titleTwo = "Cat Name",
    this.titleThree = "Visitor Count",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRadius),
          topLeft: Radius.circular(topRadius),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              titleOne,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              titleTwo,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              titleThree,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
