// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/router_controller.dart';

// Project imports:

class Header extends StatelessWidget {
  final RouterController routerController = Get.find();
  final String? title;
  final Widget? action;
  final bool showBack;
  final Color backgroundColor;
  final EdgeInsets padding;

  Header({
    Key? key,
    this.title,
    this.action,
    this.showBack = false,
    this.backgroundColor = Colors.white,
    EdgeInsets? padding,
  })  : assert(title != null || action != null),
        padding =
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        super(key: key);

  void _handleBackPressed() {
    return this.routerController.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.infinity,
      color: backgroundColor,
      padding: padding,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Visibility(
            visible: showBack,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  color: Color(0xff37474f),
                ),
                iconSize: 32.w,
                onPressed: _handleBackPressed,
              ),
            ),
          ),
          Visibility(
            visible: title != null,
            child: Align(
              alignment:
                  showBack ? Alignment.center : Alignment.centerLeft,
              child: Text(
                title ?? "",
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color(0xff040822),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Visibility(
            visible: action != null,
            child: Align(
              alignment: Alignment.centerRight,
              child: action,
            ),
          ),
        ],
      ),
    );
  }
}
