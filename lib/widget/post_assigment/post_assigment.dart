import 'package:alexia/modules/theme.dart';
import 'package:alexia/widget/screen/screen.dart';
import 'package:alexia/widget/small_app_bar/small_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostAssigment extends StatelessWidget {
  final String textHeader, textDesciption, textDate;
  final ImageIcon icon;

  const PostAssigment(
      {Key? key,
      required this.textHeader,
      required this.textDesciption,
      required this.textDate,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
        scroll: true,
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: icon,
                      flex: 3,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Text(
                            textHeader,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(textDesciption),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            textDate,
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
