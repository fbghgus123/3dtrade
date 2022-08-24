import 'package:get/get.dart';
import 'photoPick.controller.dart';

class PhotoPickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoPickController>(
      () => PhotoPickController(),
    );
  }
}
