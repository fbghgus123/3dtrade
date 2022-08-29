import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/chatting.firebase.db.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  UserController user = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  logout() {
    Get.back();
  }

  trigger() async {
    ChattingFirebaseDB chatDB = ChattingFirebaseDB();
    // print(await chatDB.isExistChattingRoom("-NATf73rldKbhse-R1VW"));
    // Map<String, dynamic> data = {
    //   "roomKey": "NAdq0Sn1C5vKeH7XAQA",
    //   "productKey": "-NATf73rldKbhse-R1VW",
    //   "uid": "kakao:2395319630",
    // };
    // chatDB.createChattingUser(data);
    // chatDB.createChattingRoom(data);
    print(
        await chatDB.existChatting("-NATf73rldKbhse-R1VW", "kakao:2395319610"));
  }
}
