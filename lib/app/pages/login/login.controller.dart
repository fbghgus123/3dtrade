import 'package:get/get.dart';
import 'package:getx_template/app/constants/app.paths.dart';
import 'package:getx_template/app/controllers/user.controller.dart';
import 'package:getx_template/app/data/user.provider.dart';

class LoginController extends GetxController {
  RxInt count = 0.obs;
 
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


  void increment() => count.value++;

  void login() async{
   /// fetch the user provider
   Map<String,dynamic> response = await Get.find<UserProvider>().login("1");
   if(response["data"] != null){
     /// We will just set the value in the user controller
     Get.find<UserController>().userName = response["data"]["name"].toString().obs;
     /// Navigate to Home page
     Get.toNamed(AppPaths.home);
   }
  }
}