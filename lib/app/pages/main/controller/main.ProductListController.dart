import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';
import 'package:tradeApp/app/db/firebase.storage.controller.dart';
import 'package:tradeApp/app/constants/app.strings.dart';

class ProductListContrller extends GetxController {
  final firebaseStorageController = FirebaseStorageController();
  final productCon = ProductFirebaseDB();

  ProductListContrller() {
    getProductList();
  }

  RxList<ProductData> productList = RxList.empty();

  getProductList() async {
    productList.value = await productCon.selectProduct();
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
