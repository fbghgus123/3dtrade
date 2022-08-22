import 'package:get/get.dart';

import 'package:tradeApp/app/model/product.dart';
import 'package:tradeApp/app/db/product.firebase.db.dart';

class ProductListContrller extends GetxController {
  final productCon = ProductFirebaseDB();

  ProductListContrller() {
    getProductList();
  }

  RxList<ProductData> productList = RxList.empty();

  getProductList() async {
    productList.value = await productCon.selectProduct();
  }
}
