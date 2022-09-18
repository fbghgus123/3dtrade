import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:tradeApp/app/constants/app.paths.dart';
import 'package:tradeApp/app/db/firebase.db.controller.dart';
import 'package:tradeApp/app/model/keyword.dart';

class KeywordFirebaseDB {
  late FirebaseDBController con;
  late DatabaseReference ref;
  late DatabaseReference pushRef;

  KeywordFirebaseDB() {
    con = FirebaseDBController();
    ref = con.getRef(DBPaths.keyword);
  }

  Future<String?> isExistKeyword(String uid, String keyword) async {
    final savedKeyword =
        await ref.child(uid).orderByChild("keyword").equalTo(keyword).once();
    final data = savedKeyword.snapshot.value;
    if (data == null) {
      return null;
    }
    return savedKeyword.snapshot.children.first.key;
  }

  setKeyword(String uid, String keyword) async {
    final isExist = await isExistKeyword(uid, keyword);
    if (isExist != null) {
      ref.child("$uid/$isExist").orderByChild("keyword").equalTo(keyword).ref.set({
        "uid": uid,
        "keyword": keyword,
        "createdAt": DateTime.now().millisecondsSinceEpoch
      });
    } else {
      final keywordData = Keyword({
        "uid": uid,
        "keyword": keyword,
      });
      ref.child(uid).push().set(keywordData.toJson());
    }
  }

  Future<List<String>> getKeywords(String uid) async {
    List<String> result = [];
    final keywords = await ref.child(uid).once();
    final data = keywords.snapshot.value;
    final tmp = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;
    tmp.forEach((key, value) {
      result.add(value["keyword"]);
    });
    return result;
  }
}
