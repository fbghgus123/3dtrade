import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:tradeApp/app/db/firebase.db.controller.dart';

import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/model/product.dart';

/**
 * Product 관련 DB
 */
class ProductFirebaseDB {
  late FirebaseDBController con;
  late DatabaseReference ref;
  late DatabaseReference pushRef;

  ProductFirebaseDB() {
    con = FirebaseDBController();
    ref = con.getRef(DBPaths.product);
    pushRef = con.getPushRef(ref);
  }

  String? insertProduct(ProductData product) {
    product.setKey(pushRef.key ?? "");
    pushRef.set(product.toJson());
    return pushRef.key;
  }

  Future<List<ProductData>> selectProduct() async {
    List<ProductData> result = [];
    DatabaseEvent event = await ref.orderByChild("date").once();
    final data = event.snapshot.value;
    if (data == null) return List.empty();
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    tmp.forEach((key, value) {
      result.add(ProductData(value));
    });
    return result;
  }

  Future<ProductData> getProduct(String productKey) async {
    DatabaseEvent event = await ref.child(productKey).once();
    final data = event.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    return ProductData(tmp);
  }

  Future<List<ProductData>> searchProduct(String keyword) async {
    List<ProductData> result = [];
    DatabaseEvent event = await ref
        .orderByChild("title")
        .startAt(keyword)
        .endAt(keyword + "\uf8ff")
        .once();
    final data = event.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    tmp.forEach((key, value) {
      result.add(ProductData(value));
    });
    return result;
  }
  
  Future<List<ProductData>> searchProductWithCategory(String category) async {
    List<ProductData> result = [];
    DatabaseEvent event = await ref.orderByChild("category").equalTo(category).once();
    final data = event.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    tmp.forEach((key, value) {
      result.add(ProductData(value));
    });
    return result;
  }
}
