import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/constants/app.strings.dart';
import 'package:tradeApp/app/controllers/user.controller.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/db/keyword.firebase.db.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/model/product.dart';

class SearchController extends GetxController {
  late TextEditingController searchTextController;
  late ProductFirebaseDB productFirebaseDB;
  late FirebaseStorageController firebaseStorageController;
  late KeywordFirebaseDB keywordFirebaseDB;
  late UserController userController;
  final isSearch = RxBool(false);
  RxList<Widget> productList = RxList.empty();
  RxList<String> keywords = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    searchTextController = TextEditingController();
    productFirebaseDB = ProductFirebaseDB();
    firebaseStorageController = FirebaseStorageController();
    keywordFirebaseDB = KeywordFirebaseDB();
    userController = Get.find();
  }

  @override
  void onReady() {
    super.onReady();
    getKeywords();
  }

  @override
  void onClose() {}

  getKeywords() async {
    keywords.value = await keywordFirebaseDB.getKeywords(userController?.uid ?? "");
  }

  search(String keyword) async {
    final data = await productFirebaseDB.searchProduct(keyword);
    productList.value = data.map((product) => convertProductItem(product)).toList();
    isSearch.value = true;
    keywordFirebaseDB.setKeyword(userController?.uid ?? "client", keyword);
  }

  searchWithCategory(String category) async {
    final data = await productFirebaseDB.searchProductWithCategory(category);
    productList.value = data.map((product) => convertProductItem(product)).toList();
    isSearch.value = true;
  }

  Widget convertProductItem(ProductData data) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPaths.product, arguments: data);
      },
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 상품 썸네일
                  Expanded(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: getImage(data.images?[0])),
                    ),
                  ),

                  /// 상품 정보
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// 상품 제목
                          Text(
                            data.title ?? "제목 없음",
                            style: Fonts.w500(20),
                            overflow: TextOverflow.ellipsis,
                          ),

                          /// 상품 상태
                          Text(
                            "판매합니다",
                            style: Fonts.subText(14),
                          ),

                          /// 상품 가격
                          Text("${data.price} 원", style: Fonts.w600(16)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
            ],
          )),
    );
  }

  getFileURL(String? path) {
    if (path == null) return null;
    try {
      return firebaseStorageController.getFileURL(path);
    } catch (e) {
      return null;
    }
  }

  Widget getImage(String? path) {
    return FutureBuilder(
        future: getFileURL(path),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return CachedNetworkImage(
                imageUrl: snapshot.data,
                fit: BoxFit.cover,
              );
            }
          }
          return Image.asset(AppStrings.defaultUserImage, fit: BoxFit.cover);
        });
  }
}