import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.controller.dart';

/**
 * 메인 BottomNavigationBar
 */
BottomNavigationBar bottomNavigationBar() {
  MainController controller = Get.put(MainController());
  return BottomNavigationBar(
    // ignore: prefer_const_literals_to_create_immutables
    items: <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "홈",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: "검색",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "내정보",
      ),
    ],
    currentIndex: controller.indexNum.value,
    onTap: (int index) {
      controller.indexNum.value = index;
    },
  );
}
