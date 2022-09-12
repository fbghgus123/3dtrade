import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatList.controller.dart';
import './widget/chatList.header.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/chatList/widget/chatList.list.dart';

class ChatListView extends GetWidget<ChatListController> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
        headerContent: const ChatListHeader(),
        child: Expanded(child: ChatList()),
        height: 70);

    //   Stack(
    //   children: const [
    //     ChatListHeader(),
    //     ChatList()
    //   ],
    // );
  }
}
