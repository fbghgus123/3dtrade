import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product.controller.dart';

class ProductView extends GetResponsiveView<ProductController> {
  @override
  Widget builder() {
    return Scaffold(body: SafeArea(child: Text("제품 포스트 뷰")));
  }
}
