// ignore_for_file: overridden_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;
  AuthMiddleware({this.priority});

  @override
  RouteSettings? redirect(String? route) {
    UserController user = Get.find();
    // prevent page access if not logged in
    if (!user.isLogined.value) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }
}
