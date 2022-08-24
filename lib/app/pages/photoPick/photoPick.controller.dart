import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoPickController extends GetxController {
  late PermissionState _ps;
  @override
  void onInit() async {
    super.onInit();
    _ps = await PhotoManager.requestPermissionExtend();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getPathList() async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    print(paths);
  }
}
