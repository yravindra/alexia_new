// Flutter imports:
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../interface/app_route.dart';
import '../utils/get_logger.dart';
import '../utils/route_helpers.dart';

typedef ScreenChangeCallback = void Function(String, String);

class RouterController extends GetxController with NavigatorObserver {
  final List<AppRoute> routes;
  final RxString _currentRoute;
  final ScreenChangeCallback? onScreenChange;

  RouterController({
    required this.routes,
    required String initialRoute,
    this.onScreenChange,
  }) : _currentRoute = initialRoute.obs;

  void _logThis() {
    final logger = getLogger();

    logger.d({"currentRoute": _currentRoute.value});
  }

  void _sync(Route<dynamic>? route) {
    if (route == null) {
      return;
    }

    if (!route.isActive) {
      return;
    }

    _currentRoute.value = route.settings.name ?? _currentRoute.value;

    _logThis();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    _sync(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _sync(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _sync(previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _sync(previousRoute);
  }

  Future<bool> handleWillPopScope() async {
    final navigator = this.navigator;

    final canPop = navigator!.canPop();

    if (canPop) {
      navigator.pop();
    }

    return !canPop;
  }

  Future<dynamic> navigate({
    required String path,
    bool replace = false,
    bool maintainState = true,
    Map<String, dynamic> arguments = const {},
    bool clearStack = false,
  }) async {
    final logger = getLogger();

    logger.d({
      "path": path,
      "replace": replace,
      "maintainState": maintainState,
      // cannot be marshaled as constituents can/cannot be marshaled.
      // "arguments": arguments,
      "clearStack": clearStack,
    });

    final currentPath = _currentRoute.value;

    if (currentPath == path) {
      return;
    }

    final navigator = this.navigator;

    if (navigator == null) {
      return;
    }

    if(onScreenChange!=null) {
      onScreenChange!(path.removeAllWhitespace, currentPath.removeAllWhitespace);
    }

    if (clearStack) {
      return navigator.pushNamedAndRemoveUntil(path, (_) => false);
    }

    if (replace) {
      return navigator.pushReplacementNamed(path, arguments: arguments);
    }

    return navigator.pushNamed(path, arguments: arguments);
  }

  void pop({
    Map<String, dynamic> arguments = const {},
  }) {
    final navigator = this.navigator;

    final logger = getLogger();

    logger.d({
      "arguments": arguments,
    });

    if (navigator!.canPop()) {
      navigator.pop(arguments);
      return;
    }

    SystemNavigator.pop();
  }

  String get currentRoute => _currentRoute.value;

  bool isCurrent({
    String? pathTemplate,
    String? path,
    bool prefix = false,
  }) {
    final _path = path ?? _currentRoute.value;

    String? _pathTemplate = pathTemplate;

    if (_pathTemplate == null) {
      final appRoute = routes.firstWhere(
        (route) {
          return isRouteMatch(
            pathTemplate: route.path,
            path: _currentRoute.value,
            prefix: true,
          );
        },
      );

      _pathTemplate = appRoute.path;
    }

    return isRouteMatch(
      pathTemplate: _pathTemplate,
      path: _path,
      prefix: prefix,
    );
  }

  AppRoute getActiveRoute() {
    final appRoute = routes.firstWhere(
      (route) {
        return isRouteMatch(
          pathTemplate: route.path,
          path: _currentRoute.value,
          prefix: true,
        );
      },
    );

    return appRoute;
  }
}
