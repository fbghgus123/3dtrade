import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/pages/register/register.controller.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class InsertContentWidget extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller.contentController,
        keyboardType: TextInputType.multiline,
        maxLines: 15,
        style: Fonts.w400(18),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "판매 상품에 대한 상세 정보를 입력해주세요.",
            hintStyle: Fonts.subText(18)),
      ),
    );
  }
}
