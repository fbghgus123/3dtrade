import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'search.controller.dart';

class SearchView extends GetResponsiveView<SearchController> {
  @override
  Widget builder() {
    return Scaffold(body: SafeArea(child: Text("검색 뷰")));
  }
}
