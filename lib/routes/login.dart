// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class LoginRoute implements AppRoute {
  static const ROUTE = "/login";

  @override
  String get path => LoginRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => Login();
  }

  @override
  bool get navbarVisible => false;
}
