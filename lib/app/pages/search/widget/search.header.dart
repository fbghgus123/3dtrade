import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/search/search.controller.dart';

class SearchHeader extends GetWidget<SearchController> {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close)),

              /// 헤더 텍스트
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "검색",
                      style: Fonts.w700(18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            /// 검색어 입력 창
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onSubmitted: controller.search,
                  controller: controller.searchTextController,
                  style: Fonts.w500(16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "검색어를 입력하세요"
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
