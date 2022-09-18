import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/search/search.controller.dart';

class SearchList extends GetWidget<SearchController> {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return controller.productList[index];
        }));
  }
}