import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/controllers/user.controller.dart';
import 'package:tradeApp/app/model/chattingRoom.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/chatting.firebase.db.dart';

class ChattingController extends GetxController {
  late UserController user;
  late TextEditingController textController;
  ChattingRoom? chattingRoom;

  final _userDB = UserFirebaseDB();
  final firebaseStorageController = FirebaseStorageController();
  final chattingController = ChattingFirebaseDB();
  final roomKey = Get.arguments["key"];

  bool isFirstMessage = Get.arguments["isNew"];

  @override
  void onInit() async {
    super.onInit();
    textController = TextEditingController();
    final tmp = await chattingController.getChattingRoom(roomKey);
    if (tmp == null) Get.back();
    chattingRoom = tmp!;
    user = Get.find();
  }

  sendMessage() async {
    // 첫 메세지인 경우 채팅 유저 추가하는 작업
    if (isFirstMessage) {
      // 판매자 채팅 유저 추가
      chattingController.createChattingUser({
        "productKey": chattingRoom!.productKey,
        "roomKey": roomKey,
        "uid": chattingRoom!.sellerUid
      });
      // 구매자 채팅 유저 추가
      chattingController.createChattingUser({
        "productKey": chattingRoom!.productKey,
        "roomKey": roomKey,
        "uid": user.uid,
      });
      isFirstMessage = false;
    }

    Map<String, dynamic> chat = {
      "uid": user.uid,
      "message": textController.text,
      "roomKey": roomKey,
    };
    chattingController.createMessage(chat);
  }
}
