// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:

import '../../controller/router_controller.dart';
import '../../interface/app_route.dart';
import '../../modules/dismiss_keyboard.dart';
import '../../utils/route_helpers.dart';

class RouteNotFoundException implements Exception {
  final String path;

  RouteNotFoundException(this.path);

  @override
  String toString() {
    return "No registered route was found to handle '$path'";
  }
}

class AppRouter extends StatelessWidget {
  final RouterController routerController = Get.find();

  final List<AppRoute> routes;
  final String initialRoute;

  AppRouter({
    Key? key,
    required this.routes,
    required this.initialRoute,
  }) : super(key: key);

  NavigatorObserver get _dismissKeyboardListener =>
      DismissKeyboardNavigationObserver();

  List<NavigatorObserver> get _observers => [
        _dismissKeyboardListener,
        routerController,
      ];

  RouteTransitionsBuilder get _transitionsBuilder {
    return (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        ),
        child: child,
      );
    };
  }

  Duration get _transitionDuration => const Duration(milliseconds: 350);

  AppRoute _getRouteWidgetBuilder(String path) {
    AppRoute? selectedRoute;

    for (final route in routes) {
      final pathTemplate = route.path;

      if (!isRouteMatch(
        pathTemplate: pathTemplate,
        path: path,
      )) continue;

      selectedRoute = route;

      break;
    }

    if (selectedRoute == null) {
      throw RouteNotFoundException(path);
    }

    return selectedRoute;
  }

  Route<dynamic> _getPageRoute({
    RouteSettings? routeSettings,
    String? path,
  }) {
    final safePath = routeSettings?.name ?? path ?? "";

    assert(safePath != "");

    final route = _getRouteWidgetBuilder(safePath);

    final routeBuilder = PageRouteBuilder(
      settings: routeSettings,
      transitionDuration: _transitionDuration,
      transitionsBuilder: _transitionsBuilder,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        Map<String, dynamic> pathParams = getRouteParams(
          pathTemplate: route.path,
          path: safePath,
        );

        if (routeSettings != null &&
            routeSettings.arguments != null &&
            routeSettings.arguments is Map) {
          pathParams = {
            ...pathParams,
            ...(routeSettings.arguments as Map),
          };
        }

        final child = route.contentBuilder(pathParams)(context);

        return child;
      },
    );

    return routeBuilder;
  }

  Route<dynamic> _handleGenerateRouteFactory(RouteSettings settings) {
    return _getPageRoute(routeSettings: settings);
  }

  List<Route<dynamic>> _handleGenerateInitialRoutes(
    NavigatorState navigator,
    String initialRoute,
  ) {
    return [_getPageRoute(path: initialRoute)];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: _handleGenerateRouteFactory,
      onGenerateInitialRoutes: _handleGenerateInitialRoutes,
      initialRoute: initialRoute,
      observers: _observers,
    );
  }
}
