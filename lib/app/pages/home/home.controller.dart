import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  UserController user = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  logout() {
    Get.back();
  }
}
