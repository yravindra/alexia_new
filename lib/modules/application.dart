// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/modules/routes.dart';
import 'package:alexia/modules/theme.dart';

import '../controller/fab_controller.dart';
import '../controller/router_controller.dart';
import '../controller/session_controller.dart';
import '../interface/app_route.dart';
import '../interface/services/storage_service.dart';
import '../widget/adaptive/adaptive.dart';
import '../widget/app_router/app_router.dart';
import '../widget/navbar/navbar.dart' as nav_bar;
import '../widget/navbar/navitem.dart';

@lazySingleton
class Application extends StatelessWidget {
  final FABController fabController;
  final SessionController sessionController;
  final RouterController routerController;

  final StorageService storage;
  final List<NavItem> navItems;
  final String initialRoute;
  final List<AppRoute> routes;

  Application({
    required this.storage,
    required this.routes,
    required this.navItems,
    @initial_route required this.initialRoute,
  })  : fabController = Get.put(FABController()),
        sessionController = Get.put(SessionController(storage: storage)),
        routerController = Get.put(RouterController(
          initialRoute: initialRoute,
          routes: routes,
        ));

  String get appTitle => "Alexia";

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryColor,
      accentColor: accentColor,
      errorColor: errorColor,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  Widget? _buildBottomNavigation(bool show) {
    if (!show) return null;

    return nav_bar.NavigationBar(
      items: navItems,
      backgroundColor: navBarBackgroundColor,
      labelFontSize: 14,
      selectedItemColor: navBarSelectedColor,
      unselectedItemColor: navBarUnSelectedColor,
    );
  }

  Widget? _buildFab(BuildContext context, bool show) {
    if (!show) return null;

    final widget = fabController.widgetBuilder(context);

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Adaptive(
      builder: (context, child) => MaterialApp(
        title: appTitle,
        theme: _buildThemeData(context),
        home: WillPopScope(
          onWillPop: routerController.handleWillPopScope,
          child: Obx(
                () {
              final canBuildFab = fabController.canBuild;

              final hasActiveProperty = sessionController.hasActiveProperty;

              return Scaffold(
                backgroundColor: Colors.white,
                body: AppRouter(
                  routes: routes,
                  initialRoute: initialRoute,
                ),
                bottomNavigationBar: _buildBottomNavigation(hasActiveProperty),
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
                floatingActionButton: _buildFab(context, canBuildFab),
              );
            },
          ),
        ),
      ),
    );
  }
}
