// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/login_with/login_with.dart';

@injectable
class LoginWithRoute implements AppRoute {
  static const ROUTE = "/login_with";

  @override
  String get path => LoginWithRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => LoginWith();
  }

  @override
  bool get navbarVisible => false;
}
