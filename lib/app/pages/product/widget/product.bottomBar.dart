import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/pages/product/product.controller.dart';
import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';

/**
 * 제품 상세 페이지 바텀 바
 */
class ProductBottomBar extends GetWidget<ProductController> {
  final ProductData data;
  const ProductBottomBar({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 80,
      alignment: Alignment.center,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 좋아요 버튼
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),

          /// 상품 가격
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "${data.price}원",
              style: Fonts.w600(20),
            ),
          ),
          // 그냥 공백
          Expanded(
            child: Container(),
          ),

          /// 채팅으로 거래하기 버튼
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(
              "채팅으로 거래하기",
              style: Fonts.w500(12),
            ),
          )
        ],
      ),
    );
  }
}
