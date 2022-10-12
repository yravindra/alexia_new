// Flutter imports:
import 'package:alexia/widget/mainpage/main_page.dart';
import 'package:alexia/widget/post_assigment/post_assigment_form.dart';
import 'package:alexia/widget/small_app_bar/small_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:alexia/widget/login/login.dart';

// Project imports:
import '../interface/app_route.dart';
import '../widget/post_assigment/post_assigment.dart';
import '../widget/profile/profile.dart';

@injectable
class ProfileRoute implements AppRoute {
  static const ROUTE = "/profile";

  @override
  String get path => ProfileRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    // return (BuildContext context) => Profile();
    // return (BuildContext context) => PostAssigmentForm();
    return (BuildContext context) => SmallAppBar( pageName: '',);
    // return (BuildContext context) => MainPage();
  }

  @override
  bool get navbarVisible => false;
}
