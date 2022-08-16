import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/main/main.controller.dart';

/**
 * 메인 페이지 상품 리스트 페이지 헤더
 */
class ProductListHeader extends GetWidget<MainController> {
  const ProductListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text(
                  "판매합니다",
                  style: Fonts.w700(24),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.search, size: 36.0),
                const SizedBox(width: 30),
                const Icon(Icons.menu, size: 36.0),
                const SizedBox(width: 30),
                const Icon(Icons.notifications_none_outlined, size: 36.0),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
