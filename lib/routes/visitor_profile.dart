// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/scanner/scanner.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/home/home.dart';
import '../widget/visitor_profile/visitor_profile.dart';

@injectable
class VisitorProfileRoute implements AppRoute {
  static const ROUTE = "/visitor_profile";

  @override
  String get path => VisitorProfileRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => VisitorProfile();
  }

  @override
  bool get navbarVisible => false;
}
