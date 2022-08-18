import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/product/product.controller.dart';

/**
 * 상품 상세 정보 페이지
 * 제목, 카테고리 등 상품 정보 담은 위젯
 */
class ProductInfo extends GetWidget<ProductController> {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text(
            "${controller.data.title}",
            style: Fonts.w700(24),
            overflow: TextOverflow.clip,
          ),

          /// 카테고리
          Text(
            "${controller.data.category}",
            style: Fonts.subText(14),
          )
        ],
      ),
    );
  }
}
