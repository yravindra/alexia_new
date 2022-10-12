import 'package:alexia/widget/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOptionChild extends StatelessWidget {
  final Icon prefix_icon, sufix_icon;
  final String textHeaders, textHeaders1;

  ProfileOptionChild(
      {Key? key,
      required this.prefix_icon,
      required this.textHeaders,
      required this.textHeaders1,
      required this.sufix_icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 10.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: prefix_icon,
            flex: 2,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textHeaders,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(textHeaders1),
              ],
            ),
          ),
          Expanded(
            child: sufix_icon,
            flex: 1,
          )
        ],
      ),
    );
  }
}
