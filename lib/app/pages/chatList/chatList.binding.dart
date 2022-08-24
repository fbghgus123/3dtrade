import 'package:get/get.dart';
import 'chatList.controller.dart';

class ChatListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatListController>(
      () => ChatListController(),
    );
  }
}
