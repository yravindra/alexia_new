// Flutter imports:
import 'package:alexia/widget/course_details/course_detail.dart';
import 'package:alexia/widget/home_work/home_work_tabcustom.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class HomeworkRoute implements AppRoute {
  static const ROUTE = "/homework";

  @override
  String get path => HomeworkRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => HomeWorkTab();
    // return (BuildContext context) => Profile();
  }

  @override
  bool get navbarVisible => false;
}
