import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/controllers/user.controller.dart';

class ChattingController extends GetxController {
  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  /// 메세지 id 생성을 위한 랜덤 String 생성 함수
  String _randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  sendMessage() {}
}
