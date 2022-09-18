import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/chatting.firebase.db.dart';

import '../../model/chatUser.dart';

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
    final productDB = ProductFirebaseDB();
    await productDB.searchProduct("우리");
  }
}
