import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_auth/kakao_flutter_sdk_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/constants/app.strings.dart';
import 'app.routing.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(nativeAppKey: '${dotenv.env["KAKAO_LOGIN_API_KEY"]}');
  runApp(
    GetMaterialApp(
      title: AppStrings.appTitle,
      initialRoute: AppPages.initial,
      initialBinding: AppPages.initialBinding,
      getPages: AppPages.routes,
    ),
  );
}
