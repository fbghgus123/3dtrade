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

  insertProduct(ProductData product) {
    pushRef.set(product.toJson());
  }

  Future<List<ProductData>> selectProduct() async {
    List<ProductData> result = [];
    DatabaseEvent event = await ref.orderByChild("date").once();
    final data = event.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    tmp.forEach((key, value) {
      result.add(ProductData(value));
    });
    return result;
  }
}
