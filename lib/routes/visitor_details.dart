// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';


// Project imports:
import '../interface/app_route.dart';
import '../utils/app_exception.dart';
import '../widget/visitor_detail/visitor_detail.dart';

@injectable
class VisitorDetailsRoute implements AppRoute {
  static const ROUTE = "/visitor_details";

  static const PARAM_NAME = "name";
  static const PARAM_PHOTO = "photo_url";
  static const PARAM_CATEGORY = "category";
  static const PARAM_COMPANY = "company";
  static const PARAM_EMAIL = "email";
  static const PARAM_MOBILE = "mobile";
  static const PARAM_ID = "id";
  static const PARAM_STATUS = "status";
  static const PARAM_REASON = "reason";

  @override
  String get path => VisitorDetailsRoute.ROUTE;

  @override
  WidgetBuilder contentBuilder(Map<String, dynamic> params) {
    return (BuildContext context) {
      const nameKey = VisitorDetailsRoute.PARAM_NAME;
      const photoKey = VisitorDetailsRoute.PARAM_PHOTO;
      const categoryKey = VisitorDetailsRoute.PARAM_CATEGORY;
      const companyKey = VisitorDetailsRoute.PARAM_COMPANY;
      const emailKey = VisitorDetailsRoute.PARAM_EMAIL;
      const mobileKey = VisitorDetailsRoute.PARAM_MOBILE;
      const idKey = VisitorDetailsRoute.PARAM_ID;
      const statusKey = VisitorDetailsRoute.PARAM_STATUS;
      const reasonKey = VisitorDetailsRoute.PARAM_REASON;

      if (!params.containsKey(nameKey)) {
        throw ValidationException(
          "'$nameKey' not provided as an argument",
        );
      }

      final String name = params[nameKey];
      final String category = params[categoryKey];
      final String company = params[companyKey];
      final String email = params[emailKey];
      final String mobile = params[mobileKey];
      final String photoUrl = params[photoKey];
      final String id = params[idKey];
      final String status = params[statusKey];
      final String reason = params[reasonKey];

      return VisitorDetail(
        name: name,
        category: category,
        company: company,
        email: email,
        mobile: mobile,
        photoUrl: photoUrl,
        id: id,
        status: status,
        reason: reason,
      );
    };
  }

  @override
  bool get navbarVisible => false;
}
