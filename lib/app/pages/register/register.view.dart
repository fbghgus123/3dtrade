import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register.controller.dart';
import 'widget/register.add.photo.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/register/widget/register.header.dart';

class RegisterView extends GetResponsiveView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Header(
        height: 50,
        headerContent: const RegisterHeader(),
        child: Column(
          children: [
            /// 사진 등록
            AddPhotoWidget(),

            /// 글 제목
            Text("글 제목"),

            /// 카테고리
            Text("카테고리"),

            /// 판매 가격
            Text("판매 가격"),

            /// 글 내용
            Text("글 내용"),
          ],
        ),
      ),
    );
  }
}
