// Flutter imports:
import 'package:alexia/widget/register/register.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class RegistrationRoute implements AppRoute {
  static const ROUTE = "/register";

  @override
  String get path => RegistrationRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => Register();
  }

  @override
  bool get navbarVisible => false;
}
