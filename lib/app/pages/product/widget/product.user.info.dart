import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/product/product.controller.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class ProductUserInfo extends GetWidget<ProductController> {
  const ProductUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  /// 프로필 이미지
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),

                  /// 유저 닉네임
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.displayName.value,
                      style: Fonts.w400(18),
                    ),
                  ),
                ],
              ),
            ),
            Divider()
          ],
        ));
  }
}
