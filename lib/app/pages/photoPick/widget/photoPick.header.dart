import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/photoPick/photoPick.controller.dart';

class PhotoPickHeader extends GetWidget<PhotoPickController> {
  const PhotoPickHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        children: [
          /// 헤더 텍스트
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "사진 추가",
                  style: Fonts.w700(18),
                ),
              ],
            ),
          ),

          /// 닫기 버튼
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 닫기 버튼
                Container(
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close))),

                /// 등록 버튼
                GestureDetector(
                  onTap: () {
                    Get.back(result: controller.returnImages());
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "추가",
                        style: Fonts.w500(18),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
