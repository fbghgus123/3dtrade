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
    ref = con.getRef(dbPaths.product);
    pushRef = con.getPushRef(ref);
  }

  insertProduct(ProductData product) {
    pushRef.set(product.toJson());
  }

  selectProduct() {
    var data = ref.orderByChild("date");
    print("머얏");
    print(data);
  }
}
