import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/pages/register/register.controller.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class InsertTitleWidget extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: TextField(
            controller: controller.titleController,
            style: Fonts.w600(24),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "제목",
                hintStyle: Fonts.hintText(24)),
          ),
        ),
        Divider()
      ],
    );
  }
}
