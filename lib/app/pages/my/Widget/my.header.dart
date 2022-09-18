import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/my/my.controller.dart';

class MyHeader extends GetWidget<MyController> {
  const MyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text("내정보", style: Fonts.w700(24),)
        ],
      ),
    );
  }
}