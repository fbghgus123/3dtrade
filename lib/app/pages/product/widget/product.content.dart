import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/product/product.controller.dart';

class ProductContent extends GetWidget<ProductController> {
  const ProductContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      child: Text(
        "${controller.data.content}",
        style: Fonts.w400(16),
      ),
    );
  }
}
