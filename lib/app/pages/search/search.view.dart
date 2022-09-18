import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search.controller.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/search/widget/search.header.dart';

class SearchView extends GetResponsiveView<SearchController> {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Header(
        height: 100,
        headerContent: const SearchHeader(),
        child: Text("내용"),
      ),
    );
  }
}
