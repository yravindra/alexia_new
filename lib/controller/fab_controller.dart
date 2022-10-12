// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';


// Project imports:
import '../utils/get_logger.dart';


typedef OneOfBuilder = WidgetBuilder Function(VoidCallback);

final WidgetBuilder defaultBuilder = (BuildContext context) => Container();

class FABController extends GetxController {
  final Rx<WidgetBuilder> _fabBuilder = defaultBuilder.obs;

  bool get canBuild => _fabBuilder.value != defaultBuilder;

  WidgetBuilder get widgetBuilder => _fabBuilder.value;

  void _logThis() {
    final logger = getLogger();

    logger.d({
      "fabBuilder": _fabBuilder.toString(),
    });
  }

  set fabBuilder(WidgetBuilder widgetBuilder) {
    final logger = getLogger();

    logger.d({"widgetBuilder": widgetBuilder.toString()});

    _fabBuilder.value = widgetBuilder;

    _logThis();
  }

  void clear() {
    _fabBuilder.value = defaultBuilder;

    _logThis();
  }
}
