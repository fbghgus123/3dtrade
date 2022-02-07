import 'package:get/get.dart';
import 'package:getx_template/app/controllers/user.controller.dart';
import 'home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    /// Add other controllers if required
    /// The UserController is already bind globally
    // Get.lazyPut<UserController>(
    //   () => UserController(),
    // );
    
  }
}