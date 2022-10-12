// Flutter imports:
import 'package:alexia/widget/forget_password/forget_password.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class ForgetPasswordRoute implements AppRoute {
  static const ROUTE = "/forget_password";

  @override
  String get path => ForgetPasswordRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) =>  ForgetPassword();
  }

  @override
  bool get navbarVisible => false;
}
