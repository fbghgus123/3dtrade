import 'package:get/get.dart';
import 'chatting.controller.dart';

class ChattingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChattingController>(
      () => ChattingController(),
    );
  }
}
