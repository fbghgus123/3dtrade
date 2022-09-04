import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/chatting/widget/chatting.header.dart';

import 'package:tradeApp/app/widget/headerBottomBar.dart';
import './widget/chatting.chat.screen.dart';

import 'chatting.controller.dart';
import 'widget/chatting.insertBar.dart';

class ChattingView extends GetResponsiveView<ChattingController> {
  @override
  Widget builder() {
    return Scaffold(
        body: HeaderBottomBar(
      headerContent: ChattingHeader(),
      bottomContent: ChattingInsertBar(),
      child: Column(
        children: [
          SizedBox(
            height: 130,
          ),
          Expanded(child: ChattingChatScreen()),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
