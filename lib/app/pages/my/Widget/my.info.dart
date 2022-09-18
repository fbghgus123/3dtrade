import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/my/my.controller.dart';

class MyInfo extends GetWidget<MyController> {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(controller.userController.displayName, style: Fonts.w500(18))),
      ],
    );
  }
}