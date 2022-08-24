import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatList.controller.dart';
import 'package:tradeApp/app/widget/header.dart';

class ChatListView extends GetWidget<ChatListController> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      height: 100,
      headerContent: const Text("채팅 헤더"),
      child: Text("내용"),
    );
  }
}
