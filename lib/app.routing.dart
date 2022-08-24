import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

import 'app/bindings/app.bindings.dart';
import 'app/pages/home/home.binding.dart';
import 'app/pages/home/home.view.dart';
import 'app/middleware/auth.middleware.dart';
import 'package:tradeApp/app/pages/main/main.binding.dart';
import 'package:tradeApp/app/pages/main/main.view.dart';
import 'package:tradeApp/app/pages/product/product.view.dart';
import 'package:tradeApp/app/pages/login/login.binding.dart';
import 'package:tradeApp/app/pages/login/login.view.dart';
import 'package:tradeApp/app/pages/register/register.binding.dart';
import 'package:tradeApp/app/pages/register/register.view.dart';
import 'package:tradeApp/app/pages/photoPick/photoPick.binding.dart';
import 'package:tradeApp/app/pages/photoPick/photoPick.view.dart';

class AppPages {
  AppPages._();

  static const initial = AppPaths.home;
  static final initialBinding = GlobalBinding();

  static final routes = [
    GetPage(
        name: AppPaths.home,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [
          // 미들웨어 예시용
          // AuthMiddleware()
        ]),
    GetPage(
        name: AppPaths.main,
        page: () => MainView(),
        binding: MainBinding(),
        middlewares: []),
    GetPage(name: AppPaths.product, page: () => ProductView(), middlewares: []),
    GetPage(
        name: AppPaths.login,
        page: () => LoginView(),
        binding: LoginBinding(),
        middlewares: []),
    GetPage(
        name: AppPaths.register,
        page: () => RegisterView(),
        binding: RegisterBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: AppPaths.photoPick,
        page: () => PhotoPickView(),
        binding: PhotoPickBinding(),
        middlewares: []),
  ];
}
