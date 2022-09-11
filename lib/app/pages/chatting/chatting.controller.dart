import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

import 'package:tradeApp/app/controllers/user.controller.dart';
import 'package:tradeApp/app/model/chattingRoom.dart';
import 'package:tradeApp/app/model/message.dart';
import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/chatting.firebase.db.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';

class ChattingController extends GetxController {
  late UserController user;
  late TextEditingController textController;
  final scrollController = ScrollController();
  ChattingRoom? chattingRoom;
  Rx<ProductData?> productData = Rx(null);
  RxList<Widget> chat = RxList.empty();

  final _userDB = UserFirebaseDB();
  final firebaseStorageController = FirebaseStorageController();
  final chattingController = ChattingFirebaseDB();
  final productDBController = ProductFirebaseDB();
  final roomKey = Get.arguments["key"];

  bool isFirstMessage = Get.arguments["isNew"];

  @override
  void onInit() async {
    super.onInit();
    textController = TextEditingController();
    final tmp = await chattingController.getChattingRoom(roomKey);
    if (tmp == null)
      Get.back();
    else {
      chattingRoom = tmp;
      user = Get.find();
    }

    productData.value =
        await productDBController.getProduct(chattingRoom?.productKey ?? "");

    chattingController.getMessages(roomKey, (Message msg) {
      chat.add(_chatBubble(msg));
    });
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

    // 입력창에서 채팅 삭제
    textController.clear();
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn);
  }

   Future<String?> getFileURL(String? path) async {
    if (path == null) return null;
    try {
      return await firebaseStorageController.getFileURL(path);
    } catch (e) {
      return null;
    }
  }

  Widget _chatBubble(Message msg) {
    if (msg.uid == user.uid) {
      return BubbleSpecialThree(
        text: msg.message,
        color: Color(0xFF1B97F3),
        tail: false,
        textStyle: TextStyle(color: Colors.white, fontSize: 16),
      );
    }
    return BubbleSpecialThree(
      text: msg.message,
      color: Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
    );
  }

  void scrollAnimate(BuildContext context) {

  }
}
