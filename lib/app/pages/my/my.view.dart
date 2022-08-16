import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my.controller.dart';

class MyView extends GetResponsiveView<MyController> {
  @override
  Widget builder() {
    return Scaffold(body: SafeArea(child: Text("마이 페이지 뷰")));
  }
}
