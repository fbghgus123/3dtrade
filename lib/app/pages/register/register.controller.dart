import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:tradeApp/app/pages/register/widget/register.category.dialog.dart';

class RegisterController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController contentController;
  RxString category = RxString("");
  RxList<AssetEntity> images = RxList();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    priceController = TextEditingController();
    contentController = TextEditingController();
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
}
