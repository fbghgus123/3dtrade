import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/pages/search/search.controller.dart';

class SearchPrev extends GetWidget<SearchController> {
  const SearchPrev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("최근 검색어", style: Fonts.w500(20)),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Text("하이");
            }),
        const Divider(),
        Text("카테고리", style: Fonts.w500(20)),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Text("하이");
            }),
      ],
    );
  }
}
