import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/pages/register/register.controller.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class InsertCategoryWidget extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            GestureDetector(

                /// 카테고리 버튼 클릭 시 이벤트
                onTap: () {
                  controller.getCategory(context);
                },

                /// 카테고리 버튼
                child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.category.value == ""
                              ? "카테고리"
                              : controller.category.value,
                          style: Fonts.w600(24),
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ))),
            const Divider()
          ],
        ));
  }
}
