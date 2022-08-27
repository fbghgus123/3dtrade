import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register.controller.dart';
import 'widget/register.add.photo.dart';
import 'widget/register.insert.title.dart';
import 'widget/register.insert.price.dart';
import 'widget/register.insert.category.dart';
import 'widget/register.insert.content.dart';
import 'widget/register.image.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/register/widget/register.header.dart';

class RegisterView extends GetResponsiveView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Header(
          height: 50,
          headerContent: const RegisterHeader(),
          child: Obx(
            () => Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// 사진 등록
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /// 사진 등록 버튼
                              const AddPhotoWidget(),

                              /// 선택한 사진들
                              ...controller.images
                                  .map((image) => RegisterImage(image: image))
                            ],
                          ),
                        ),
                      ),

                      /// 글 제목
                      InsertTitleWidget(),

                      /// 카테고리
                      InsertCategoryWidget(),

                      /// 판매 가격
                      InsertPriceWidget(),

                      /// 글 내용
                      InsertContentWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
