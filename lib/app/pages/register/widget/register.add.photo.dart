import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:tradeApp/app/pages/register/register.controller.dart';
import 'package:tradeApp/app/constants/app.paths.dart';

class AddPhotoWidget extends GetWidget<RegisterController> {
  const AddPhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          controller.images.value = await Get.toNamed(AppPaths.photoPick);
        } catch (e) {
          print("$e 아무 사진도 선택하지 않음");
        }
      },
      child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1)),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.grey,
          )),
    );
  }
}
