import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';

class PhotoPickHeader extends StatelessWidget {
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
                  style: Fonts.w500(18),
                ),
              ],
            ),
          ),

          /// 닫기 버튼
          Container(
              height: 50,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close)))
        ],
      ),
    );
  }
}
