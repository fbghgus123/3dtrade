import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatting.controller.dart';

class ChattingView extends GetResponsiveView<ChattingController> {
  @override
  Widget builder() {
    return Scaffold(body: Text("채팅창"));
  }
}
