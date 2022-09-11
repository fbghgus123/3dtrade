import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/chatting/chatting.controller.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class ChattingInsertBar extends GetWidget<ChattingController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Colors.white,
            child: TextField(
              controller: controller.textController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onTap: () {
                controller.scrollAnimate(context);
              },
              style: Fonts.w400(18),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "메세지를 입력하세요",
                  hintStyle: Fonts.subText(18)),
            ),
          ),
        ),
        Container(
          color: Colors.green,
          child: IconButton(
              onPressed: () {
                controller.sendMessage();
              },
              icon: Icon(Icons.send)),
        )
      ],
    );
  }
}
