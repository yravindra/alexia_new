// Flutter imports:
import 'package:alexia/widget/intro/intro_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class IntroRoute implements AppRoute {
  static const ROUTE = "/intro";

  @override
  String get path => IntroRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) =>  IntroScreen();
  }

  @override
  bool get navbarVisible => false;
}
