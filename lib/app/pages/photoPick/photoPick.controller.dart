import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoPickController extends GetxController {
  late PermissionState _ps;

  /// 이미지를 포함한 폴더들
  RxList<AssetPathEntity> paths = RxList.empty();

  /// 나열될 이미지들
  RxList<Widget> media = RxList.empty();

  /// 선택된 이미지 인덱스들
  RxList<int> chooseImage = RxList();
  int currentPage = 0;
  late int lastPage;

  @override
  void onInit() async {
    super.onInit();
    await getPathList();
    await chooseFolder(paths[0]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// 권한 부여 및 모든 이미지 파일 폴더들을 가져옴
  Future getPathList() async {
    _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      paths.value = await PhotoManager.getAssetPathList();
    }
  }

  /// 선택한 폴더의 이미지들을 가져옴
  Future chooseFolder(AssetPathEntity folder) async {
    lastPage = currentPage;
    if (_ps.isAuth) {
      media.value +=
          (await folder.getAssetListPaged(page: currentPage, size: 60))
              .asMap()
              .entries
              .map((entry) => _convertWidget(entry.value, entry.key))
              .toList();
      currentPage++;
    }
  }

  /// 스크롤 다운시 이미지 불러옴
  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        chooseFolder(paths[0]);
      }
    }
  }

  /// AssetEntity를 Widget으로 변환
  Widget _convertWidget(AssetEntity entity, int index) {
    return FutureBuilder(
        future: entity.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    choiceImage(index);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child:
                              Image.memory(snapshot.data, fit: BoxFit.cover)),

                      /// 동영상 표시 아이콘
                      if (entity.type == AssetType.video)
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5, bottom: 5),
                            child: Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      /// 이미지 선택 시 마스크
                      if (chooseImage.contains(index))
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                border: Border.all(
                                    color: Colors.yellow,
                                    style: BorderStyle.solid,
                                    width: 5)))
                    ],
                  ),
                ));
          }
          return Container();
        });
  }

  choiceImage(int index) {
    print(chooseImage);
    if (chooseImage.contains(index)) {
      chooseImage.remove(index);
    } else {
      chooseImage.add(index);
    }
  }
}
