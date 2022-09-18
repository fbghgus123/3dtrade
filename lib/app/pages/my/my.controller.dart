import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

class MyController extends GetxController {
  late UserController userController;

  @override
  void onInit() {
    super.onInit();
    userController = Get.find();
  }
}
