import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/chatting/widget/chatting.header.dart';

import 'widget/chatting.chat.screen.dart';
import 'widget/chatting.insertBar.dart';
import 'chatting.controller.dart';

class ChattingView extends GetResponsiveView<ChattingController> {
  @override
  Widget builder() {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// 채팅 뷰 헤더
            ChattingHeader(),

            /// 채팅 메세지 창
            ChattingChatScreen(),

            /// 채팅 입력 창
            Container(
                alignment: Alignment.bottomCenter,
                height: double.infinity,
                child: ChattingInsertBar()),
          ],
        ),
      ),
    );
  }
}
