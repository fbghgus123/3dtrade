import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/constants/app.strings.dart';
import 'app.routing.dart';

void main() {

  runApp(
    GetMaterialApp(
      title: AppStrings.appTitle,
      initialRoute: AppPages.initial,
      initialBinding: AppPages.initialBinding,
      getPages: AppPages.routes,
    ),
  );
}
