// Flutter imports:
import 'package:alexia/widget/course_details/course_detail.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class CourseRoute implements AppRoute {
  static const ROUTE = "/course";

  @override
  String get path => CourseRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => CourseDetails();
    // return (BuildContext context) => Profile();
  }

  @override
  bool get navbarVisible => false;
}
