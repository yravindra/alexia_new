// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adaptive extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    Widget? child,
  ) builder;

  const Adaptive({
    Key? key,
    required this.builder,
  }) : super(key: key);

  Size get designSize => const Size(375, 667);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: builder,
    );
  }
}
