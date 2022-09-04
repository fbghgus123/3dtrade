import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/chatting/chatting.controller.dart';

class ChattingChatScreen extends GetWidget<ChattingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: ListView.builder(
              itemCount: controller.chat.length,
              itemBuilder: (BuildContext ctx, int idx) {
                return controller.chat.value[idx];
              }),
        ));
  }
}
