import 'package:get/get.dart';
import 'package:getx_template/app/data/user.provider.dart';
import 'package:getx_template/app/pages/login/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    /// Make sure to add page related controller
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    /// Add other controllers if required
    /// The UserController is already bind globally
    // Get.lazyPut<UserController>(
    //   () => UserController(),
    // );

    /// Add the providers
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
    
    
  }
}