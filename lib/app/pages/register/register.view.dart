import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register.controller.dart';
import 'package:tradeApp/app/widget/header.dart';
import 'package:tradeApp/app/pages/register/widget/register.header.dart';

class RegisterView extends GetWidget<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      height: 50,
      headerContent: const RegisterHeader(),
      child: Text("내용"),
    );
  }
}
