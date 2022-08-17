import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/search/search.controller.dart';

class SearchHeader extends GetWidget<SearchController> {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        /// 검색어 입력 창
        Expanded(
            child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 229, 229, 229),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              /// 텍스트 입력 부분
              // TextField(
              //   controller: _controller,
              //   decoration: const InputDecoration(
              //     border: InputBorder.none,
              //   ),
              // ),

              /// 돋보기 아이콘 부분
              IconButton(
                  onPressed: () {
                    print("찾기");
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
        ))
      ]),
    );
  }
}
