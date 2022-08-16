import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'main.controller.dart';
import 'widget/main.BottomNavigation.dart';
import 'widget/main.ProductList.dart';
import 'package:tradeApp/app/pages/my/my.view.dart';
import 'package:tradeApp/app/pages/search/search.view.dart';

class MainView extends GetResponsiveView<MainController> {
  final List _pageOption = [ProductList(), SearchView(), MyView()];
  @override
  Widget builder() {
    return Obx(() => Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: SafeArea(
          child: _pageOption.elementAt(controller.indexNum.value),
        )));
  }
}
