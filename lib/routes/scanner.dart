// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/scanner/scanner.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/home/home.dart';

@injectable
class ScannerRoute implements AppRoute {
  static const ROUTE = "/scanner";

  @override
  String get path => ScannerRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => Scanner();
  }

  @override
  bool get navbarVisible => false;
}
