// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';

class NavItem {
  final String route;
  final String icon;
  final String label;

  NavItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}

class NavBarItem extends StatelessWidget {
  final String label;
  final String icon;
  final bool active;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle selectedLabelStyle;
  final TextStyle unselectedLabelStyle;
  final Duration animationDuration;
  final VoidCallback onPressed;
  final double? size;
  final double labelFontSize;

  NavBarItem({
    Key? key,
    required this.label,
    required this.icon,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedLabelStyle = const TextStyle(),
    this.unselectedLabelStyle = const TextStyle(),
    this.active = false,
    this.animationDuration = const Duration(milliseconds: 500),
    this.size,
    this.labelFontSize = 8.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 8.h,
        left: 8.w,
        right: 8.w,
      ),
      child: PlayAnimation<Color?>(
        duration: animationDuration,
        tween: (active
            ? ColorTween(
                begin: unselectedItemColor,
                end: selectedItemColor,
              )
            : ColorTween(
                begin: selectedItemColor,
                end: unselectedItemColor,
              )),
        builder: (context, child, value) {
          final baseStyle =
              active ? selectedLabelStyle : unselectedLabelStyle;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                color: value,
                height: size,
              ),
              SizedBox(height: 8.h),
              Text(
                label,
                textScaleFactor: 1.0,
                style: baseStyle.copyWith(
                  color: value,
                  fontSize: labelFontSize.sp,
                  fontWeight: active ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
