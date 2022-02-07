import 'package:get/get.dart';
import 'package:getx_template/app/constants/app.paths.dart';
import 'package:getx_template/app/middleware/auth.middleware.dart';
import 'package:getx_template/app/pages/login/login.binding.dart';
import 'package:getx_template/app/pages/login/login.view.dart';

import 'app/bindings/app.bindings.dart';
import 'app/pages/home/home.binding.dart';
import 'app/pages/home/home.view.dart';



class AppPages {
  AppPages._();

  static const initial = AppPaths.login;
  static final initialBinding = GlobalBinding();

  static final routes = [
    GetPage(
      name: AppPaths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [
         /// Auth middleware to prevent direct access to the page
         AuthMiddleware()
      ]
    ),
    GetPage(
      name: AppPaths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
