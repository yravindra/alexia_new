// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/splash/splash.dart';


@injectable
class SplashRoute implements AppRoute {
  static const ROUTE = "/splash";

  @override
  String get path => SplashRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => Splash();
  }

  @override
  bool get navbarVisible => false;
}
