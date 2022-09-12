import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';
import '../chatList.controller.dart';

class ChatListHeader extends GetWidget<ChatListController> {
  const ChatListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "채팅",
          style: Fonts.w700(24),
        ),
        const Icon(Icons.notifications_none_outlined, size: 36.0),
      ]),
    );
  }
}
