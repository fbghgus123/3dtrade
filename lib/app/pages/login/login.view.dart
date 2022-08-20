import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';

class LoginView extends GetResponsiveView<LoginController> {
  @override
  Widget builder() {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            "현재 로그인 상태 : ${controller.isFirebaseAuthLogin() ? "로그인" : "로그아웃"}"),
        GestureDetector(
            onTap: () {
              controller.login();
            },
            child: Image.asset('asset/images/kakao_login_button.png')),
        GestureDetector(
          onTap: () {
            controller.logout();
          },
          child: Container(
            alignment: Alignment.center,
            height: 30,
            width: 100,
            color: Colors.green,
            child: Text("로그 아웃"),
          ),
        )
      ],
    )));
  }
}
