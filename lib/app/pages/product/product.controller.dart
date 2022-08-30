import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/model/user.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/chatting.firebase.db.dart';

class ProductController extends GetxController {
  late ProductData data;
  late UserData user;
  RxString displayName = "".obs;
  ProductController(this.data);

  final _userDB = UserFirebaseDB();
  final firebaseStorageController = FirebaseStorageController();
  final chattingController = ChattingFirebaseDB();

  @override
  void onInit() async {
    super.onInit();
    user = await _userDB.getUser(data.seller!) ?? user.empty();
    displayName.value = user.displayName;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<String?> getFileURL(String path) async {
    return await firebaseStorageController.getFileURL(path);
  }

  /**
   * 채팅으로 거래하기 클릭시 채팅방으로 이동하는 메서드
   */
  joinRoom() async {
    String? productKey = data.key;
    String uid = user.uid;

    print(productKey);
    print(uid);

    // 기존 채팅이 있을 경우
    if (await chattingController.existChatting(productKey!, uid)) {
      print("기존 채팅방");
      Get.toNamed(AppPaths.chatting,
          arguments: {"key": chattingController.existChatKey, "isNew": false});
    }
    // 새로운 채팅일 경우
    else {
      print("신규 채팅방");
      Map<String, dynamic> roomData = {
        "productKey": productKey,
        "sellerUid": data.seller,
      };
      await chattingController.createChattingRoom(roomData);
      Get.toNamed(AppPaths.chatting, arguments: {
        "key": chattingController.chattingRoomKey,
        "isNew": true
      });
    }
  }
}
