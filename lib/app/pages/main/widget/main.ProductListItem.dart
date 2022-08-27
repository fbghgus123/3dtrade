import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/main/controller/main.ProductListController.dart';

/**
 * 상품 리스트 Item 요소
 */
class ProductListItem extends GetWidget<ProductListContrller> {
  final ProductData data;
  const ProductListItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPaths.product, arguments: data);
      },
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 상품 썸네일
                  Expanded(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: controller.getImage(data.images?[0])),
                    ),
                  ),

                  /// 상품 정보
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 상품 제목
                          Text(
                            data.title ?? "제목 없음",
                            style: Fonts.w500(20),
                            overflow: TextOverflow.ellipsis,
                          ),

                          /// 상품 상태
                          Text(
                            "판매합니다",
                            style: Fonts.subText(14),
                          ),

                          /// 상품 가격
                          Text("${data.price} 원", style: Fonts.w600(16)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
            ],
          )),
    );
  }
}
