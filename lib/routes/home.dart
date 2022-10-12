// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/home/home.dart';

@injectable
class HomeRoute implements AppRoute {
  static const ROUTE = "/home";

  @override
  String get path => HomeRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => Home();
  }

  @override
  bool get navbarVisible => false;
}
