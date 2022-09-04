import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/product/widget/product.content.dart';

import 'product.controller.dart';
import 'widget/product.image.dart';
import 'widget/product.info.dart';
import 'widget/product.bottomBar.dart';
import 'widget/product.user.info.dart';
import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/widget/headerBottomBar.dart';

/**
 * 상품 상세 정보 페이지
 */
class ProductView extends GetResponsiveView<ProductController> {
  @override
  ProductController controller = Get.put(ProductController(Get.arguments));

  @override
  Widget builder() {
    return Scaffold(
        body: HeaderBottomBar(
      headerContent: Container(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// 상품 이미지 카루셀 슬라이드
            ProductImage(),

            /// User 정보
            ProductUserInfo(),

            /// 상품 정보
            ProductInfo(),

            const Divider(),

            /// 상품 내용 글
            ProductContent(),

            SizedBox(
              height: 100,
            )
          ],
        ),
      ),

      /// 바텀 바
      bottomContent: ProductBottomBar(data: controller.data),
    ));
  }
}
