import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.controller.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/main/widget/main.ProductListHeader.dart';
import 'package:tradeApp/app/pages/main/widget/main.ProductListItem.dart';
import 'package:tradeApp/app/pages/main/controller/main.ProductListController.dart';

/**
 * 메인 페이지 상품 리스트 화면
 */
class ProductList extends GetWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductListContrller controller = Get.put(ProductListContrller());
    return Obx(() => Header(
          height: 70,
          headerContent: const ProductListHeader(),
          child: Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: controller.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductListItem(data: controller.productList[index]);
                  })),
        ));
  }
}
