import 'package:get/get.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    /// Bindings to be used globally
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
