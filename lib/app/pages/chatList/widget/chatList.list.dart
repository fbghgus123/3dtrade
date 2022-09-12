import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../chatList.controller.dart';

class ChatList extends GetWidget<ChatListController> {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatListcontroller = Get.put(ChatListController());

    return Obx(() => ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: chatListcontroller.chatRoomList.length,
      itemBuilder: (BuildContext context, int index) {
        return chatListcontroller.chatRoomList[index];
      },
    ));
  }
}
