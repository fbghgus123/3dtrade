import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.controller.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/main/widget/main.ProductListItem.dart';
import 'package:tradeApp/app/data/tmpProduct.dart'; // 임시 사용 데이터

/**
 * 메인 페이지 상품 리스트 화면
 */
class ProductList extends GetWidget<MainController> {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      height: 50,
      headerContent: Text("헤더"),
      child: Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: TmpProduct.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(data: TmpProduct.items[index]);
              })),
    );
  }
}
