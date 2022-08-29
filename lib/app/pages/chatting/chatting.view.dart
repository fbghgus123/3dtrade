import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/widget/headerBottomBar.dart';

import 'chatting.controller.dart';
import 'widget/chatting.insertBar.dart';

class ChattingView extends GetResponsiveView<ChattingController> {
  @override
  Widget builder() {
    return Scaffold(
        body: HeaderBottomBar(
      headerContent: Container(),
      headerHeight: 0,
      bottomContent: ChattingInsertBar(),
      bottomHeight: 100,
      child: Text("채팅창"),
    ));
  }
}
