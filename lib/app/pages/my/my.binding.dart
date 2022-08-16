import 'package:get/get.dart';
import 'my.controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(
      () => MyController(),
    );
  }
}
