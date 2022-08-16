import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.paths.dart';
import 'home.controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  @override
  Widget builder() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPaths.main);
                  },
                  child: const Text('메인 페이지'))),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppPaths.product);
                  },
                  child: const Text('상품 상세 페이지'))),
        ],
      ),
    );
  }
}
