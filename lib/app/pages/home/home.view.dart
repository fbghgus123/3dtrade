import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => Text("Hello! ${controller.user.userName.value}")),
          Center(
            child: ElevatedButton(onPressed:(){controller.logout();}, child: const Text('Log out'))
          ),
        ],
      ),
    );
  }
}