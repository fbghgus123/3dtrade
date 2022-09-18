import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/pages/search/widget/search.list.dart';
import 'package:tradeApp/app/pages/search/widget/search.prev.dart';

import 'search.controller.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/search/widget/search.header.dart';

class SearchView extends GetResponsiveView<SearchController> {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
          child: Stack(
                children: [
                  SearchHeader(),
                  Container(
                    padding: EdgeInsets.only(top: 115, left: 20, right: 20),
                    child:
                        controller.isSearch.value ? SearchList() : SearchPrev(),
                  )
                ],
              ),
        )));
  }
}
