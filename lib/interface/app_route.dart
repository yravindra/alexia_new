// Flutter imports:
import 'package:flutter/material.dart';

abstract class AppRoute {
  String get path;

  WidgetBuilder contentBuilder(Map<String, dynamic> params);

  bool get navbarVisible;
}
