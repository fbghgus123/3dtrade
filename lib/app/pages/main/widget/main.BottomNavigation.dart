import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.paths.dart';
import '../main.controller.dart';

/**
 * 메인 BottomNavigationBar
 */
BottomNavigationBar bottomNavigationBar() {
  MainController controller = Get.put(MainController());
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
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
        icon: Icon(Icons.add_circle),
        label: "등록",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble),
        label: "채팅",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "내정보",
      ),
    ],
    currentIndex: controller.indexNum.value,
    onTap: (int index) {
      if (index == 1) {
        Get.toNamed(AppPaths.search);
      } else if (index == 2) {
        Get.toNamed(AppPaths.register);
      } else {
        controller.indexNum.value = index;
      }
    },
  );
}
