import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/chatting/chatting.controller.dart';
import 'package:tradeApp/app/constants/app.strings.dart';

class ChattingHeader extends GetWidget<ChattingController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.keyboard_backspace))
            ],
          ),
        ),
        // Divider(),
        // if (controller.productData != null)
        //   Container(
        //     padding: EdgeInsets.only(left: 10, right: 10),
        //     height: 50,
        //     child: Row(children: [
        //       ClipRRect(
        //           borderRadius: BorderRadius.circular(10),
        //           child: Image.asset(AppStrings.defaultUserImage,
        //               fit: BoxFit.cover)),
        //       Column(
        //         children: [Text("제목"), Text("가격")],
        //       )
        //     ]),
        //   )
        // else
        //   Container(child: Text("음")),
        // Divider(),
      ],
    );
  }
}
