import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tradeApp/app/pages/chatting/chatting.controller.dart';
import 'package:tradeApp/app/constants/app.strings.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

class ChattingHeader extends GetWidget<ChattingController> {
  const ChattingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget productImage() {
      if (controller.productData.value?.images?[0] != null) {
        return FutureBuilder(
            future:
                controller.getFileURL(controller.productData.value!.images![0]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CachedNetworkImage(
                    imageUrl: snapshot.data as String, fit: BoxFit.cover);
              }
              else {
                return Image.asset(AppStrings.defaultUserImage, fit: BoxFit.cover);
              }
            });
      } else {
        return Image.asset(AppStrings.defaultUserImage, fit: BoxFit.cover);
      }
    }

    return Obx(() => Column(
          children: [
            /// 최상단 헤더
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.keyboard_backspace))
                ],
              ),
            ),
            const Divider(),

            /// 상품 정보
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: productImage()),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.productData.value?.title ?? "", style: Fonts.w500(16)),
                          const SizedBox(height: 5),
                          Text("${controller.productData.value?.price}원" ?? "", style: Fonts.subText(14),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
