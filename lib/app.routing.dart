import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

import 'app/bindings/app.bindings.dart';
import 'app/pages/home/home.binding.dart';
import 'app/pages/home/home.view.dart';
import 'package:tradeApp/app/pages/main/main.binding.dart';
import 'package:tradeApp/app/pages/main/main.view.dart';
import 'package:tradeApp/app/pages/product/product.binding.dart';
import 'package:tradeApp/app/pages/product/product.view.dart';

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
    GetPage(
        name: AppPaths.product,
        page: () => ProductView(),
        binding: ProductBinding(),
        middlewares: []),
  ];
}
