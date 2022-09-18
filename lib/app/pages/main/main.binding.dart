import 'package:get/get.dart';
import 'package:tradeApp/app/pages/my/my.controller.dart';
import 'main.controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<MyController>(() => MyController());
  }
}
