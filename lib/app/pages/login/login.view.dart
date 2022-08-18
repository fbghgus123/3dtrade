import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';

class LoginView extends GetResponsiveView<LoginController> {
  @override
  Widget builder() {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: GestureDetector(
          onTap: () {
            controller.login();
          },
          child: Image.asset('asset/images/kakao_login_button.png')),
    )));
  }
}
