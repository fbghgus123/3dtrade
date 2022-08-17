import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/product/widget/product.content.dart';

import 'product.controller.dart';
import 'widget/product.image.dart';
import 'widget/product.info.dart';
import 'widget/product.bottomBar.dart';
import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/widget/headerBottomBar.dart';

/**
 * 상품 상세 정보 페이지
 */
class ProductView extends GetResponsiveView<ProductController> {
  @override
  Widget builder() {
    ProductData data = Get.arguments;
    return Scaffold(
        body: HeaderBottomBar(
      headerHeight: 100,
      bottomHeight: 100,
      headerContent: Text("헤더"),
      child: Column(
        children: [
          /// 상품 이미지 카루셀 슬라이드
          ProductImage(images: data.images ?? ["none.gif"]),

          /// User 정보

          /// 상품 정보
          ProductInfo(data: data),

          const Divider(),

          /// 상품 내용 글
          ProductContent(data: data),
        ],
      ),

      /// 바텀 바
      bottomContent: ProductBottomBar(data: data),
    ));
  }
}
