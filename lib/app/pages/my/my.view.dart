import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/my/Widget/my.header.dart';
import 'package:tradeApp/app/pages/my/Widget/my.info.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'my.controller.dart';

class MyView extends GetWidget<MyController> {
  const MyView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Header(headerContent: const MyHeader(), child:
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              MyInfo(),
            ],
          ),
        )
        , height: 70);
  }
}
