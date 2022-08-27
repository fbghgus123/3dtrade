import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/model/user.dart';
import 'package:tradeApp/app/db/user.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';

class ProductController extends GetxController {
  late ProductData data;
  late UserData user;
  RxString displayName = "".obs;
  ProductController(this.data);

  final _userDB = UserFirebaseDB();
  final firebaseStorageController = FirebaseStorageController();

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
}
