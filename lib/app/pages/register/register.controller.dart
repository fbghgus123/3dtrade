import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:tradeApp/app/pages/register/widget/register.category.dialog.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';

class RegisterController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController contentController;
  late ProductFirebaseDB productFirebaseDB;
  late FirebaseStorageController productFirebaseStorage;
  RxString category = RxString("");
  RxList<AssetEntity> images = RxList();
  UserController userController = Get.find();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    priceController = TextEditingController();
    contentController = TextEditingController();
    productFirebaseDB = ProductFirebaseDB();
    productFirebaseStorage = FirebaseStorageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// 카테고리 선택
  getCategory(BuildContext context) async {
    final data = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: categorySelectionDialog(context),
            insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
          );
        });
    if (data != null) category!.value = data;
  }

  /// DB에 업로드
  registerProduct() {
    /// Todo :: 데이터 validation 필요

    Map<String, dynamic> data = {
      "images": [],
      "title": titleController.text,
      "category": category.value,
      "content": contentController.text,
      "price": int.parse(priceController.text),
      "seller": userController.uid,
      "date": DateTime.now().toString()
    };

    /// 이미지 업로드 구간

    final pushRef = productFirebaseDB.pushRef;
    images.value.asMap().forEach((index, image) {
      String path = "product/${pushRef.key}/${index}.png";
      productFirebaseStorage.pushProductImage(image, path); // firebase storage
      data["images"].add(path); // firebase database data
    });

    /// DB 업로드 구간
    final productData = ProductData(data);
    productFirebaseDB.insertProduct(productData);

    Get.back();
  }
}
