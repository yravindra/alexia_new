// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/search_visitor/search_visitor.dart';

// Project imports:
import '../interface/app_route.dart';

@injectable
class SearchVisitorRoute implements AppRoute {
  static const ROUTE = "/search_visitor";

  @override
  String get path => SearchVisitorRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) => SearchVisitor();
  }

  @override
  bool get navbarVisible => false;
}
