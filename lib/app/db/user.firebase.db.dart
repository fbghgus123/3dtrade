import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:tradeApp/app/db/firebase.db.controller.dart';

import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/model/user.dart';

/**
 * User 관련 DB
 */
class UserFirebaseDB {
  late FirebaseDBController con;
  late DatabaseReference ref;
  late DatabaseReference pushRef;

  UserFirebaseDB() {
    con = FirebaseDBController();
    ref = con.getRef(DBPaths.user);
    pushRef = con.getPushRef(ref);
  }

  insertUser(UserData user) {
    ref.child(user.uid).set(user.toJson());
  }

  Future<bool> existUser(String uid) async {
    final snapshot = await ref.child(uid).get();
    if (snapshot.exists) return true;
    return false;
  }

  Future<UserData?> getUser(String uid) async {
    final snapshot = await ref.child(uid).get();
    if (snapshot.exists) {
      final tmp =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      return UserData(tmp);
    }
    return null;
  }
}
