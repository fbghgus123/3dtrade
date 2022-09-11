import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/chatting/chatting.controller.dart';

class ChattingChatScreen extends GetWidget<ChattingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        const SizedBox(height: 140,),
        Expanded(
              child: ListView.builder(
                controller: controller.scrollController,
                  itemCount: controller.chat.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return controller.chat.value[idx];
                  }),
            ),
        const SizedBox(height: 50,)
      ],
    ));
  }
}
