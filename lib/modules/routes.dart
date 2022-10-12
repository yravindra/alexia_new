// Flutter imports:
// Package imports:
import 'package:alexia/routes/course.dart';
import 'package:alexia/routes/intro.dart';
import 'package:alexia/routes/profile.dart';
import 'package:alexia/routes/register.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:alexia/routes/home.dart';
import 'package:alexia/routes/scanner.dart';
import 'package:alexia/routes/search_visitor.dart';
import 'package:alexia/routes/visitor_details.dart';
import 'package:alexia/widget/splash/splash.dart';

import '../interface/app_route.dart';

// Project imports:
import '../routes/forget_password.dart';
import '../routes/homework.dart';
import '../routes/login.dart';
import '../routes/login_with.dart';
import '../routes/splash.dart';
import '../routes/visitor_profile.dart';
import '../widget/navbar/navitem.dart';

final getIt = GetIt.instance;

const initial_route = Named("INITIAL_ROUTE");

@module
abstract class AppRoutesModule {
  @lazySingleton
  List<AppRoute> get appRoutes => [
        getIt.get<SplashRoute>(),
        getIt.get<IntroRoute>(),
        getIt.get<LoginWithRoute>(),
        getIt.get<ForgetPasswordRoute>(),
        getIt.get<LoginRoute>(),
        getIt.get<ProfileRoute>(),
        getIt.get<CourseRoute>(),
        getIt.get<RegistrationRoute>(),
        getIt.get<HomeRoute>(),
        getIt.get<HomeworkRoute>(),
        getIt.get<ScannerRoute>(),
        getIt.get<VisitorProfileRoute>(),
        getIt.get<SearchVisitorRoute>(),
        getIt.get<VisitorDetailsRoute>(),
      ];

  @singleton
  List<NavItem> get navItems => [
        NavItem(
          route: SplashRoute.ROUTE,
          label: "Home",
          icon: "assets/home-icon.svg",
        ),
      ];

  @initial_route
  @singleton
  String get initialRoute => SplashRoute.ROUTE;
}
